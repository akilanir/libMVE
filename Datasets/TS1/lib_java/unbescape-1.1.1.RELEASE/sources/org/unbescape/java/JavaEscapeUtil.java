package org.unbescape.java;

import java.io.IOException;
import java.io.Writer;
import java.util.Arrays;

/* loaded from: unbescape-1.1.1.RELEASE.jar:org/unbescape/java/JavaEscapeUtil.class */
final class JavaEscapeUtil {
    private static final char ESCAPE_PREFIX = '\\';
    private static final char ESCAPE_UHEXA_PREFIX2 = 'u';
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
        SEC_CHARS[8] = 'b';
        SEC_CHARS[9] = 't';
        SEC_CHARS[10] = 'n';
        SEC_CHARS[12] = 'f';
        SEC_CHARS[13] = 'r';
        SEC_CHARS[34] = '\"';
        SEC_CHARS[39] = '\'';
        SEC_CHARS[ESCAPE_PREFIX] = '\\';
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
        ESCAPE_LEVELS[8] = 1;
        ESCAPE_LEVELS[9] = 1;
        ESCAPE_LEVELS[10] = 1;
        ESCAPE_LEVELS[12] = 1;
        ESCAPE_LEVELS[13] = 1;
        ESCAPE_LEVELS[34] = 1;
        ESCAPE_LEVELS[39] = 3;
        ESCAPE_LEVELS[ESCAPE_PREFIX] = 1;
        char c9 = 0;
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

    private JavaEscapeUtil() {
    }

    static char[] toUHexa(int codepoint) {
        char[] result = {HEXA_CHARS_UPPER[(codepoint >>> 12) % 16], HEXA_CHARS_UPPER[(codepoint >>> 8) % 16], HEXA_CHARS_UPPER[(codepoint >>> 4) % 16], HEXA_CHARS_UPPER[codepoint % 16]};
        return result;
    }

    static String escape(String text, JavaEscapeLevel escapeLevel) {
        char sec;
        if (text == null) {
            return null;
        }
        int level = escapeLevel.getEscapeLevel();
        StringBuilder strBuilder = null;
        int max = text.length();
        int readOffset = 0;
        int i = 0;
        while (i < max) {
            int codepoint = Character.codePointAt(text, i);
            if (codepoint > 159 || level >= ESCAPE_LEVELS[codepoint]) {
                if (codepoint > 159 && level < ESCAPE_LEVELS[160]) {
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
                    if (codepoint < SEC_CHARS_LEN && (sec = SEC_CHARS[codepoint]) != SEC_CHARS_NO_SEC) {
                        strBuilder.append('\\');
                        strBuilder.append(sec);
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

    static void escape(char[] text, int offset, int len, Writer writer, JavaEscapeLevel escapeLevel) throws IOException {
        char sec;
        if (text == null || text.length == 0) {
            return;
        }
        int level = escapeLevel.getEscapeLevel();
        int max = offset + len;
        int readOffset = offset;
        int i = offset;
        while (i < max) {
            int codepoint = Character.codePointAt(text, i);
            if (codepoint > 159 || level >= ESCAPE_LEVELS[codepoint]) {
                if (codepoint > 159 && level < ESCAPE_LEVELS[160]) {
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
                    if (codepoint < SEC_CHARS_LEN && (sec = SEC_CHARS[codepoint]) != SEC_CHARS_NO_SEC) {
                        writer.write(ESCAPE_PREFIX);
                        writer.write(sec);
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

    /* JADX WARN: Removed duplicated region for block: B:51:0x00f3  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x0106  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x0121  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x012e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static java.lang.String unicodeUnescape(java.lang.String r5) {
        /*
            Method dump skipped, instructions count: 343
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.unbescape.java.JavaEscapeUtil.unicodeUnescape(java.lang.String):java.lang.String");
    }

    static boolean requiresUnicodeUnescape(char[] text, int offset, int len) {
        if (text == null) {
            return false;
        }
        int max = offset + len;
        for (int i = offset; i < max; i++) {
            char c = text[i];
            if (c == ESCAPE_PREFIX && i + 1 < max && c == ESCAPE_PREFIX) {
                char c1 = text[i + 1];
                if (c1 == ESCAPE_UHEXA_PREFIX2) {
                    return true;
                }
            }
        }
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:50:0x00ee  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x010b  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x0117  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static void unicodeUnescape(char[] r6, int r7, int r8, java.io.Writer r9) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 313
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.unbescape.java.JavaEscapeUtil.unicodeUnescape(char[], int, int, java.io.Writer):void");
    }

    /* JADX WARN: Removed duplicated region for block: B:52:0x01ad A[PHI: r11 r14
      0x01ad: PHI (r11v3 'referenceOffset' int) = 
      (r11v1 'referenceOffset' int)
      (r11v4 'referenceOffset' int)
      (r11v5 'referenceOffset' int)
      (r11v6 'referenceOffset' int)
     binds: [B:15:0x0047, B:30:0x0129, B:49:0x019e, B:48:0x0185] A[DONT_GENERATE, DONT_INLINE]
      0x01ad: PHI (r14v1 'codepoint' int) = (r14v0 'codepoint' int), (r14v2 'codepoint' int), (r14v3 'codepoint' int), (r14v4 'codepoint' int) binds: [B:15:0x0047, B:30:0x0129, B:49:0x019e, B:48:0x0185] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:54:0x01b1  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x01c5  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x01e0  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x01ed  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static java.lang.String unescape(java.lang.String r5) {
        /*
            Method dump skipped, instructions count: 536
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.unbescape.java.JavaEscapeUtil.unescape(java.lang.String):java.lang.String");
    }

    /* JADX WARN: Removed duplicated region for block: B:54:0x01db A[PHI: r15 r18
      0x01db: PHI (r15v3 'referenceOffset' int) = 
      (r15v1 'referenceOffset' int)
      (r15v4 'referenceOffset' int)
      (r15v5 'referenceOffset' int)
      (r15v6 'referenceOffset' int)
     binds: [B:17:0x0075, B:32:0x0156, B:51:0x01cc, B:50:0x01b2] A[DONT_GENERATE, DONT_INLINE]
      0x01db: PHI (r18v1 'codepoint' int) = (r18v0 'codepoint' int), (r18v2 'codepoint' int), (r18v3 'codepoint' int), (r18v4 'codepoint' int) binds: [B:17:0x0075, B:32:0x0156, B:51:0x01cc, B:50:0x01b2] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:56:0x01e3  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x0201  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x020d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static void unescape(char[] r6, int r7, int r8, java.io.Writer r9) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 560
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.unbescape.java.JavaEscapeUtil.unescape(char[], int, int, java.io.Writer):void");
    }
}
