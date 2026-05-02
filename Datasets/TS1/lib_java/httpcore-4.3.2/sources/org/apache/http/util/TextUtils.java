package org.apache.http.util;

/* loaded from: httpcore-4.3.2.jar:org/apache/http/util/TextUtils.class */
public final class TextUtils {
    public static boolean isEmpty(CharSequence s) {
        return s == null || s.length() == 0;
    }

    public static boolean isBlank(CharSequence s) {
        if (s == null) {
            return true;
        }
        for (int i = 0; i < s.length(); i++) {
            if (!Character.isWhitespace(s.charAt(i))) {
                return false;
            }
        }
        return true;
    }
}
