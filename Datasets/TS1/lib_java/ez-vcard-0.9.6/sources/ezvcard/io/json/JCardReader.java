package ezvcard.io.json;

import ezvcard.VCard;
import ezvcard.VCardDataType;
import ezvcard.VCardVersion;
import ezvcard.io.CannotParseException;
import ezvcard.io.EmbeddedVCardException;
import ezvcard.io.SkipMeException;
import ezvcard.io.StreamReader;
import ezvcard.io.json.JCardRawReader;
import ezvcard.io.scribe.RawPropertyScribe;
import ezvcard.io.scribe.VCardPropertyScribe;
import ezvcard.parameter.VCardParameters;
import ezvcard.property.RawProperty;
import ezvcard.property.VCardProperty;
import ezvcard.util.IOUtils;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.io.StringReader;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/json/JCardReader.class */
public class JCardReader extends StreamReader {
    private final JCardRawReader reader;

    public JCardReader(String json) {
        this(new StringReader(json));
    }

    public JCardReader(InputStream in) {
        this(IOUtils.utf8Reader(in));
    }

    public JCardReader(File file) throws FileNotFoundException {
        this(IOUtils.utf8Reader(file));
    }

    public JCardReader(Reader reader) {
        this.reader = new JCardRawReader(reader);
    }

    @Override // ezvcard.io.StreamReader
    protected VCard _readNext() throws IOException {
        if (this.reader.eof()) {
            return null;
        }
        this.warnings.clear();
        JCardDataStreamListenerImpl listener = new JCardDataStreamListenerImpl();
        this.reader.readNext(listener);
        VCard vcard = listener.vcard;
        if (vcard != null && !listener.versionFound) {
            this.warnings.add(Integer.valueOf(this.reader.getLineNum()), null, 29, new Object[0]);
        }
        return vcard;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.reader.close();
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/json/JCardReader$JCardDataStreamListenerImpl.class */
    private class JCardDataStreamListenerImpl implements JCardRawReader.JCardDataStreamListener {
        private VCard vcard;
        private boolean versionFound;

        private JCardDataStreamListenerImpl() {
            this.vcard = null;
            this.versionFound = false;
        }

        @Override // ezvcard.io.json.JCardRawReader.JCardDataStreamListener
        public void beginVCard() {
            this.vcard = new VCard();
            this.vcard.setVersion(VCardVersion.V4_0);
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // ezvcard.io.json.JCardRawReader.JCardDataStreamListener
        public void readProperty(String group, String propertyName, VCardParameters parameters, VCardDataType dataType, JCardValue value) {
            VCardPropertyScribe.Result result;
            if (!"version".equalsIgnoreCase(propertyName)) {
                VCardPropertyScribe<? extends VCardProperty> scribe = JCardReader.this.index.getPropertyScribe(propertyName);
                if (scribe == null) {
                    scribe = new RawPropertyScribe(propertyName);
                }
                try {
                    result = scribe.parseJson(value, dataType, parameters);
                    for (String warning : result.getWarnings()) {
                        JCardReader.this.warnings.add(Integer.valueOf(JCardReader.this.reader.getLineNum()), warning, propertyName);
                    }
                } catch (CannotParseException e) {
                    result = new RawPropertyScribe(propertyName).parseJson(value, dataType, parameters);
                    String valueStr = ((RawProperty) result.getProperty()).getValue();
                    JCardReader.this.warnings.add(Integer.valueOf(JCardReader.this.reader.getLineNum()), propertyName, 25, valueStr, e.getMessage());
                } catch (EmbeddedVCardException e2) {
                    JCardReader.this.warnings.add(Integer.valueOf(JCardReader.this.reader.getLineNum()), propertyName, 31, new Object[0]);
                    return;
                } catch (SkipMeException e3) {
                    JCardReader.this.warnings.add(Integer.valueOf(JCardReader.this.reader.getLineNum()), propertyName, 22, e3.getMessage());
                    return;
                }
                VCardProperty property = result.getProperty();
                property.setGroup(group);
                this.vcard.addProperty(property);
                return;
            }
            this.versionFound = true;
            VCardVersion version = VCardVersion.valueOfByStr(value.asSingle());
            if (version != VCardVersion.V4_0) {
                JCardReader.this.warnings.add(Integer.valueOf(JCardReader.this.reader.getLineNum()), propertyName, 30, new Object[0]);
            }
        }
    }
}
