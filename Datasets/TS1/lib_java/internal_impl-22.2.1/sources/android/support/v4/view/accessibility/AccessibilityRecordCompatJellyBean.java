package android.support.v4.view.accessibility;

import android.view.View;
import android.view.accessibility.AccessibilityRecord;

/* loaded from: internal_impl-22.2.1.jar:android/support/v4/view/accessibility/AccessibilityRecordCompatJellyBean.class */
class AccessibilityRecordCompatJellyBean {
    AccessibilityRecordCompatJellyBean() {
    }

    public static void setSource(Object record, View root, int virtualDescendantId) {
        ((AccessibilityRecord) record).setSource(root, virtualDescendantId);
    }
}
