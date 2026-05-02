package org.unbescape.javascript;

import java.io.IOException;
import java.io.Writer;
import java.util.Arrays;

/* loaded from: unbescape-1.1.1.RELEASE.jar:org/unbescape/javascript/JavaScriptEscapeUtil.class */
final class JavaScriptEscapeUtil {
    private static final char ESCAPE_PREFIX = '\\';
    private static final char ESCAPE_XHEXA_PREFIX2 = 'x';
    private static final char ESCAPE_UHEXA_PREFIX2 = 'u';
    private static final char[] ESCAPE_XHEXA_PREFIX = "\\x".toCharArray();
    private static final char[] ESCAPE_UHEXA_PREFIX = "\\u".toCharArray();
    private static char[] HEXA_CHARS_UPPER = "0123456789ABCDEF".toCharArray();
    private static char[] HEXA_CHARS_LOWER = "0123456789abcdef".toCharArray();
    private static int SEC_CHARS_LEN = 93;
    private static char SEC_CHARS_NO_SEC = '*';
    private static char[] SEC_CHARS = new char[SEC_CHARS_LEN];
    private static final char ESCAPE_LEVELS_LEN = 161;
    private static final byte[] ESCAPE_LEVELS;

    static {
        Arrays.fill(SEC_CHARS, SEC_CHARS_NO_SEC);
        SEC_CHARS[0] = '0';
        SEC_CHARS[8] = 'b';
        SEC_CHARS[9] = 't';
        SEC_CHARS[10] = 'n';
        SEC_CHARS[12] = 'f';
        SEC_CHARS[13] = 'r';
        SEC_CHARS[34] = '\"';
        SEC_CHARS[39] = '\'';
        SEC_CHARS[ESCAPE_PREFIX] = '\\';
        SEC_CHARS[47] = '/';
        ESCAPE_LEVELS = new byte[ESCAPE_LEVELS_LEN];
        Arrays.fill(ESCAPE_LEVELS, (byte) 3);
        char c = 128;
        while (true) {
            char c2 = c;
            if (c2 >= ESCAPE_LEVELS_LEN) {
                break;
            }
            ESCAPE_LEVELS[c2] = 2;
            c = (char) (c2 + 1);
        }
        char c3 = 'A';
        while (true) {
            char c4 = c3;
            if (c4 > 'Z') {
                break;
            }
            ESCAPE_LEVELS[c4] = 4;
            c3 = (char) (c4 + 1);
        }
        char c5 = 'a';
        while (true) {
            char c6 = c5;
            if (c6 > 'z') {
                break;
            }
            ESCAPE_LEVELS[c6] = 4;
            c5 = (char) (c6 + 1);
        }
        char c7 = '0';
        while (true) {
            char c8 = c7;
            if (c8 > '9') {
                break;
            }
            ESCAPE_LEVELS[c8] = 4;
            c7 = (char) (c8 + 1);
        }
        ESCAPE_LEVELS[0] = 1;
        ESCAPE_LEVELS[8] = 1;
        ESCAPE_LEVELS[9] = 1;
        ESCAPE_LEVELS[10] = 1;
        ESCAPE_LEVELS[12] = 1;
        ESCAPE_LEVELS[13] = 1;
        ESCAPE_LEVELS[34] = 1;
        ESCAPE_LEVELS[39] = 1;
        ESCAPE_LEVELS[ESCAPE_PREFIX] = 1;
        ESCAPE_LEVELS[47] = 1;
        char c9 = 1;
        while (true) {
            char c10 = c9;
            if (c10 > 31) {
                break;
            }
            ESCAPE_LEVELS[c10] = 1;
            c9 = (char) (c10 + 1);
        }
        char c11 = 127;
        while (true) {
            char c12 = c11;
            if (c12 <= 159) {
                ESCAPE_LEVELS[c12] = 1;
                c11 = (char) (c12 + 1);
            } else {
                return;
            }
        }
    }

    private JavaScriptEscapeUtil() {
    }

    static char[] toXHexa(int codepoint) {
        char[] result = {HEXA_CHARS_UPPER[(codepoint >>> 4) % 16], HEXA_CHARS_UPPER[codepoint % 16]};
        return result;
    }

