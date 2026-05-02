package com.gc.materialdesign.views;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.util.AttributeSet;
import android.widget.RelativeLayout;

/* loaded from: com.github.navasmdc.MaterialDesign.1.4.jar:com/gc/materialdesign/views/CustomView.class */
public class CustomView extends RelativeLayout {
    static final String MATERIALDESIGNXML = "http://schemas.android.com/apk/res-auto";
    static final String ANDROIDXML = "http://schemas.android.com/apk/res/android";
    final int disabledBackgroundColor;
    int beforeBackground;
    public boolean isLastTouch;
    boolean animation;

    public CustomView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.disabledBackgroundColor = Color.parseColor("#E2E2E2");
        this.isLastTouch = false;
        this.animation = false;
    }

    @Override // android.view.View
    public void setEnabled(boolean enabled) {
        super.setEnabled(enabled);
        if (enabled) {
            setBackgroundColor(this.beforeBackground);
        } else {
            setBackgroundColor(this.disabledBackgroundColor);
        }
        invalidate();
    }

    @Override // android.view.View
    protected void onAnimationStart() {
        super.onAnimationStart();
        this.animation = true;
    }

    @Override // android.view.View
    protected void onAnimationEnd() {
        super.onAnimationEnd();
        this.animation = false;
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.animation) {
            invalidate();
        }
    }
}
