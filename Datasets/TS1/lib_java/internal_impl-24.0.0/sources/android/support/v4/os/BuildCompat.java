package android.support.v4.os;

import android.os.Build;

/* loaded from: internal_impl-24.0.0.jar:android/support/v4/os/BuildCompat.class */
public class BuildCompat {
    private BuildCompat() {
    }

    public static boolean isAtLeastN() {
        return Build.VERSION.SDK_INT >= 24;
    }
}
