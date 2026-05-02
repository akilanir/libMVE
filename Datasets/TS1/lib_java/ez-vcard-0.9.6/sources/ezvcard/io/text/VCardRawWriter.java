package ezvcard.io.text;

import ezvcard.VCardVersion;
import ezvcard.parameter.Encoding;
import ezvcard.parameter.VCardParameters;
import java.io.Closeable;
import java.io.Flushable;
import java.io.IOException;
import java.io.Writer;
import java.nio.charset.Charset;
import java.util.BitSet;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/text/VCardRawWriter.class */
public class VCardRawWriter implements Closeable, Flushable {
    private static final Pattern quoteMeRegex = Pattern.compile(".*?[,:;].*");
    private static final Pattern newlineRegex = Pattern.compile("\\r\\n|\\r|\\n");
    private static final Pattern propertyNameRegex = Pattern.compile("(?i)[-a-z0-9]+");
    private static final Map<VCardVersion, BitSet> invalidParamValueChars;
    private final FoldedLineWriter writer;
    private boolean caretEncodingEnabled = false;
    private ProblemsListener problemsListener;
    private VCardVersion version;

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/text/VCardRawWriter$ProblemsListener.class */
    public interface ProblemsListener {
        void onParameterValueChanged(String str, String str2, String str3, String str4);
    }

    static {
        BitSet controlChars = new BitSet(128);
        controlChars.set(0, 31);
        controlChars.set(127);
        controlChars.set(9, false);
        controlChars.set(10, false);
        controlChars.set(13, false);
        Map<VCardVersion, BitSet> map = new HashMap<>();
        BitSet bitSet = new BitSet(128);
        bitSet.or(controlChars);
        bitSet.set(44);
        bitSet.set(46);
        bitSet.set(58);
        bitSet.set(61);
        bitSet.set(91);
        bitSet.set(93);
        map.put(VCardVersion.V2_1, bitSet);
        BitSet bitSet2 = new BitSet(128);
        bitSet2.or(controlChars);
        map.put(VCardVersion.V3_0, bitSet2);
        map.put(VCardVersion.V4_0, bitSet2);
        invalidParamValueChars = Collections.unmodifiableMap(map);
    }

    public VCardRawWriter(Writer writer, VCardVersion version) {
        this.writer = new FoldedLineWriter(writer);
        this.version = version;
    }

    public FoldedLineWriter getFoldedLineWriter() {
        return this.writer;
    }

    public boolean isCaretEncodingEnabled() {
        return this.caretEncodingEnabled;
    }

    public void setCaretEncodingEnabled(boolean enable) {
        this.caretEncodingEnabled = enable;
    }

    public VCardVersion getVersion() {
        return this.version;
    }

    public void setVersion(VCardVersion version) {
        this.version = version;
    }

    public ProblemsListener getProblemsListener() {
        return this.problemsListener;
    }

    public void setProblemsListener(ProblemsListener problemsListener) {
        this.problemsListener = problemsListener;
    }

    public void writeBeginComponent(String componentName) throws IOException {
        writeProperty("BEGIN", componentName);
    }

    public void writeEndComponent(String componentName) throws IOException {
        writeProperty("END", componentName);
    }

    public void writeVersion() throws IOException {
        writeProperty("VERSION", this.version.getVersion());
    }

    public void writeProperty(String propertyName, String value) throws IOException {
        writeProperty(null, propertyName, new VCardParameters(), value);
    }

