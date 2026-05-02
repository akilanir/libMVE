package org.unbescape.properties;

/* loaded from: unbescape-1.1.1.RELEASE.jar:org/unbescape/properties/PropertiesUnescapeUtil.class */
final class PropertiesUnescapeUtil {
    private static final char ESCAPE_PREFIX = '\\';
    private static final char ESCAPE_UHEXA_PREFIX2 = 'u';
    private static char[] HEXA_CHARS_UPPER = "0123456789ABCDEF".toCharArray();
    private static char[] HEXA_CHARS_LOWER = "0123456789abcdef".toCharArray();

    private PropertiesUnescapeUtil() {
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

    /* JADX WARN: Removed duplicated region for block: B:51:0x014e A[PHI: r10 r13
      0x014e: PHI (r10v3 'referenceOffset' int) = 
      (r10v1 'referenceOffset' int)
      (r10v4 'referenceOffset' int)
      (r10v5 'referenceOffset' int)
      (r10v6 'referenceOffset' int)
     binds: [B:15:0x003f, B:24:0x00c1, B:50:0x0144, B:49:0x012d] A[DONT_GENERATE, DONT_INLINE]
      0x014e: PHI (r13v1 'codepoint' int) = (r13v0 'codepoint' int), (r13v2 'codepoint' int), (r13v3 'codepoint' int), (r13v4 'codepoint' int) binds: [B:15:0x003f, B:24:0x00c1, B:50:0x0144, B:49:0x012d] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0152  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0165  */
    /* JADX WARN: Removed duplicated region for block: B:59:0x0180  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x018d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static java.lang.String unescape(java.lang.String r5) {
        /*
            Method dump skipped, instructions count: 438
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.unbescape.properties.PropertiesUnescapeUtil.unescape(java.lang.String):java.lang.String");
    }

    /* JADX WARN: Removed duplicated region for block: B:50:0x0145 A[PHI: r12 r15
      0x0145: PHI (r12v3 'referenceOffset' int) = 
      (r12v1 'referenceOffset' int)
      (r12v4 'referenceOffset' int)
      (r12v5 'referenceOffset' int)
      (r12v6 'referenceOffset' int)
     binds: [B:14:0x003a, B:23:0x00b9, B:49:0x013b, B:48:0x0124] A[DONT_GENERATE, DONT_INLINE]
      0x0145: PHI (r15v1 'codepoint' int) = (r15v0 'codepoint' int), (r15v2 'codepoint' int), (r15v3 'codepoint' int), (r15v4 'codepoint' int) binds: [B:14:0x003a, B:23:0x00b9, B:49:0x013b, B:48:0x0124] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:52:0x014d  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x016a  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0176  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static void unescape(char[] r6, int r7, int r8, java.io.Writer r9) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 408
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.unbescape.properties.PropertiesUnescapeUtil.unescape(char[], int, int, java.io.Writer):void");
    }
}
