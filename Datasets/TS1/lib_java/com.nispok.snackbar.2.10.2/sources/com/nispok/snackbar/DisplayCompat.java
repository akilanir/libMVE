package com.nispok.snackbar;

import android.app.Activity;
import android.graphics.Point;
import android.os.Build;
import android.view.Display;

/* loaded from: com.nispok.snackbar.2.10.2.jar:com/nispok/snackbar/DisplayCompat.class */
class DisplayCompat {
    private static final Impl IMPL;

    /* loaded from: com.nispok.snackbar.2.10.2.jar:com/nispok/snackbar/DisplayCompat$Impl.class */
    static abstract class Impl {
        abstract void getSize(Display display, Point point);

        abstract void getRealSize(Display display, Point point);

        Impl() {
        }
    }

    DisplayCompat() {
    }

    static {
        if (Build.VERSION.SDK_INT >= 17) {
            IMPL = new DisplayCompatImplJBMR1();
        } else if (Build.VERSION.SDK_INT >= 13) {
            IMPL = new DisplayCompatImplHoneycombMR2();
        } else {
            IMPL = new DisplayCompatImplPreHoneycombMR2();
        }
    }

    public static void getSize(Display display, Point outSize) {
        IMPL.getSize(display, outSize);
    }

    public static void getRealSize(Display display, Point outSize) {
        IMPL.getRealSize(display, outSize);
    }

    public static int getWidthFromPercentage(Activity targetActivity, Float mMaxWidthPercentage) {
        Display display = targetActivity.getWindowManager().getDefaultDisplay();
        Point dispSize = new Point();
        getRealSize(display, dispSize);
        return (int) (dispSize.x * mMaxWidthPercentage.floatValue());
    }
}