    public void writeProperty(String group, String propertyName, VCardParameters parameters, String value) throws IOException {
        if (group != null && !propertyNameRegex.matcher(group).matches()) {
            throw new IllegalArgumentException("Group contains invalid characters.  Valid characters are letters, numbers, and hyphens: " + group);
        }
        if (!propertyNameRegex.matcher(propertyName).matches()) {
            throw new IllegalArgumentException("Property name contains invalid characters.  Valid characters are letters, numbers, and hyphens: " + propertyName);
        }
        String value2 = sanitizeValue(parameters, value);
        boolean quotedPrintable = parameters.getEncoding() == Encoding.QUOTED_PRINTABLE;
        Charset charset = null;
        if (quotedPrintable) {
            String charsetParam = parameters.getCharset();
            if (charsetParam == null) {
                charset = Charset.forName("UTF-8");
            } else {
                try {
                    charset = Charset.forName(charsetParam);
                } catch (Throwable th) {
                    charset = Charset.forName("UTF-8");
                }
            }
            parameters.setCharset(charset.name());
        }
        if (group != null) {
            this.writer.append((CharSequence) group);
            this.writer.append('.');
        }
        this.writer.append((CharSequence) propertyName);
        Iterator i$ = parameters.iterator();
        while (i$.hasNext()) {
            Map.Entry<String, List<String>> parameter = i$.next();
            String parameterName = parameter.getKey();
            List<String> parameterValues = parameter.getValue();
            if (!parameterValues.isEmpty()) {
                if (this.version == VCardVersion.V2_1) {
                    boolean isTypeParameter = VCardParameters.TYPE.equalsIgnoreCase(parameterName);
                    Iterator i$2 = parameterValues.iterator();
                    while (i$2.hasNext()) {
                        String parameterValue = sanitizeParameterValue(i$2.next(), parameterName, propertyName);
                        if (isTypeParameter) {
                            this.writer.append(';').append((CharSequence) parameterValue.toUpperCase());
                        } else {
                            this.writer.append(';').append((CharSequence) parameterName).append('=').append((CharSequence) parameterValue);
                        }
                    }
                } else {
                    boolean first = true;
                    this.writer.append(';').append((CharSequence) parameterName).append('=');
                    for (String parameterValue2 : parameterValues) {
                        if (!first) {
                            this.writer.append(',');
                        }
                        String parameterValue3 = sanitizeParameterValue(parameterValue2, parameterName, propertyName);
                        if (quoteMeRegex.matcher(parameterValue3).matches()) {
                            this.writer.append('\"');
                            this.writer.append((CharSequence) parameterValue3);
                            this.writer.append('\"');
                        } else {
                            this.writer.append((CharSequence) parameterValue3);
                        }
                        first = false;
                    }
                }
            }
        }
        this.writer.append(':');
        this.writer.append(value2, quotedPrintable, charset);
        this.writer.append((CharSequence) this.writer.getNewline());
    }

    private String sanitizeValue(VCardParameters parameters, String value) {
        if (value == null) {
            return "";
        }
        if (this.version == VCardVersion.V2_1 && containsNewlines(value)) {
            parameters.setEncoding(Encoding.QUOTED_PRINTABLE);
            return value;
        }
        return escapeNewlines(value);
    }

    private String sanitizeParameterValue(String parameterValue, String parameterName, String propertyName) {
        String modifiedValue = null;
        boolean valueChanged = false;
        switch (this.version) {
            case V2_1:
                String modifiedValue2 = removeInvalidParameterValueChars(parameterValue);
                String modifiedValue3 = newlineRegex.matcher(modifiedValue2).replaceAll(" ");
                valueChanged = parameterValue != modifiedValue3;
                modifiedValue = modifiedValue3.replace("\\", "\\\\").replace(";", "\\;");
                break;
            case V3_0:
                String modifiedValue4 = removeInvalidParameterValueChars(parameterValue);
                if (this.caretEncodingEnabled) {
                    valueChanged = modifiedValue4 != parameterValue;
                    modifiedValue = applyCaretEncoding(modifiedValue4);
                    break;
                } else {
                    modifiedValue = newlineRegex.matcher(modifiedValue4.replace('\"', '\'')).replaceAll(" ");
                    valueChanged = modifiedValue != parameterValue;
                    break;
                }
            case V4_0:
                String modifiedValue5 = removeInvalidParameterValueChars(parameterValue);
                if (this.caretEncodingEnabled) {
                    valueChanged = modifiedValue5 != parameterValue;
                    modifiedValue = applyCaretEncoding(modifiedValue5);
                    break;
                } else {
                    String modifiedValue6 = modifiedValue5.replace('\"', '\'');
                    valueChanged = modifiedValue6 != parameterValue;
                    modifiedValue = newlineRegex.matcher(modifiedValue6).replaceAll("\\\\\\n");
                    break;
                }
        }
        if (valueChanged && this.problemsListener != null) {
            this.problemsListener.onParameterValueChanged(propertyName, parameterName, parameterValue, modifiedValue);
        }
        return modifiedValue;
    }

    private String removeInvalidParameterValueChars(String value) {
        BitSet invalidChars = invalidParamValueChars.get(this.version);
        StringBuilder sb = null;
        for (int i = 0; i < value.length(); i++) {
            char ch = value.charAt(i);
            if (invalidChars.get(ch)) {
                if (sb == null) {
                    sb = new StringBuilder(value.length());
                    sb.append(value.substring(0, i));
                }
            } else if (sb != null) {
                sb.append(ch);
            }
        }
        return sb == null ? value : sb.toString();
    }

    private String applyCaretEncoding(String value) {
        return newlineRegex.matcher(value.replace("^", "^^")).replaceAll("^n").replace("\"", "^'");
    }

    private String escapeNewlines(String text) {
        return newlineRegex.matcher(text).replaceAll("\\\\n");
    }

    private boolean containsNewlines(String text) {
        return newlineRegex.matcher(text).find();
    }

    @Override // java.io.Flushable
    public void flush() throws IOException {
        this.writer.flush();
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.writer.close();
    }
}
