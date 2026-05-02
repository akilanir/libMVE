package com.mikepenz.aboutlibraries.util;

import android.text.Spannable;
import android.text.method.LinkMovementMethod;
import android.view.MotionEvent;
import android.widget.TextView;

/* loaded from: com.mikepenz.aboutlibraries.5.1.1.jar:com/mikepenz/aboutlibraries/util/MovementCheck.class */
public class MovementCheck extends LinkMovementMethod {
    @Override // android.text.method.LinkMovementMethod, android.text.method.ScrollingMovementMethod, android.text.method.BaseMovementMethod, android.text.method.MovementMethod
    public boolean onTouchEvent(TextView widget, Spannable buffer, MotionEvent event) {
        try {
            return super.onTouchEvent(widget, buffer, event);
        } catch (Exception e) {
            return true;
        }
    }
}
