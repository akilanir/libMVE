package org.unbescape.json;

import java.io.IOException;
import java.io.Writer;
import java.util.Arrays;

/* loaded from: unbescape-1.1.1.RELEASE.jar:org/unbescape/json/JsonEscapeUtil.class */
final class JsonEscapeUtil {
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
        ESCAPE_LEVELS[8] = 1;
        ESCAPE_LEVELS[9] = 1;
        ESCAPE_LEVELS[10] = 1;
        ESCAPE_LEVELS[12] = 1;
        ESCAPE_LEVELS[13] = 1;
        ESCAPE_LEVELS[34] = 1;
        ESCAPE_LEVELS[ESCAPE_PREFIX] = 1;
        ESCAPE_LEVELS[47] = 1;
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

    private JsonEscapeUtil() {
    }

    static char[] toUHexa(int codepoint) {
        char[] result = {HEXA_CHARS_UPPER[(codepoint >>> 12) % 16], HEXA_CHARS_UPPER[(codepoint >>> 8) % 16], HEXA_CHARS_UPPER[(codepoint >>> 4) % 16], HEXA_CHARS_UPPER[codepoint % 16]};
        return result;
    }

    static String escape(String text, JsonEscapeType escapeType, JsonEscapeLevel escapeLevel) {
        char sec;
        if (text == null) {
            return null;
        }
        int level = escapeLevel.getEscapeLevel();
        boolean useSECs = escapeType.getUseSECs();
        StringBuilder strBuilder = null;
        int max = text.length();
        int readOffset = 0;
        int i = 0;
        while (i < max) {
            int codepoint = Character.codePointAt(text, i);
            if ((codepoint > 159 || level >= ESCAPE_LEVELS[codepoint]) && (codepoint != 47 || level >= 3 || (i != 0 && text.charAt(i - 1) == '<'))) {
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
                    if (useSECs && codepoint < SEC_CHARS_LEN && (sec = SEC_CHARS[codepoint]) != SEC_CHARS_NO_SEC) {
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

    static void escape(char[] text, int offset, int len, Writer writer, JsonEscapeType escapeType, JsonEscapeLevel escapeLevel) throws IOException {
        char sec;
        if (text == null || text.length == 0) {
            return;
        }
        int level = escapeLevel.getEscapeLevel();
        boolean useSECs = escapeType.getUseSECs();
        int max = offset + len;
        int readOffset = offset;
        int i = offset;
        while (i < max) {
            int codepoint = Character.codePointAt(text, i);
            if ((codepoint > 159 || level >= ESCAPE_LEVELS[codepoint]) && (codepoint != 47 || level >= 3 || (i != offset && text[i - 1] == '<'))) {
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
                    if (useSECs && codepoint < SEC_CHARS_LEN && (sec = SEC_CHARS[codepoint]) != SEC_CHARS_NO_SEC) {
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

    /* JADX WARN: Removed duplicated region for block: B:54:0x0189 A[PHI: r10 r13
      0x0189: PHI (r10v3 'referenceOffset' int) = (r10v1 'referenceOffset' int), (r10v4 'referenceOffset' int), (r10v5 'referenceOffset' int) binds: [B:15:0x003f, B:27:0x0100, B:52:0x016c] A[DONT_GENERATE, DONT_INLINE]
      0x0189: PHI (r13v1 'codepoint' int) = (r13v0 'codepoint' int), (r13v2 'codepoint' int), (r13v3 'codepoint' int) binds: [B:15:0x003f, B:27:0x0100, B:52:0x016c] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:56:0x018d  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x01a0  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x01bb  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x01c8  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static java.lang.String unescape(java.lang.String r5) {
        /*
            Method dump skipped, instructions count: 497
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.unbescape.json.JsonEscapeUtil.unescape(java.lang.String):java.lang.String");
    }

    /* JADX WARN: Removed duplicated region for block: B:53:0x0180 A[PHI: r12 r15
      0x0180: PHI (r12v3 'referenceOffset' int) = (r12v1 'referenceOffset' int), (r12v4 'referenceOffset' int), (r12v5 'referenceOffset' int) binds: [B:14:0x003a, B:26:0x00f8, B:51:0x0163] A[DONT_GENERATE, DONT_INLINE]
      0x0180: PHI (r15v1 'codepoint' int) = (r15v0 'codepoint' int), (r15v2 'codepoint' int), (r15v3 'codepoint' int) binds: [B:14:0x003a, B:26:0x00f8, B:51:0x0163] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:55:0x0188  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x01a5  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x01b1  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static void unescape(char[] r6, int r7, int r8, java.io.Writer r9) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 467
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.unbescape.json.JsonEscapeUtil.unescape(char[], int, int, java.io.Writer):void");
    }
}
