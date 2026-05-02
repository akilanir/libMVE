package org.unbescape.csv;

import java.io.IOException;
import java.io.Writer;

/* loaded from: unbescape-1.1.1.RELEASE.jar:org/unbescape/csv/CsvEscapeUtil.class */
final class CsvEscapeUtil {
    private static final char DOUBLE_QUOTE = '\"';
    private static final char[] TWO_DOUBLE_QUOTES = "\"\"".toCharArray();

    private CsvEscapeUtil() {
    }

    static String escape(String text) {
        if (text == null) {
            return null;
        }
        StringBuilder strBuilder = null;
        int max = text.length();
        int readOffset = 0;
        for (int i = 0; i < max; i++) {
            char c = text.charAt(i);
            if ((c < 'a' || c > 'z') && ((c < 'A' || c > 'Z') && (c < '0' || c > '9'))) {
                if (strBuilder == null) {
                    strBuilder = new StringBuilder(max + 20);
                    strBuilder.append('\"');
                }
                if (i - readOffset > 0) {
                    strBuilder.append((CharSequence) text, readOffset, i);
                }
                readOffset = i + 1;
                if (c == DOUBLE_QUOTE) {
                    strBuilder.append(TWO_DOUBLE_QUOTES);
                } else {
                    strBuilder.append(c);
                }
            }
        }
        if (strBuilder == null) {
            return text;
        }
        if (max - readOffset > 0) {
            strBuilder.append((CharSequence) text, readOffset, max);
        }
        strBuilder.append('\"');
        return strBuilder.toString();
    }

    static void escape(char[] text, int offset, int len, Writer writer) throws IOException {
        if (text == null || text.length == 0) {
            return;
        }
        int max = offset + len;
        int readOffset = offset;
        for (int i = offset; i < max; i++) {
            char c = text[i];
            if ((c < 'a' || c > 'z') && ((c < 'A' || c > 'Z') && (c < '0' || c > '9'))) {
                if (readOffset == offset) {
                    writer.write(DOUBLE_QUOTE);
                }
                if (i - readOffset > 0) {
                    writer.write(text, readOffset, i - readOffset);
                }
                readOffset = i + 1;
                if (c == DOUBLE_QUOTE) {
                    writer.write(TWO_DOUBLE_QUOTES);
                } else {
                    writer.write(c);
                }
            }
        }
        if (max - readOffset > 0) {
            writer.write(text, readOffset, max - readOffset);
        }
        if (readOffset > offset) {
            writer.write(DOUBLE_QUOTE);
        }
    }

    static String unescape(String text) {
        if (text == null) {
            return null;
        }
        StringBuilder strBuilder = null;
        int max = text.length();
        int readOffset = 0;
        int referenceOffset = 0;
        boolean isQuoted = false;
        int i = 0;
        while (i < max) {
            char c = text.charAt(i);
            if ((i <= 0 || c == DOUBLE_QUOTE) && c == DOUBLE_QUOTE) {
                if (i == 0) {
                    if (i + 1 < max && text.charAt(max - 1) == DOUBLE_QUOTE) {
                        isQuoted = true;
                        referenceOffset = i + 1;
                        readOffset = i + 1;
                    }
                } else {
                    if (isQuoted && i + 2 < max) {
                        char c1 = text.charAt(i + 1);
                        if (c1 == DOUBLE_QUOTE) {
                            referenceOffset = i + 1;
                        }
                    } else if (isQuoted && i + 1 >= max) {
                        referenceOffset = i + 1;
                    }
                    if (strBuilder == null) {
                        strBuilder = new StringBuilder(max + 5);
                    }
                    if (i - readOffset > 0) {
                        strBuilder.append((CharSequence) text, readOffset, i);
                    }
                    i = referenceOffset;
                    readOffset = i + 1;
                    if (referenceOffset < max) {
                        strBuilder.append(c);
                    }
                }
            }
            i++;
        }
        if (strBuilder == null) {
            return text;
        }
        if (max - readOffset > 0) {
            strBuilder.append((CharSequence) text, readOffset, max);
        }
        return strBuilder.toString();
    }

    static void unescape(char[] text, int offset, int len, Writer writer) throws IOException {
        if (text == null) {
            return;
        }
        int max = offset + len;
        int readOffset = offset;
        int referenceOffset = offset;
        boolean isQuoted = false;
        int i = offset;
        while (i < max) {
            char c = text[i];
            if ((i <= offset || c == DOUBLE_QUOTE) && c == DOUBLE_QUOTE) {
                if (i == offset) {
                    if (i + 1 < max && text[max - 1] == DOUBLE_QUOTE) {
                        isQuoted = true;
                        referenceOffset = i + 1;
                        readOffset = i + 1;
                    }
                } else {
                    if (isQuoted && i + 2 < max) {
                        char c1 = text[i + 1];
                        if (c1 == DOUBLE_QUOTE) {
                            referenceOffset = i + 1;
                        }
                    } else if (isQuoted && i + 1 >= max) {
                        referenceOffset = i + 1;
                    }
                    if (i - readOffset > 0) {
                        writer.write(text, readOffset, i - readOffset);
                    }
                    i = referenceOffset;
                    readOffset = i + 1;
                    if (referenceOffset < max) {
                        writer.write(c);
                    }
                }
            }
            i++;
        }
        if (max - readOffset > 0) {
            writer.write(text, readOffset, max - readOffset);
        }
    }
}
