package ezvcard.io.text;

import ezvcard.VCardVersion;
import ezvcard.parameter.VCardParameters;
import ezvcard.util.StringUtils;
import java.io.Closeable;
import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/text/VCardRawReader.class */
public class VCardRawReader implements Closeable {
    private final FoldedLineReader reader;
    private boolean caretDecodingEnabled = true;
    private VCardVersion version = VCardVersion.V2_1;

    public VCardRawReader(Reader reader) {
        this.reader = new FoldedLineReader(reader);
    }

    public int getLineNum() {
        return this.reader.getLineNum();
    }

    public VCardVersion getVersion() {
        return this.version;
    }

    public VCardRawLine readLine() throws IOException {
        String line = this.reader.readLine();
        if (line == null) {
            return null;
        }
        String group = null;
        String propertyName = null;
        VCardParameters parameters = new VCardParameters();
        String value = null;
        char escapeChar = 0;
        boolean inQuotes = false;
        StringBuilder buffer = new StringBuilder();
        String curParamName = null;
        int i = 0;
        while (true) {
            if (i >= line.length()) {
                break;
            }
            char ch = line.charAt(i);
            if (escapeChar != 0) {
                if (escapeChar == '\\') {
                    if (ch == '\\') {
                        buffer.append(ch);
                    } else if (ch == 'n' || ch == 'N') {
                        buffer.append(StringUtils.NEWLINE);
                    } else if (ch == '\"' && this.version != VCardVersion.V2_1) {
                        buffer.append(ch);
                    } else if (ch == ';' && this.version == VCardVersion.V2_1) {
                        buffer.append(ch);
                    } else {
                        buffer.append(escapeChar).append(ch);
                    }
                } else if (escapeChar == '^') {
                    if (ch == '^') {
                        buffer.append(ch);
                    } else if (ch == 'n') {
                        buffer.append(StringUtils.NEWLINE);
                    } else if (ch == '\'') {
                        buffer.append('\"');
                    } else {
                        buffer.append(escapeChar).append(ch);
                    }
                }
                escapeChar = 0;
            } else if (ch == '\\' || (ch == '^' && this.version != VCardVersion.V2_1 && this.caretDecodingEnabled)) {
                escapeChar = ch;
            } else if (ch == '.' && group == null && propertyName == null) {
                group = buffer.toString();
                buffer.setLength(0);
            } else if ((ch == ';' || ch == ':') && !inQuotes) {
                if (propertyName == null) {
                    propertyName = buffer.toString();
                } else {
                    String paramValue = buffer.toString();
                    if (this.version == VCardVersion.V2_1) {
                        paramValue = StringUtils.ltrim(paramValue);
                    }
                    parameters.put(curParamName, paramValue);
                    curParamName = null;
                }
                buffer.setLength(0);
                if (ch == ':') {
                    if (i < line.length() - 1) {
                        value = line.substring(i + 1);
                    } else {
                        value = "";
                    }
                }
            } else if (ch == ',' && !inQuotes && this.version != VCardVersion.V2_1) {
                parameters.put(curParamName, buffer.toString());
                buffer.setLength(0);
            } else if (ch == '=' && curParamName == null) {
                String paramName = buffer.toString();
                if (this.version == VCardVersion.V2_1) {
                    paramName = StringUtils.rtrim(paramName);
                }
                curParamName = paramName;
                buffer.setLength(0);
            } else if (ch == '\"' && this.version != VCardVersion.V2_1) {
                inQuotes = !inQuotes;
            } else {
                buffer.append(ch);
            }
            i++;
        }
        if (propertyName == null || value == null) {
            throw new VCardParseException(line);
        }
        if ("VERSION".equalsIgnoreCase(propertyName)) {
            VCardVersion version = VCardVersion.valueOfByStr(value);
            if (version == null) {
                throw new InvalidVersionException(value, line);
            }
            this.version = version;
        }
        return new VCardRawLine(group, propertyName, parameters, value.trim());
    }

    public boolean isCaretDecodingEnabled() {
        return this.caretDecodingEnabled;
    }

    public void setCaretDecodingEnabled(boolean enable) {
        this.caretDecodingEnabled = enable;
    }

    public Charset getEncoding() {
        return this.reader.getEncoding();
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.reader.close();
    }
}
