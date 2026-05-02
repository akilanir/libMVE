package android.support.v4.view;

import android.view.ScaleGestureDetector;

/* loaded from: support-v4-19.1.0.jar:android/support/v4/view/ScaleGestureDetectorCompatKitKat.class */
class ScaleGestureDetectorCompatKitKat {
    private ScaleGestureDetectorCompatKitKat() {
    }

    public static void setQuickScaleEnabled(Object scaleGestureDetector, boolean enabled) {
        ((ScaleGestureDetector) scaleGestureDetector).setQuickScaleEnabled(enabled);
    }

    public static boolean isQuickScaleEnabled(Object scaleGestureDetector) {
        return ((ScaleGestureDetector) scaleGestureDetector).isQuickScaleEnabled();
    }
}
