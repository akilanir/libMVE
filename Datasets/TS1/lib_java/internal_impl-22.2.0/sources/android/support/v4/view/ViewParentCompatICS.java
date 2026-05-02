package android.support.v4.view;

import android.view.View;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;

/* loaded from: internal_impl-22.2.0.jar:android/support/v4/view/ViewParentCompatICS.class */
public class ViewParentCompatICS {
    public static boolean requestSendAccessibilityEvent(ViewParent parent, View child, AccessibilityEvent event) {
        return parent.requestSendAccessibilityEvent(child, event);
    }
}
