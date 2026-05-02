package android.support.v4.app;

import android.app.ActivityManager;

/* loaded from: internal_impl-21.0.2.jar:android/support/v4/app/ActivityManagerCompatKitKat.class */
class ActivityManagerCompatKitKat {
    ActivityManagerCompatKitKat() {
    }

    public static boolean isLowRamDevice(ActivityManager am) {
        return am.isLowRamDevice();
    }
}
