package org.unbescape.html;

/* loaded from: unbescape-1.1.1.RELEASE.jar:org/unbescape/html/HtmlEscapeUtil.class */
final class HtmlEscapeUtil {
    private static final char REFERENCE_PREFIX = '&';
    private static final char REFERENCE_NUMERIC_PREFIX2 = '#';
    private static final char REFERENCE_HEXA_PREFIX3_UPPER = 'X';
    private static final char REFERENCE_HEXA_PREFIX3_LOWER = 'x';
    private static final char REFERENCE_SUFFIX = ';';
    private static final char[] REFERENCE_DECIMAL_PREFIX = "&#".toCharArray();
    private static final char[] REFERENCE_HEXA_PREFIX = "&#x".toCharArray();
    private static char[] HEXA_CHARS_UPPER = "0123456789ABCDEF".toCharArray();
    private static char[] HEXA_CHARS_LOWER = "0123456789abcdef".toCharArray();

    private HtmlEscapeUtil() {
    }

    /* JADX WARN: Removed duplicated region for block: B:45:0x0127  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static java.lang.String escape(java.lang.String r5, org.unbescape.html.HtmlEscapeType r6, org.unbescape.html.HtmlEscapeLevel r7) {
        /*
            Method dump skipped, instructions count: 389
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.unbescape.html.HtmlEscapeUtil.escape(java.lang.String, org.unbescape.html.HtmlEscapeType, org.unbescape.html.HtmlEscapeLevel):java.lang.String");
    }

    /* JADX WARN: Removed duplicated region for block: B:43:0x011d  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static void escape(char[] r6, int r7, int r8, java.io.Writer r9, org.unbescape.html.HtmlEscapeType r10, org.unbescape.html.HtmlEscapeLevel r11) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 358
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.unbescape.html.HtmlEscapeUtil.escape(char[], int, int, java.io.Writer, org.unbescape.html.HtmlEscapeType, org.unbescape.html.HtmlEscapeLevel):void");
    }

    static int translateIllFormedCodepoint(int codepoint) {
        switch (codepoint) {
            case 0:
                return 65533;
            case 128:
                return 8364;
            case 130:
                return 8218;
            case 131:
                return 402;
            case 132:
                return 8222;
            case 133:
                return 8230;
            case 134:
                return 8224;
            case 135:
                return 8225;
            case 136:
                return 710;
            case 137:
                return 8240;
            case 138:
                return 352;
            case 139:
                return 8249;
            case 140:
                return 338;
            case 142:
                return 381;
            case 145:
                return 8216;
            case 146:
                return 8217;
            case 147:
                return 8220;
            case 148:
                return 8221;
            case 149:
                return 8226;
            case 150:
                return 8211;
            case 151:
                return 8212;
            case 152:
                return 732;
            case 153:
                return 8482;
            case 154:
                return 353;
            case 155:
                return 8250;
            case 156:
                return 339;
            case 158:
                return 382;
            case 159:
                return 376;
            default:
                if ((codepoint >= 55296 && codepoint <= 57343) || codepoint > 1114111) {
                    return 65533;
                }
                return codepoint;
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
            int result2 = result * radix;
            if (result2 < 0) {
                return 65533;
            }
            result = result2 + n;
            if (result < 0) {
                return 65533;
            }
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
            int result2 = result * radix;
            if (result2 < 0) {
                return 65533;
            }
            result = result2 + n;
            if (result < 0) {
                return 65533;
            }
        }
        return result;
    }

    /* JADX WARN: Removed duplicated region for block: B:128:0x02a2  */
    /* JADX WARN: Removed duplicated region for block: B:131:0x02b6  */
    /* JADX WARN: Removed duplicated region for block: B:134:0x02d1  */
    /* JADX WARN: Removed duplicated region for block: B:135:0x02de  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static java.lang.String unescape(java.lang.String r5) {
        /*
            Method dump skipped, instructions count: 866
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.unbescape.html.HtmlEscapeUtil.unescape(java.lang.String):java.lang.String");
    }

    /* JADX WARN: Removed duplicated region for block: B:127:0x0293  */
    /* JADX WARN: Removed duplicated region for block: B:130:0x02b0  */
    /* JADX WARN: Removed duplicated region for block: B:131:0x02bc  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static void unescape(char[] r6, int r7, int r8, java.io.Writer r9) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 820
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.unbescape.html.HtmlEscapeUtil.unescape(char[], int, int, java.io.Writer):void");
    }
}
