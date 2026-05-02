package android.support.v4.view.accessibility;

import android.view.accessibility.AccessibilityNodeInfo;

/* loaded from: internal_impl-20.0.0.jar:android/support/v4/view/accessibility/AccessibilityNodeInfoCompatKitKat.class */
class AccessibilityNodeInfoCompatKitKat {
    AccessibilityNodeInfoCompatKitKat() {
    }

    public static int getLiveRegion(Object info) {
        return ((AccessibilityNodeInfo) info).getLiveRegion();
    }

    public static void setLiveRegion(Object info, int mode) {
        ((AccessibilityNodeInfo) info).setLiveRegion(mode);
    }
}
