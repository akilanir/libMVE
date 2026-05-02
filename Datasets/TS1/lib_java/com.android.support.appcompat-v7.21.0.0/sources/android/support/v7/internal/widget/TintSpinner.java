package android.support.v7.internal.widget;

import android.R;
import android.content.Context;
import android.os.Build;
import android.util.AttributeSet;
import android.widget.Spinner;

/* loaded from: com.android.support.appcompat-v7.21.0.0.jar:android/support/v7/internal/widget/TintSpinner.class */
public class TintSpinner extends Spinner {
    private static final int[] TINT_ATTRS = {R.attr.background, R.attr.popupBackground};

    public TintSpinner(Context context) {
        this(context, null);
    }

    public TintSpinner(Context context, AttributeSet attrs) {
        this(context, attrs, R.attr.spinnerStyle);
    }

    public TintSpinner(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        TintTypedArray a = TintTypedArray.obtainStyledAttributes(context, attrs, TINT_ATTRS, defStyleAttr, 0);
        setBackgroundDrawable(a.getDrawable(0));
        if (Build.VERSION.SDK_INT >= 16 && a.hasValue(1)) {
            setPopupBackgroundDrawable(a.getDrawable(1));
        }
        a.recycle();
    }
}
