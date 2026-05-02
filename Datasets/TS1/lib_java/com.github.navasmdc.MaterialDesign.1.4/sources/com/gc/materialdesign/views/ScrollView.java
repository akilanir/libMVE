package com.gc.materialdesign.views;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.ViewGroup;

/* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/views/ScrollView.class */
public class ScrollView extends android.widget.ScrollView {
    public ScrollView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    @Override // android.widget.ScrollView, android.view.View
    public boolean onTouchEvent(MotionEvent ev) {
        CustomView child;
        for (int i = 0; i < ((ViewGroup) getChildAt(0)).getChildCount(); i++) {
            try {
                child = (CustomView) ((ViewGroup) getChildAt(0)).getChildAt(i);
            } catch (ClassCastException e) {
            }
            if (!child.isLastTouch) {
                continue;
            } else {
                child.onTouchEvent(ev);
                return true;
            }
        }
        return super.onTouchEvent(ev);
    }
}
