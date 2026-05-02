package android.support.v4.text;

import android.os.Build;

/* loaded from: com.android.support.support-v4.21.0.2.jar:android/support/v4/text/ICUCompat.class */
public class ICUCompat {
    private static final ICUCompatImpl IMPL;

    /* loaded from: com.android.support.support-v4.21.0.2.jar:android/support/v4/text/ICUCompat$ICUCompatImpl.class */
    interface ICUCompatImpl {
        String getScript(String str);

        String addLikelySubtags(String str);
    }

    /* loaded from: com.android.support.support-v4.21.0.2.jar:android/support/v4/text/ICUCompat$ICUCompatImplBase.class */
    static class ICUCompatImplBase implements ICUCompatImpl {
        ICUCompatImplBase() {
        }

        @Override // android.support.v4.text.ICUCompat.ICUCompatImpl
        public String getScript(String locale) {
            return null;
        }

        @Override // android.support.v4.text.ICUCompat.ICUCompatImpl
        public String addLikelySubtags(String locale) {
            return locale;
        }
    }

    /* loaded from: com.android.support.support-v4.21.0.2.jar:android/support/v4/text/ICUCompat$ICUCompatImplIcs.class */
    static class ICUCompatImplIcs implements ICUCompatImpl {
        ICUCompatImplIcs() {
        }

        @Override // android.support.v4.text.ICUCompat.ICUCompatImpl
        public String getScript(String locale) {
            return ICUCompatIcs.getScript(locale);
        }

        @Override // android.support.v4.text.ICUCompat.ICUCompatImpl
        public String addLikelySubtags(String locale) {
            return ICUCompatIcs.addLikelySubtags(locale);
        }
    }

    static {
        int version = Build.VERSION.SDK_INT;
        if (version >= 14) {
            IMPL = new ICUCompatImplIcs();
        } else {
            IMPL = new ICUCompatImplBase();
        }
    }

    public static String getScript(String locale) {
        return IMPL.getScript(locale);
    }

    public static String addLikelySubtags(String locale) {
        return IMPL.addLikelySubtags(locale);
    }
}
