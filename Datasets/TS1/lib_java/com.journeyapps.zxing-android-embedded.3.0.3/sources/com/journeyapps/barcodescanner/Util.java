package com.journeyapps.barcodescanner;

import android.os.Looper;

/* loaded from: com.journeyapps.zxing-android-embedded.3.0.3.jar:com/journeyapps/barcodescanner/Util.class */
public class Util {
    public static void validateMainThread() {
        if (Looper.getMainLooper() != Looper.myLooper()) {
            throw new IllegalStateException("Must be called from the main thread.");
        }
    }
}
