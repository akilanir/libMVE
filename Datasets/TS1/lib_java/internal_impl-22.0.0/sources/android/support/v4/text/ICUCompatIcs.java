package android.support.v4.text;

import android.util.Log;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* loaded from: internal_impl-22.0.0.jar:android/support/v4/text/ICUCompatIcs.class */
class ICUCompatIcs {
    private static final String TAG = "ICUCompatIcs";
    private static Method sGetScriptMethod;
    private static Method sAddLikelySubtagsMethod;

    ICUCompatIcs() {
    }

    static {
        try {
            Class<?> clazz = Class.forName("libcore.icu.ICU");
            if (clazz != null) {
                sGetScriptMethod = clazz.getMethod("getScript", String.class);
                sAddLikelySubtagsMethod = clazz.getMethod("addLikelySubtags", String.class);
            }
        } catch (Exception e) {
            Log.w(TAG, e);
        }
    }

    public static String getScript(String locale) {
        try {
            if (sGetScriptMethod != null) {
                Object[] args = {locale};
                return (String) sGetScriptMethod.invoke(null, args);
            }
            return null;
        } catch (IllegalAccessException e) {
            Log.w(TAG, e);
            return null;
        } catch (InvocationTargetException e2) {
            Log.w(TAG, e2);
            return null;
        }
    }

    public static String addLikelySubtags(String locale) {
        try {
            if (sAddLikelySubtagsMethod != null) {
                Object[] args = {locale};
                return (String) sAddLikelySubtagsMethod.invoke(null, args);
            }
        } catch (IllegalAccessException e) {
            Log.w(TAG, e);
        } catch (InvocationTargetException e2) {
            Log.w(TAG, e2);
        }
        return locale;
    }
}
