package com.koushikdutta.async.http.cache;

/* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/http/cache/HeaderParser.class */
final class HeaderParser {

    /* loaded from: com.koushikdutta.async.androidasync.2.1.7.jar:com/koushikdutta/async/http/cache/HeaderParser$CacheControlHandler.class */
    public interface CacheControlHandler {
        void handle(String str, String str2);
    }

    HeaderParser() {
    }

    public static void parseCacheControl(String value, CacheControlHandler handler) {
        String parameter;
        if (value == null) {
            return;
        }
        int pos = 0;
        while (pos < value.length()) {
            int tokenStart = pos;
            int pos2 = skipUntil(value, pos, "=,");
            String directive = value.substring(tokenStart, pos2).trim();
            if (pos2 == value.length() || value.charAt(pos2) == ',') {
                pos = pos2 + 1;
                handler.handle(directive, null);
            } else {
                int pos3 = skipWhitespace(value, pos2 + 1);
                if (pos3 < value.length() && value.charAt(pos3) == '\"') {
                    int pos4 = pos3 + 1;
                    int pos5 = skipUntil(value, pos4, "\"");
                    parameter = value.substring(pos4, pos5);
                    pos = pos5 + 1;
                } else {
                    pos = skipUntil(value, pos3, ",");
                    parameter = value.substring(pos3, pos).trim();
                }
                handler.handle(directive, parameter);
            }
        }
    }

    private static int skipUntil(String input, int pos, String characters) {
        while (pos < input.length() && characters.indexOf(input.charAt(pos)) == -1) {
            pos++;
        }
        return pos;
    }

    private static int skipWhitespace(String input, int pos) {
        char c;
        while (pos < input.length() && ((c = input.charAt(pos)) == ' ' || c == '\t')) {
            pos++;
        }
        return pos;
    }

    public static int parseSeconds(String value) {
        try {
            long seconds = Long.parseLong(value);
            if (seconds > 2147483647L) {
                return Integer.MAX_VALUE;
            }
            if (seconds < 0) {
                return 0;
            }
            return (int) seconds;
        } catch (NumberFormatException e) {
            return -1;
        }
    }
}
