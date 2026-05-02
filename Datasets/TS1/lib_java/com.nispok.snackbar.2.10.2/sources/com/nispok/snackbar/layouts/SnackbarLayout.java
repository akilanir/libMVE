package com.nispok.snackbar.layouts;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.LinearLayout;

/* loaded from: com.nispok.snackbar.2.10.2.jar:com/nispok/snackbar/layouts/SnackbarLayout.class */
public class SnackbarLayout extends LinearLayout {
    private int mMaxWidth;
    private int mMaxHeight;

    public SnackbarLayout(Context context) {
        super(context);
        this.mMaxWidth = Integer.MAX_VALUE;
        this.mMaxHeight = Integer.MAX_VALUE;
    }

    public SnackbarLayout(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public SnackbarLayout(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mMaxWidth = Integer.MAX_VALUE;
        this.mMaxHeight = Integer.MAX_VALUE;
    }

    @Override // android.widget.LinearLayout, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int width = View.MeasureSpec.getSize(widthMeasureSpec);
        if (this.mMaxWidth < width) {
            int mode = View.MeasureSpec.getMode(widthMeasureSpec);
            widthMeasureSpec = View.MeasureSpec.makeMeasureSpec(this.mMaxWidth, mode);
        }
        int height = View.MeasureSpec.getSize(heightMeasureSpec);
        if (this.mMaxHeight < height) {
            int mode2 = View.MeasureSpec.getMode(heightMeasureSpec);
            heightMeasureSpec = View.MeasureSpec.makeMeasureSpec(this.mMaxHeight, mode2);
        }
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
    }

    public void setMaxWidth(int maxWidth) {
        this.mMaxWidth = maxWidth;
        requestLayout();
    }

    public void setMaxHeight(int maxHeight) {
        this.mMaxHeight = maxHeight;
        requestLayout();
    }
}
