package android.support.v4.app;

import android.app.ActivityManager;
import android.os.Build;
import android.support.annotation.NonNull;

/* loaded from: com.android.support.support-v4.23.0.1.jar:android/support/v4/app/ActivityManagerCompat.class */
public final class ActivityManagerCompat {
    private ActivityManagerCompat() {
    }

    public static boolean isLowRamDevice(@NonNull ActivityManager am) {
        if (Build.VERSION.SDK_INT >= 19) {
            return ActivityManagerCompatKitKat.isLowRamDevice(am);
        }
        return false;
    }
}
