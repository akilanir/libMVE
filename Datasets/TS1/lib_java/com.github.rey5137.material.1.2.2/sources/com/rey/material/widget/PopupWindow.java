package com.rey.material.widget;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.os.Build;
import android.util.AttributeSet;
import android.view.View;
import com.rey.material.R;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/widget/PopupWindow.class */
public class PopupWindow extends android.widget.PopupWindow {
    private final boolean mOverlapAnchor;

    public PopupWindow(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.PopupWindow, defStyleAttr, 0);
        this.mOverlapAnchor = a.getBoolean(R.styleable.PopupWindow_overlapAnchor, false);
        a.recycle();
    }

    @Override // android.widget.PopupWindow
    public void showAsDropDown(View anchor, int xoff, int yoff) {
        if (Build.VERSION.SDK_INT < 21 && this.mOverlapAnchor) {
            yoff -= anchor.getHeight();
        }
        super.showAsDropDown(anchor, xoff, yoff);
    }

    @Override // android.widget.PopupWindow
    @TargetApi(19)
    public void showAsDropDown(View anchor, int xoff, int yoff, int gravity) {
        if (Build.VERSION.SDK_INT < 21 && this.mOverlapAnchor) {
            yoff -= anchor.getHeight();
        }
        super.showAsDropDown(anchor, xoff, yoff, gravity);
    }

    @Override // android.widget.PopupWindow
    public void update(View anchor, int xoff, int yoff, int width, int height) {
        if (Build.VERSION.SDK_INT < 21 && this.mOverlapAnchor) {
            yoff -= anchor.getHeight();
        }
        super.update(anchor, xoff, yoff, width, height);
    }
}
