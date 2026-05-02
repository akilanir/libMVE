package android.support.v7.internal;

import android.os.Build;

/* loaded from: com.android.support.appcompat-v7.22.2.1.jar:android/support/v7/internal/VersionUtils.class */
public class VersionUtils {
    private VersionUtils() {
    }

    public static boolean isAtLeastL() {
        return Build.VERSION.SDK_INT >= 21;
    }
}
