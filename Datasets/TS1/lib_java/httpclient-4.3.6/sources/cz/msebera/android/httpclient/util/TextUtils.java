package cz.msebera.android.httpclient.util;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/util/TextUtils.class */
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
