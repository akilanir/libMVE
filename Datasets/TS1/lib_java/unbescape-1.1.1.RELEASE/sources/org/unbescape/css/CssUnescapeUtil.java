package org.unbescape.css;

/* loaded from: unbescape-1.1.1.RELEASE.jar:org/unbescape/css/CssUnescapeUtil.class */
final class CssUnescapeUtil {
    private static final char ESCAPE_PREFIX = '\\';
    private static char[] HEXA_CHARS_UPPER = "0123456789ABCDEF".toCharArray();
    private static char[] HEXA_CHARS_LOWER = "0123456789abcdef".toCharArray();

    private CssUnescapeUtil() {
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

    /* JADX WARN: Removed duplicated region for block: B:66:0x02b3 A[PHI: r10 r13
      0x02b3: PHI (r10v3 'referenceOffset' int) = 
      (r10v1 'referenceOffset' int)
      (r10v4 'referenceOffset' int)
      (r10v5 'referenceOffset' int)
      (r10v6 'referenceOffset' int)
      (r10v6 'referenceOffset' int)
      (r10v7 'referenceOffset' int)
     binds: [B:15:0x003f, B:20:0x01e5, B:65:0x02a9, B:53:0x027a, B:55:0x0285, B:56:0x0288] A[DONT_GENERATE, DONT_INLINE]
      0x02b3: PHI (r13v1 'codepoint' int) = 
      (r13v0 'codepoint' int)
      (r13v2 'codepoint' int)
      (r13v3 'codepoint' int)
      (r13v4 'codepoint' int)
      (r13v4 'codepoint' int)
      (r13v4 'codepoint' int)
     binds: [B:15:0x003f, B:20:0x01e5, B:65:0x02a9, B:53:0x027a, B:55:0x0285, B:56:0x0288] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:68:0x02b7  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x02ca  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x02e5  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x02f2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static java.lang.String unescape(java.lang.String r5) {
        /*
            Method dump skipped, instructions count: 795
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.unbescape.css.CssUnescapeUtil.unescape(java.lang.String):java.lang.String");
    }

    /* JADX WARN: Removed duplicated region for block: B:65:0x02a9 A[PHI: r12 r15
      0x02a9: PHI (r12v3 'referenceOffset' int) = 
      (r12v1 'referenceOffset' int)
      (r12v4 'referenceOffset' int)
      (r12v5 'referenceOffset' int)
      (r12v6 'referenceOffset' int)
      (r12v6 'referenceOffset' int)
      (r12v7 'referenceOffset' int)
     binds: [B:14:0x003a, B:19:0x01dd, B:64:0x029f, B:52:0x0272, B:54:0x027b, B:55:0x027e] A[DONT_GENERATE, DONT_INLINE]
      0x02a9: PHI (r15v1 'codepoint' int) = 
      (r15v0 'codepoint' int)
      (r15v2 'codepoint' int)
      (r15v3 'codepoint' int)
      (r15v4 'codepoint' int)
      (r15v4 'codepoint' int)
      (r15v4 'codepoint' int)
     binds: [B:14:0x003a, B:19:0x01dd, B:64:0x029f, B:52:0x0272, B:54:0x027b, B:55:0x027e] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:67:0x02b1  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x02ce  */
    /* JADX WARN: Removed duplicated region for block: B:71:0x02da  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static void unescape(char[] r6, int r7, int r8, java.io.Writer r9) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 764
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.unbescape.css.CssUnescapeUtil.unescape(char[], int, int, java.io.Writer):void");
    }
}
