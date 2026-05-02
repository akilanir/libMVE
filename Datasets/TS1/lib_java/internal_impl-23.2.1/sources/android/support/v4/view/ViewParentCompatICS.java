package android.support.v4.view;

import android.view.View;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;

/* loaded from: internal_impl-23.2.1.jar:android/support/v4/view/ViewParentCompatICS.class */
class ViewParentCompatICS {
    ViewParentCompatICS() {
    }

    public static boolean requestSendAccessibilityEvent(ViewParent parent, View child, AccessibilityEvent event) {
        return parent.requestSendAccessibilityEvent(child, event);
    }
}
