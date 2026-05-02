package org.dmfs.android.colorpicker;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import org.dmfs.android.view.ViewPager;

/* loaded from: com.github.dmfs.color-picker.c3b3b52033dc0b33bd831e731ec6f74fb1e8a69a.jar:org/dmfs/android/colorpicker/SquareViewPager.class */
public class SquareViewPager extends ViewPager {
    public SquareViewPager(Context context) {
        super(context);
    }

    public SquareViewPager(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        if (getChildCount() <= 1) {
            return;
        }
        int titleStripHeight = getChildAt(0).getMeasuredHeight();
        int width = getMeasuredWidth();
        if (View.MeasureSpec.getMode(heightMeasureSpec) == Integer.MIN_VALUE) {
            widthMeasureSpec = View.MeasureSpec.makeMeasureSpec(width, 1073741824);
        }
        super.onMeasure(widthMeasureSpec, View.MeasureSpec.makeMeasureSpec(titleStripHeight + width, 1073741824));
    }
}
