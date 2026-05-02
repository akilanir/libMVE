package android.support.v4.view.accessibility;

import android.view.View;
import android.view.accessibility.AccessibilityRecord;

/* loaded from: support-v4-18.0.0.jar:android/support/v4/view/accessibility/AccessibilityRecordCompatJellyBean.class */
class AccessibilityRecordCompatJellyBean {
    AccessibilityRecordCompatJellyBean() {
    }

    public static void setSource(Object record, View root, int virtualDescendantId) {
        ((AccessibilityRecord) record).setSource(root, virtualDescendantId);
    }
}
