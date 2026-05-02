package com.actionbarsherlock.internal.widget;

import android.R;
import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.View;
import android.widget.LinearLayout;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/widget/TabsLinearLayout.class */
public class TabsLinearLayout extends IcsLinearLayout {
    private static final int[] R_styleable_LinearLayout = {R.attr.measureWithLargestChild};
    private static final int LinearLayout_measureWithLargestChild = 0;
    private boolean mUseLargestChild;

    public TabsLinearLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        TypedArray a = context.obtainStyledAttributes(attrs, R_styleable_LinearLayout);
        this.mUseLargestChild = a.getBoolean(0, false);
        a.recycle();
    }

    @Override // android.widget.LinearLayout
    public boolean isMeasureWithLargestChildEnabled() {
        return this.mUseLargestChild;
    }

    @Override // android.widget.LinearLayout
    public void setMeasureWithLargestChildEnabled(boolean enabled) {
        this.mUseLargestChild = enabled;
    }

    @Override // android.widget.LinearLayout, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        int childCount = getChildCount();
        if (childCount <= 2) {
            return;
        }
        int mode = View.MeasureSpec.getMode(widthMeasureSpec);
        if (this.mUseLargestChild && mode == 0) {
            int orientation = getOrientation();
            if (orientation == 0) {
                useLargestChildHorizontal();
            }
        }
    }

    private void useLargestChildHorizontal() {
        int totalWidth;
        int childCount = getChildCount();
        int largestChildWidth = 0;
        for (int i = 0; i < childCount; i++) {
            largestChildWidth = Math.max(getChildAt(i).getMeasuredWidth(), largestChildWidth);
        }
        int totalWidth2 = 0;
        for (int i2 = 0; i2 < childCount; i2++) {
            View child = getChildAt(i2);
            if (child != null && child.getVisibility() != 8) {
                LinearLayout.LayoutParams lp = (LinearLayout.LayoutParams) child.getLayoutParams();
                float childExtra = lp.weight;
                if (childExtra > 0.0f) {
                    child.measure(View.MeasureSpec.makeMeasureSpec(largestChildWidth, 1073741824), View.MeasureSpec.makeMeasureSpec(child.getMeasuredHeight(), 1073741824));
                    totalWidth = totalWidth2 + largestChildWidth;
                } else {
                    totalWidth = totalWidth2 + child.getMeasuredWidth();
                }
                totalWidth2 = totalWidth + lp.leftMargin + lp.rightMargin;
            }
        }
        setMeasuredDimension(totalWidth2 + getPaddingLeft() + getPaddingRight(), getMeasuredHeight());
    }
}
