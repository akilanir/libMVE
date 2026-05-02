package org.ini4j.spi;

/* loaded from: ini4j-0.5.4.jar:org/ini4j/spi/WinEscapeTool.class */
public class WinEscapeTool extends EscapeTool {
    private static final int ANSI_HEX_DIGITS = 2;
    private static final int ANSI_OCTAL_DIGITS = 3;
    private static final int OCTAL_RADIX = 8;
    private static final WinEscapeTool INSTANCE = new WinEscapeTool();

    public static WinEscapeTool getInstance() {
        return INSTANCE;
    }

    @Override // org.ini4j.spi.EscapeTool
    void escapeBinary(StringBuilder buff, char c) {
        buff.append("\\x");
        buff.append(HEX[(c >>> 4) & 15]);
        buff.append(HEX[c & 15]);
    }

    @Override // org.ini4j.spi.EscapeTool
    int unescapeBinary(StringBuilder buff, char escapeType, String line, int index) {
        int ret = index;
        if (escapeType == 'x') {
            try {
                buff.append((char) Integer.parseInt(line.substring(index, index + ANSI_HEX_DIGITS), 16));
                ret = index + ANSI_HEX_DIGITS;
            } catch (Exception x) {
                throw new IllegalArgumentException("Malformed \\xHH encoding.", x);
            }
        } else if (escapeType == 'o') {
            try {
                buff.append((char) Integer.parseInt(line.substring(index, index + ANSI_OCTAL_DIGITS), OCTAL_RADIX));
                ret = index + ANSI_OCTAL_DIGITS;
            } catch (Exception x2) {
                throw new IllegalArgumentException("Malformed \\oOO encoding.", x2);
            }
        }
        return ret;
    }
}
