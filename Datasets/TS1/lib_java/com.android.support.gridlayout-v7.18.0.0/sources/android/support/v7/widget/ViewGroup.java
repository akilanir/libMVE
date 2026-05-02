package android.support.v7.widget;

import android.content.Context;
import android.os.Build;
import android.util.AttributeSet;
import android.view.View;

/* loaded from: com.android.support.gridlayout-v7.18.0.0.jar:android/support/v7/widget/ViewGroup.class */
abstract class ViewGroup extends android.view.ViewGroup {
    protected static final int MEASURED_STATE_TOO_SMALL = 16777216;
    protected static final int MEASURED_STATE_MASK = -16777216;

    public ViewGroup(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    public static int resolveSizeAndState(int size, int measureSpec, int childMeasuredState) {
        if (Build.VERSION.SDK_INT >= 11) {
            return View.resolveSizeAndState(size, measureSpec, childMeasuredState);
        }
        int result = size;
        int specMode = View.MeasureSpec.getMode(measureSpec);
        int specSize = View.MeasureSpec.getSize(measureSpec);
        switch (specMode) {
            case GridLayout.UNDEFINED /* -2147483648 */:
                if (specSize < size) {
                    result = specSize | MEASURED_STATE_TOO_SMALL;
                    break;
                } else {
                    result = size;
                    break;
                }
            case 0:
                result = size;
                break;
            case 1073741824:
                result = specSize;
                break;
        }
        return result | (childMeasuredState & MEASURED_STATE_MASK);
    }

    protected static boolean isLayoutRtl(View view) {
        return false;
    }
}
