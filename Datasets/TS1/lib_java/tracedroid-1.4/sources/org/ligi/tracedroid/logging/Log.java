package org.ligi.tracedroid.logging;

/* loaded from: tracedroid-1.4.jar:org/ligi/tracedroid/logging/Log.class */
public class Log {
    public static final int DEFAULT_LOG_CACHE_SIZE = 42;
    private static String TAG = "TraceDroid";
    private static String[] log_cache = new String[42];
    private static int log_cache_pos;

    public static String getTAG() {
        return TAG;
    }

    public static void setTAG(String tag) {
        TAG = tag;
    }

    public static final void e(String msg) {
        e(TAG, msg);
    }

    public static final void e(String msg, Throwable tr) {
        e(TAG, msg, tr);
    }

    public static final void w(String msg) {
        w(TAG, msg);
    }

    public static final void w(String msg, Throwable tr) {
        w(TAG, msg, tr);
    }

    public static final void i(String msg) {
        i(TAG, msg);
    }

    public static final void i(String msg, Throwable tr) {
        i(TAG, msg, tr);
    }

    public static final void d(String msg) {
        d(TAG, msg);
    }

    public static final void d(String msg, Throwable tr) {
        d(TAG, msg, tr);
    }

    public static void setLogCacheSize(int size) {
        log_cache_pos = 0;
        log_cache = new String[size];
    }

    private static synchronized void doCachedLog(String symbol, String what) {
        log_cache[log_cache_pos] = symbol + ": " + what;
        log_cache_pos = (log_cache_pos + 1) % log_cache.length;
    }

    public static synchronized String getCachedLog() {
        String res = "";
        for (int i = 0; i < log_cache.length; i++) {
            int pos_in_arr = (((log_cache.length - i) + log_cache_pos) - 1) % log_cache.length;
            if (log_cache[pos_in_arr] != null) {
                res = res + "" + i + " " + log_cache[pos_in_arr] + "\n";
            }
        }
        return res;
    }

    public static final void e(String tag, String msg) {
        doCachedLog("E", msg);
        android.util.Log.e(tag, msg);
    }

    public static final void e(String tag, String msg, Throwable tr) {
        doCachedLog("E", msg + tr);
        android.util.Log.e(tag, msg, tr);
    }

    public static final void w(String tag, String msg) {
        doCachedLog("W", msg);
        android.util.Log.w(tag, msg);
    }

    public static final void w(String tag, String msg, Throwable tr) {
        doCachedLog("W", msg + tr);
        android.util.Log.w(tag, msg, tr);
    }

    public static final void i(String tag, String msg) {
        doCachedLog("I", msg);
        android.util.Log.i(tag, msg);
    }

    public static final void i(String tag, String msg, Throwable tr) {
        doCachedLog("I", msg + tr);
        android.util.Log.i(tag, msg, tr);
    }

    public static final void d(String tag, String msg) {
        doCachedLog("D", msg);
        android.util.Log.d(tag, msg);
    }

    public static final void d(String tag, String msg, Throwable tr) {
        doCachedLog("D", msg + tr);
        android.util.Log.d(tag, msg, tr);
    }
}