    static char[] toUHexa(int codepoint) {
        char[] result = {HEXA_CHARS_UPPER[(codepoint >>> 12) % 16], HEXA_CHARS_UPPER[(codepoint >>> 8) % 16], HEXA_CHARS_UPPER[(codepoint >>> 4) % 16], HEXA_CHARS_UPPER[codepoint % 16]};
        return result;
    }

    static String escape(String text, JavaScriptEscapeType escapeType, JavaScriptEscapeLevel escapeLevel) {
        char sec;
        if (text == null) {
            return null;
        }
        int level = escapeLevel.getEscapeLevel();
        boolean useSECs = escapeType.getUseSECs();
        boolean useXHexa = escapeType.getUseXHexa();
        StringBuilder strBuilder = null;
        int max = text.length();
        int readOffset = 0;
        int i = 0;
        while (i < max) {
            int codepoint = Character.codePointAt(text, i);
            if ((codepoint > 159 || level >= ESCAPE_LEVELS[codepoint]) && (codepoint != 47 || level >= 3 || (i != 0 && text.charAt(i - 1) == '<'))) {
                if (codepoint > 159 && level < ESCAPE_LEVELS[160] && codepoint != 8232 && codepoint != 8233) {
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
                    if (useSECs && codepoint < SEC_CHARS_LEN && (sec = SEC_CHARS[codepoint]) != SEC_CHARS_NO_SEC) {
                        strBuilder.append('\\');
                        strBuilder.append(sec);
                    } else if (useXHexa && codepoint <= 255) {
                        strBuilder.append(ESCAPE_XHEXA_PREFIX);
                        strBuilder.append(toXHexa(codepoint));
                    } else if (Character.charCount(codepoint) > 1) {
                        char[] codepointChars = Character.toChars(codepoint);
                        strBuilder.append(ESCAPE_UHEXA_PREFIX);
                        strBuilder.append(toUHexa(codepointChars[0]));
                        strBuilder.append(ESCAPE_UHEXA_PREFIX);
                        strBuilder.append(toUHexa(codepointChars[1]));
                    } else {
                        strBuilder.append(ESCAPE_UHEXA_PREFIX);
                        strBuilder.append(toUHexa(codepoint));
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

    static void escape(char[] text, int offset, int len, Writer writer, JavaScriptEscapeType escapeType, JavaScriptEscapeLevel escapeLevel) throws IOException {
        char sec;
        if (text == null || text.length == 0) {
            return;
        }
        int level = escapeLevel.getEscapeLevel();
        boolean useSECs = escapeType.getUseSECs();
        boolean useXHexa = escapeType.getUseXHexa();
        int max = offset + len;
        int readOffset = offset;
        int i = offset;
        while (i < max) {
            int codepoint = Character.codePointAt(text, i);
            if ((codepoint > 159 || level >= ESCAPE_LEVELS[codepoint]) && (codepoint != 47 || level >= 3 || (i != 0 && text[i - 1] == '<'))) {
                if (codepoint > 159 && level < ESCAPE_LEVELS[160] && codepoint != 8232 && codepoint != 8233) {
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
                    if (useSECs && codepoint < SEC_CHARS_LEN && (sec = SEC_CHARS[codepoint]) != SEC_CHARS_NO_SEC) {
                        writer.write(ESCAPE_PREFIX);
                        writer.write(sec);
                    } else if (useXHexa && codepoint <= 255) {
                        writer.write(ESCAPE_XHEXA_PREFIX);
                        writer.write(toXHexa(codepoint));
                    } else if (Character.charCount(codepoint) > 1) {
                        char[] codepointChars = Character.toChars(codepoint);
                        writer.write(ESCAPE_UHEXA_PREFIX);
                        writer.write(toUHexa(codepointChars[0]));
                        writer.write(ESCAPE_UHEXA_PREFIX);
                        writer.write(toUHexa(codepointChars[1]));
                    } else {
                        writer.write(ESCAPE_UHEXA_PREFIX);
                        writer.write(toUHexa(codepoint));
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

    static boolean isOctalEscape(String text, int start, int end) {
        char c1;
        if (start >= end || (c1 = text.charAt(start)) < '0' || c1 > '7') {
            return false;
        }
        if (start + 1 >= end) {
            return c1 != '0';
        }
        char c2 = text.charAt(start + 1);
        if (c2 < '0' || c2 > '7') {
            return c1 != '0';
        }
        if (start + 2 >= end) {
            return (c1 == '0' && c2 == '0') ? false : true;
        }
        char c3 = text.charAt(start + 2);
        return (c3 < '0' || c3 > '7') ? (c1 == '0' && c2 == '0') ? false : true : (c1 == '0' && c2 == '0' && c3 == '0') ? false : true;
    }

    static boolean isOctalEscape(char[] text, int start, int end) {
        char c1;
        if (start >= end || (c1 = text[start]) < '0' || c1 > '7') {
            return false;
        }
        if (start + 1 >= end) {
            return c1 != '0';
        }
        char c2 = text[start + 1];
        if (c2 < '0' || c2 > '7') {
            return c1 != '0';
        }
        if (start + 2 >= end) {
            return (c1 == '0' && c2 == '0') ? false : true;
        }
        char c3 = text[start + 2];
        return (c3 < '0' || c3 > '7') ? (c1 == '0' && c2 == '0') ? false : true : (c1 == '0' && c2 == '0' && c3 == '0') ? false : true;
    }

    /* JADX WARN: Removed duplicated region for block: B:117:0x0302 A[PHI: r10 r13
      0x0302: PHI (r10v3 'referenceOffset' int) = 
      (r10v1 'referenceOffset' int)
      (r10v4 'referenceOffset' int)
      (r10v5 'referenceOffset' int)
      (r10v6 'referenceOffset' int)
      (r10v7 'referenceOffset' int)
      (r10v8 'referenceOffset' int)
      (r10v9 'referenceOffset' int)
     binds: [B:15:0x003f, B:32:0x014a, B:116:0x02f8, B:101:0x02bd, B:100:0x02a4, B:82:0x0235, B:57:0x01b5] A[DONT_GENERATE, DONT_INLINE]
      0x0302: PHI (r13v1 'codepoint' int) = 
      (r13v0 'codepoint' int)
      (r13v2 'codepoint' int)
      (r13v3 'codepoint' int)
      (r13v4 'codepoint' int)
      (r13v5 'codepoint' int)
      (r13v6 'codepoint' int)
      (r13v7 'codepoint' int)
     binds: [B:15:0x003f, B:32:0x014a, B:116:0x02f8, B:101:0x02bd, B:100:0x02a4, B:82:0x0235, B:57:0x01b5] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:119:0x0306  */
    /* JADX WARN: Removed duplicated region for block: B:122:0x0319  */
    /* JADX WARN: Removed duplicated region for block: B:125:0x0334  */
    /* JADX WARN: Removed duplicated region for block: B:126:0x0341  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static java.lang.String unescape(java.lang.String r5) {
        /*
            Method dump skipped, instructions count: 874
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.unbescape.javascript.JavaScriptEscapeUtil.unescape(java.lang.String):java.lang.String");
    }

    /* JADX WARN: Removed duplicated region for block: B:116:0x02f8 A[PHI: r12 r15
      0x02f8: PHI (r12v3 'referenceOffset' int) = 
      (r12v1 'referenceOffset' int)
      (r12v4 'referenceOffset' int)
      (r12v5 'referenceOffset' int)
      (r12v6 'referenceOffset' int)
      (r12v7 'referenceOffset' int)
      (r12v8 'referenceOffset' int)
      (r12v9 'referenceOffset' int)
     binds: [B:14:0x003a, B:31:0x0143, B:115:0x02ee, B:100:0x02b3, B:99:0x029a, B:81:0x022c, B:56:0x01ad] A[DONT_GENERATE, DONT_INLINE]
      0x02f8: PHI (r15v1 'codepoint' int) = 
      (r15v0 'codepoint' int)
      (r15v2 'codepoint' int)
      (r15v3 'codepoint' int)
      (r15v4 'codepoint' int)
      (r15v5 'codepoint' int)
      (r15v6 'codepoint' int)
      (r15v7 'codepoint' int)
     binds: [B:14:0x003a, B:31:0x0143, B:115:0x02ee, B:100:0x02b3, B:99:0x029a, B:81:0x022c, B:56:0x01ad] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:118:0x0300  */
    /* JADX WARN: Removed duplicated region for block: B:121:0x031d  */
    /* JADX WARN: Removed duplicated region for block: B:122:0x0329  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static void unescape(char[] r6, int r7, int r8, java.io.Writer r9) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 843
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.unbescape.javascript.JavaScriptEscapeUtil.unescape(char[], int, int, java.io.Writer):void");
    }
}
