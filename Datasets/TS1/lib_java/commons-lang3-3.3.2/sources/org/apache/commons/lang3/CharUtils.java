package org.apache.commons.lang3;

/* loaded from: commons-lang3-3.3.2.jar:org/apache/commons/lang3/CharUtils.class */
public class CharUtils {
    private static final String[] CHAR_STRING_ARRAY = new String[128];
    public static final char LF = '\n';
    public static final char CR = '\r';

    static {
        char c = 0;
        while (true) {
            char c2 = c;
            if (c2 < CHAR_STRING_ARRAY.length) {
                CHAR_STRING_ARRAY[c2] = String.valueOf(c2);
                c = (char) (c2 + 1);
            } else {
                return;
            }
        }
    }

    @Deprecated
    public static Character toCharacterObject(char ch) {
        return Character.valueOf(ch);
    }

    public static Character toCharacterObject(String str) {
        if (StringUtils.isEmpty(str)) {
            return null;
        }
        return Character.valueOf(str.charAt(0));
    }

    public static char toChar(Character ch) {
        if (ch == null) {
            throw new IllegalArgumentException("The Character must not be null");
        }
        return ch.charValue();
    }

    public static char toChar(Character ch, char defaultValue) {
        if (ch == null) {
            return defaultValue;
        }
        return ch.charValue();
    }

    public static char toChar(String str) {
        if (StringUtils.isEmpty(str)) {
            throw new IllegalArgumentException("The String must not be empty");
        }
        return str.charAt(0);
    }

    public static char toChar(String str, char defaultValue) {
        if (StringUtils.isEmpty(str)) {
            return defaultValue;
        }
        return str.charAt(0);
    }

    public static int toIntValue(char ch) {
        if (!isAsciiNumeric(ch)) {
            throw new IllegalArgumentException("The character " + ch + " is not in the range '0' - '9'");
        }
        return ch - '0';
    }

    public static int toIntValue(char ch, int defaultValue) {
        if (!isAsciiNumeric(ch)) {
            return defaultValue;
        }
        return ch - '0';
    }

    public static int toIntValue(Character ch) {
        if (ch == null) {
            throw new IllegalArgumentException("The character must not be null");
        }
        return toIntValue(ch.charValue());
    }

    public static int toIntValue(Character ch, int defaultValue) {
        if (ch == null) {
            return defaultValue;
        }
        return toIntValue(ch.charValue(), defaultValue);
    }

    public static String toString(char ch) {
        if (ch < 128) {
            return CHAR_STRING_ARRAY[ch];
        }
        return new String(new char[]{ch});
    }

    public static String toString(Character ch) {
        if (ch == null) {
            return null;
        }
        return toString(ch.charValue());
    }

    public static String unicodeEscaped(char ch) {
        if (ch < 16) {
            return "\\u000" + Integer.toHexString(ch);
        }
        if (ch < 256) {
            return "\\u00" + Integer.toHexString(ch);
        }
        if (ch < 4096) {
            return "\\u0" + Integer.toHexString(ch);
        }
        return "\\u" + Integer.toHexString(ch);
    }

    public static String unicodeEscaped(Character ch) {
        if (ch == null) {
            return null;
        }
        return unicodeEscaped(ch.charValue());
    }

    public static boolean isAscii(char ch) {
        return ch < 128;
    }

    public static boolean isAsciiPrintable(char ch) {
        return ch >= ' ' && ch < 127;
    }

    public static boolean isAsciiControl(char ch) {
        return ch < ' ' || ch == 127;
    }

    public static boolean isAsciiAlpha(char ch) {
        return isAsciiAlphaUpper(ch) || isAsciiAlphaLower(ch);
    }

    public static boolean isAsciiAlphaUpper(char ch) {
        return ch >= 'A' && ch <= 'Z';
    }

    public static boolean isAsciiAlphaLower(char ch) {
        return ch >= 'a' && ch <= 'z';
    }

    public static boolean isAsciiNumeric(char ch) {
        return ch >= '0' && ch <= '9';
    }

    public static boolean isAsciiAlphanumeric(char ch) {
        return isAsciiAlpha(ch) || isAsciiNumeric(ch);
    }
}
