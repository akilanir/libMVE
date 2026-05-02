package com.wdullaer.materialdatetimepicker.date;

import android.content.Context;
import android.text.format.DateUtils;
import android.util.AttributeSet;
import android.view.accessibility.AccessibilityEvent;
import android.widget.ViewAnimator;

/* loaded from: com.wdullaer.materialdatetimepicker.1.5.1.jar:com/wdullaer/materialdatetimepicker/date/AccessibleDateAnimator.class */
public class AccessibleDateAnimator extends ViewAnimator {
    private long mDateMillis;

    public AccessibleDateAnimator(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public void setDateMillis(long dateMillis) {
        this.mDateMillis = dateMillis;
    }

    @Override // android.view.View
    public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent event) {
        if (event.getEventType() == 32) {
            event.getText().clear();
            String dateString = DateUtils.formatDateTime(getContext(), this.mDateMillis, 22);
            event.getText().add(dateString);
            return true;
        }
        return super.dispatchPopulateAccessibilityEvent(event);
    }
}
