package android.support.v4.os;

import android.content.Context;

/* loaded from: com.android.support.support-v4.24.0.0-beta1.jar:android/support/v4/os/UserManagerCompat.class */
public class UserManagerCompat {
    private UserManagerCompat() {
    }

    @Deprecated
    public static boolean isUserRunningAndLocked(Context context) {
        return !isUserUnlocked(context);
    }

    @Deprecated
    public static boolean isUserRunningAndUnlocked(Context context) {
        return isUserUnlocked(context);
    }

    public static boolean isUserUnlocked(Context context) {
        if (BuildCompat.isAtLeastN()) {
            return UserManagerCompatApi24.isUserUnlocked(context);
        }
        return true;
    }
}
