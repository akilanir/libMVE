package android.support.v4.os;

import android.os.Build;

/* loaded from: com.android.support.support-v4.23.1.1.jar:android/support/v4/os/TraceCompat.class */
public class TraceCompat {
    public static void beginSection(String sectionName) {
        if (Build.VERSION.SDK_INT >= 18) {
            TraceJellybeanMR2.beginSection(sectionName);
        }
    }

    public static void endSection() {
        if (Build.VERSION.SDK_INT >= 18) {
            TraceJellybeanMR2.endSection();
        }
    }
}
