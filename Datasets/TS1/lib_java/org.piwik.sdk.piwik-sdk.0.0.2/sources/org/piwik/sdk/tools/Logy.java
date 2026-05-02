package org.piwik.sdk.tools;

import android.util.Log;

/* loaded from: org.piwik.sdk.piwik-sdk.0.0.2.jar:org/piwik/sdk/tools/Logy.class */
public class Logy {
    public static final int SILENT = -2;
    public static final int QUIET = -1;
    public static final int NORMAL = 0;
    public static final int DEBUG = 1;
    public static final int VERBOSE = 2;
    public static int sLoglevel = -1;

    public static void v(String c, String s) {
        if (sLoglevel >= 2) {
            Log.v(c, s);
        }
    }

    public static void d(String c, String s) {
        if (sLoglevel >= 1) {
            Log.d(c, s);
        }
    }

    public static void i(String c, String s) {
        if (sLoglevel >= 0) {
            Log.i(c, s);
        }
    }

    public static void w(String c, String s) {
        if (sLoglevel > -1) {
            Log.w(c, s);
        }
    }

    public static void w(String c, String s, Throwable tr) {
        if (sLoglevel > -1) {
            Log.w(c, s, tr);
        }
    }

    public static void e(String c, String s) {
        if (sLoglevel != -2) {
            Log.e(c, s);
        }
    }

    public static void e(String c, String s, Throwable tr) {
        if (sLoglevel != -2) {
            Log.e(c, s, tr);
        }
    }
}
