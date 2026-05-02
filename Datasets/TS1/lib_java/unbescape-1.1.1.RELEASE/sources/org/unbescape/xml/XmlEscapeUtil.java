package org.unbescape.xml;

import java.io.IOException;
import java.io.Writer;
import java.util.Arrays;

/* loaded from: unbescape-1.1.1.RELEASE.jar:org/unbescape/xml/XmlEscapeUtil.class */
final class XmlEscapeUtil {
    private static final char REFERENCE_PREFIX = '&';
    private static final char REFERENCE_NUMERIC_PREFIX2 = '#';
    private static final char REFERENCE_HEXA_PREFIX3 = 'x';
    private static final char REFERENCE_SUFFIX = ';';
    private static final char[] REFERENCE_DECIMAL_PREFIX = "&#".toCharArray();
    private static final char[] REFERENCE_HEXA_PREFIX = "&#x".toCharArray();
    private static char[] HEXA_CHARS_UPPER = "0123456789ABCDEF".toCharArray();
    private static char[] HEXA_CHARS_LOWER = "0123456789abcdef".toCharArray();

    private XmlEscapeUtil() {
    }

    static String escape(String text, XmlEscapeSymbols symbols, XmlEscapeType escapeType, XmlEscapeLevel escapeLevel) {
        int codepointIndex;
        if (text == null) {
            return null;
        }
        int level = escapeLevel.getEscapeLevel();
        boolean useCERs = escapeType.getUseCERs();
        boolean useHexa = escapeType.getUseHexa();
        StringBuilder strBuilder = null;
        int max = text.length();
        int readOffset = 0;
        int i = 0;
        while (i < max) {
            int codepoint = Character.codePointAt(text, i);
            boolean codepointValid = symbols.CODEPOINT_VALIDATOR.isValid(codepoint);
            if (codepoint > 159 || level >= symbols.ESCAPE_LEVELS[codepoint] || !codepointValid) {
                if (codepoint > 159 && level < symbols.ESCAPE_LEVELS[160] && codepointValid) {
                    if (Character.charCount(codepoint) > 1) {
                        i++;
                    }
                } else {
                    if (strBuilder == null) {
                        strBuilder = new StringBuilder(max + 20);
                    }
                    if (i - readOffset > 0) {
                        strBuilder.append((CharSequence) text, readOffset, i);
                    }
                    if (Character.charCount(codepoint) > 1) {
                        i++;
                    }
                    readOffset = i + 1;
                    if (codepointValid) {
                        if (useCERs && (codepointIndex = Arrays.binarySearch(symbols.SORTED_CODEPOINTS, codepoint)) >= 0) {
                            strBuilder.append(symbols.SORTED_CERS_BY_CODEPOINT[codepointIndex]);
                        } else {
                            if (useHexa) {
                                strBuilder.append(REFERENCE_HEXA_PREFIX);
                                strBuilder.append(Integer.toHexString(codepoint));
                            } else {
                                strBuilder.append(REFERENCE_DECIMAL_PREFIX);
                                strBuilder.append(String.valueOf(codepoint));
                            }
                            strBuilder.append(';');
                        }
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

    static void escape(char[] text, int offset, int len, Writer writer, XmlEscapeSymbols symbols, XmlEscapeType escapeType, XmlEscapeLevel escapeLevel) throws IOException {
        int codepointIndex;
        if (text == null || text.length == 0) {
            return;
        }
        int level = escapeLevel.getEscapeLevel();
        boolean useCERs = escapeType.getUseCERs();
        boolean useHexa = escapeType.getUseHexa();
        int max = offset + len;
        int readOffset = offset;
        int i = offset;
        while (i < max) {
            int codepoint = Character.codePointAt(text, i);
            boolean codepointValid = symbols.CODEPOINT_VALIDATOR.isValid(codepoint);
            if (codepoint > 159 || level >= symbols.ESCAPE_LEVELS[codepoint] || !codepointValid) {
                if (codepoint > 159 && level < symbols.ESCAPE_LEVELS[160] && codepointValid) {
                    if (Character.charCount(codepoint) > 1) {
                        i++;
                    }
                } else {
                    if (i - readOffset > 0) {
                        writer.write(text, readOffset, i - readOffset);
                    }
                    if (Character.charCount(codepoint) > 1) {
                        i++;
                    }
                    readOffset = i + 1;
                    if (codepointValid) {
                        if (useCERs && (codepointIndex = Arrays.binarySearch(symbols.SORTED_CODEPOINTS, codepoint)) >= 0) {
                            writer.write(symbols.SORTED_CERS_BY_CODEPOINT[codepointIndex]);
                        } else {
                            if (useHexa) {
                                writer.write(REFERENCE_HEXA_PREFIX);
                                writer.write(Integer.toHexString(codepoint));
                            } else {
                                writer.write(REFERENCE_DECIMAL_PREFIX);
                                writer.write(String.valueOf(codepoint));
                            }
                            writer.write(REFERENCE_SUFFIX);
                        }
                    }
                }
            }
            i++;
        }
        if (max - readOffset > 0) {
            writer.write(text, readOffset, max - readOffset);
        }
    }

    static int parseIntFromReference(String text, int start, int end, int radix) {
        int result = 0;
        for (int i = start; i < end; i++) {
            char c = text.charAt(i);
            int n = -1;
            for (int j = 0; j < HEXA_CHARS_UPPER.length; j++) {
                if (c == HEXA_CHARS_UPPER[j] || c == HEXA_CHARS_LOWER[j]) {
                    n = j;
                    break;
                }
            }
            result = (radix * result) + n;
        }
        return result;
    }

    static int parseIntFromReference(char[] text, int start, int end, int radix) {
        int result = 0;
        for (int i = start; i < end; i++) {
            char c = text[i];
            int n = -1;
            for (int j = 0; j < HEXA_CHARS_UPPER.length; j++) {
                if (c == HEXA_CHARS_UPPER[j] || c == HEXA_CHARS_LOWER[j]) {
                    n = j;
                    break;
                }
            }
            result = (radix * result) + n;
        }
        return result;
    }

    /* JADX WARN: Removed duplicated region for block: B:117:0x0237  */
    /* JADX WARN: Removed duplicated region for block: B:120:0x024b  */
    /* JADX WARN: Removed duplicated region for block: B:123:0x0266  */
    /* JADX WARN: Removed duplicated region for block: B:124:0x0273  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static java.lang.String unescape(java.lang.String r5, org.unbescape.xml.XmlEscapeSymbols r6) {
        /*
            Method dump skipped, instructions count: 670
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.unbescape.xml.XmlEscapeUtil.unescape(java.lang.String, org.unbescape.xml.XmlEscapeSymbols):java.lang.String");
    }

    /* JADX WARN: Removed duplicated region for block: B:116:0x0225  */
    /* JADX WARN: Removed duplicated region for block: B:119:0x0242  */
    /* JADX WARN: Removed duplicated region for block: B:120:0x024e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static void unescape(char[] r6, int r7, int r8, java.io.Writer r9, org.unbescape.xml.XmlEscapeSymbols r10) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 624
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.unbescape.xml.XmlEscapeUtil.unescape(char[], int, int, java.io.Writer, org.unbescape.xml.XmlEscapeSymbols):void");
    }
}
