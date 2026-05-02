package android.support.v4.view;

import android.view.View;

/* loaded from: internal_impl-22.1.1.jar:android/support/v4/view/ViewCompatKitKat.class */
class ViewCompatKitKat {
    ViewCompatKitKat() {
    }

    public static int getAccessibilityLiveRegion(View view) {
        return view.getAccessibilityLiveRegion();
    }

    public static void setAccessibilityLiveRegion(View view, int mode) {
        view.setAccessibilityLiveRegion(mode);
    }

    public static boolean isLaidOut(View view) {
        return view.isLaidOut();
    }
}
