package ezvcard.io.text;

import ezvcard.VCard;
import ezvcard.VCardDataType;
import ezvcard.VCardVersion;
import ezvcard.io.CannotParseException;
import ezvcard.io.EmbeddedVCardException;
import ezvcard.io.SkipMeException;
import ezvcard.io.StreamReader;
import ezvcard.io.scribe.RawPropertyScribe;
import ezvcard.io.scribe.VCardPropertyScribe;
import ezvcard.parameter.Encoding;
import ezvcard.parameter.VCardParameters;
import ezvcard.property.Label;
import ezvcard.property.RawProperty;
import ezvcard.property.VCardProperty;
import ezvcard.util.IOUtils;
import ezvcard.util.org.apache.commons.codec.DecoderException;
import ezvcard.util.org.apache.commons.codec.net.QuotedPrintableCodec;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringReader;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/text/VCardReader.class */
public class VCardReader extends StreamReader {
    private Charset defaultQuotedPrintableCharset;
    private final VCardRawReader reader;

    public VCardReader(String str) {
        this(new StringReader(str));
    }

    public VCardReader(InputStream in) {
        this(new InputStreamReader(in));
    }

    public VCardReader(File file) throws FileNotFoundException {
        this(new FileReader(file));
    }

    public VCardReader(Reader reader) {
        this.reader = new VCardRawReader(reader);
        this.defaultQuotedPrintableCharset = this.reader.getEncoding();
        if (this.defaultQuotedPrintableCharset == null) {
            this.defaultQuotedPrintableCharset = Charset.defaultCharset();
        }
    }

    public boolean isCaretDecodingEnabled() {
        return this.reader.isCaretDecodingEnabled();
    }

    public void setCaretDecodingEnabled(boolean enable) {
        this.reader.setCaretDecodingEnabled(enable);
    }

    public Charset getDefaultQuotedPrintableCharset() {
        return this.defaultQuotedPrintableCharset;
    }

    public void setDefaultQuotedPrintableCharset(Charset charset) {
        this.defaultQuotedPrintableCharset = charset;
    }

