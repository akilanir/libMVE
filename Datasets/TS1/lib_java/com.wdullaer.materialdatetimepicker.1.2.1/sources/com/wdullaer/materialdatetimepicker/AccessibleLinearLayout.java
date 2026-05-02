package com.wdullaer.materialdatetimepicker;

import android.content.Context;
import android.util.AttributeSet;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.Button;
import android.widget.LinearLayout;

/* loaded from: com.wdullaer.materialdatetimepicker.1.2.1.jar:com/wdullaer/materialdatetimepicker/AccessibleLinearLayout.class */
public class AccessibleLinearLayout extends LinearLayout {
    public AccessibleLinearLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    @Override // android.view.View
    public void onInitializeAccessibilityEvent(AccessibilityEvent event) {
        super.onInitializeAccessibilityEvent(event);
        event.setClassName(Button.class.getName());
    }

    @Override // android.view.View
    public void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo info) {
        super.onInitializeAccessibilityNodeInfo(info);
        info.setClassName(Button.class.getName());
    }
}
