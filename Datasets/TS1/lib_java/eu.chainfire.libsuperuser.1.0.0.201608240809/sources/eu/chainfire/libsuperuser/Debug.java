package eu.chainfire.libsuperuser;

import android.os.Looper;
import android.util.Log;

/* loaded from: eu.chainfire.libsuperuser.1.0.0.201608240809.jar:eu/chainfire/libsuperuser/Debug.class */
public class Debug {
    public static final String TAG = "libsuperuser";
    public static final int LOG_GENERAL = 1;
    public static final int LOG_COMMAND = 2;
    public static final int LOG_OUTPUT = 4;
    public static final int LOG_NONE = 0;
    private static boolean debug = false;
    public static final int LOG_ALL = 65535;
    private static int logTypes = LOG_ALL;
    private static OnLogListener logListener = null;
    private static boolean sanityChecks = true;

    /* loaded from: eu.chainfire.libsuperuser.1.0.0.201608240809.jar:eu/chainfire/libsuperuser/Debug$OnLogListener.class */
    public interface OnLogListener {
        void onLog(int i, String str, String str2);
    }

    public static void setDebug(boolean enable) {
        debug = enable;
    }

    public static boolean getDebug() {
        return debug;
    }

    private static void logCommon(int type, String typeIndicator, String message) {
        if (debug && (logTypes & type) == type) {
            if (logListener != null) {
                logListener.onLog(type, typeIndicator, message);
            } else {
                Log.d(TAG, "[libsuperuser][" + typeIndicator + "]" + ((message.startsWith("[") || message.startsWith(" ")) ? BuildConfig.FLAVOR : " ") + message);
            }
        }
    }

    public static void log(String message) {
        logCommon(1, "G", message);
    }

    public static void logCommand(String message) {
        logCommon(2, "C", message);
    }

    public static void logOutput(String message) {
        logCommon(4, "O", message);
    }

    public static void setLogTypeEnabled(int type, boolean enable) {
        if (enable) {
            logTypes |= type;
        } else {
            logTypes &= type ^ (-1);
        }
    }

    public static boolean getLogTypeEnabled(int type) {
        return (logTypes & type) == type;
    }

    public static boolean getLogTypeEnabledEffective(int type) {
        return getDebug() && getLogTypeEnabled(type);
    }

    public static void setOnLogListener(OnLogListener onLogListener) {
        logListener = onLogListener;
    }

    public static OnLogListener getOnLogListener() {
        return logListener;
    }

    public static void setSanityChecksEnabled(boolean enable) {
        sanityChecks = enable;
    }

    public static boolean getSanityChecksEnabled() {
        return sanityChecks;
    }

    public static boolean getSanityChecksEnabledEffective() {
        return getDebug() && getSanityChecksEnabled();
    }

    public static boolean onMainThread() {
        return Looper.myLooper() != null && Looper.myLooper() == Looper.getMainLooper();
    }
}