    @Override // ezvcard.io.StreamReader
    protected VCard _readNext() throws IOException {
        VCardRawLine line;
        VCard root = null;
        LinkedList<VCard> vcardStack = new LinkedList<>();
        LinkedList<List<Label>> labelStack = new LinkedList<>();
        EmbeddedVCardException embeddedVCardException = null;
        while (true) {
            try {
                line = this.reader.readLine();
            } catch (VCardParseException e) {
                if (!vcardStack.isEmpty()) {
                    this.warnings.add(Integer.valueOf(this.reader.getLineNum()), null, 27, e.getLine());
                }
            }
            if (line == null) {
                break;
            }
            if ("BEGIN".equalsIgnoreCase(line.getName()) && "VCARD".equalsIgnoreCase(line.getValue())) {
                VCard vcard = new VCard();
                vcard.setVersion(this.reader.getVersion());
                vcardStack.add(vcard);
                labelStack.add(new ArrayList<>());
                if (root == null) {
                    root = vcard;
                }
                if (embeddedVCardException != null) {
                    embeddedVCardException.injectVCard(vcard);
                    embeddedVCardException = null;
                }
            } else if (vcardStack.isEmpty()) {
                continue;
            } else if ("VERSION".equalsIgnoreCase(line.getName())) {
                vcardStack.getLast().setVersion(this.reader.getVersion());
            } else if ("END".equalsIgnoreCase(line.getName()) && "VCARD".equalsIgnoreCase(line.getValue())) {
                VCard curVCard = vcardStack.removeLast();
                List<Label> labels = labelStack.removeLast();
                assignLabels(curVCard, labels);
                if (vcardStack.isEmpty()) {
                    break;
                }
            } else {
                String group = line.getGroup();
                VCardParameters parameters = line.getParameters();
                String name = line.getName();
                String value = line.getValue();
                if (embeddedVCardException != null) {
                    embeddedVCardException.injectVCard(null);
                    embeddedVCardException = null;
                }
                VCard curVCard2 = vcardStack.getLast();
                VCardVersion version = curVCard2.getVersion();
                processNamelessParameters(parameters);
                processQuotedMultivaluedTypeParams(parameters);
                try {
                    value = decodeQuotedPrintable(name, parameters, value);
                } catch (DecoderException e2) {
                    this.warnings.add(Integer.valueOf(this.reader.getLineNum()), name, 38, e2.getMessage());
                }
                VCardPropertyScribe<? extends VCardProperty> scribe = this.index.getPropertyScribe(name);
                if (scribe == null) {
                    scribe = new RawPropertyScribe(name);
                }
                VCardDataType dataType = parameters.getValue();
                if (dataType == null) {
                    dataType = scribe.defaultDataType(version);
                } else {
                    parameters.setValue(null);
                }
                try {
                    VCardPropertyScribe.Result<T> parseText = scribe.parseText(value, dataType, version, parameters);
                    for (String warning : parseText.getWarnings()) {
                        this.warnings.add(Integer.valueOf(this.reader.getLineNum()), name, warning);
                    }
                    VCardProperty property = parseText.getProperty();
                    property.setGroup(group);
                    if (property instanceof Label) {
                        labelStack.getLast().add((Label) property);
                    } else {
                        curVCard2.addProperty(property);
                    }
                } catch (CannotParseException e3) {
                    this.warnings.add(Integer.valueOf(this.reader.getLineNum()), name, 25, value, e3.getMessage());
                    VCardProperty property2 = new RawProperty(name, value);
                    property2.setGroup(group);
                    curVCard2.addProperty(property2);
                } catch (EmbeddedVCardException e4) {
                    VCardProperty property3 = e4.getProperty();
                    if (value.length() == 0 || version == VCardVersion.V2_1) {
                        embeddedVCardException = e4;
                    } else {
                        VCardReader agentReader = new VCardReader(VCardPropertyScribe.unescape(value));
                        try {
                            VCard nestedVCard = agentReader.readNext();
                            if (nestedVCard != null) {
                                e4.injectVCard(nestedVCard);
                            }
                            for (String w : agentReader.getWarnings()) {
                                this.warnings.add(Integer.valueOf(this.reader.getLineNum()), name, 26, w);
                            }
                            IOUtils.closeQuietly(agentReader);
                        } catch (IOException e5) {
                            for (String w2 : agentReader.getWarnings()) {
                                this.warnings.add(Integer.valueOf(this.reader.getLineNum()), name, 26, w2);
                            }
                            IOUtils.closeQuietly(agentReader);
                        } catch (Throwable th) {
                            for (String w3 : agentReader.getWarnings()) {
                                this.warnings.add(Integer.valueOf(this.reader.getLineNum()), name, 26, w3);
                            }
                            IOUtils.closeQuietly(agentReader);
                            throw th;
                        }
                    }
                    curVCard2.addProperty(property3);
                } catch (SkipMeException e6) {
                    this.warnings.add(Integer.valueOf(this.reader.getLineNum()), name, 22, e6.getMessage());
                }
            }
        }
        return root;
    }

    private void processNamelessParameters(VCardParameters parameters) {
        String str;
        List<String> namelessParamValues = parameters.get(null);
        for (String paramValue : namelessParamValues) {
            if (VCardDataType.find(paramValue) != null) {
                str = VCardParameters.VALUE;
            } else if (Encoding.find(paramValue) != null) {
                str = VCardParameters.ENCODING;
            } else {
                str = VCardParameters.TYPE;
            }
            String paramName = str;
            parameters.put(paramName, paramValue);
        }
        parameters.removeAll(null);
    }

    private void processQuotedMultivaluedTypeParams(VCardParameters parameters) {
        for (String typeParameter : parameters.getTypes()) {
            if (typeParameter.contains(",")) {
                parameters.removeTypes();
                String[] arr$ = typeParameter.split(",");
                for (String splitValue : arr$) {
                    parameters.addType(splitValue);
                }
            }
        }
    }

    private String decodeQuotedPrintable(String name, VCardParameters parameters, String value) throws DecoderException {
        Charset charset;
        if (parameters.getEncoding() != Encoding.QUOTED_PRINTABLE) {
            return value;
        }
        parameters.setEncoding(null);
        String charsetStr = parameters.getCharset();
        if (charsetStr == null) {
            charset = this.defaultQuotedPrintableCharset;
        } else {
            try {
                charset = Charset.forName(charsetStr);
            } catch (Throwable th) {
                charset = this.defaultQuotedPrintableCharset;
                this.warnings.add(Integer.valueOf(this.reader.getLineNum()), name, 23, charsetStr, charset.name());
            }
        }
        QuotedPrintableCodec codec = new QuotedPrintableCodec(charset.name());
        return codec.decode(value);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.reader.close();
    }
}
