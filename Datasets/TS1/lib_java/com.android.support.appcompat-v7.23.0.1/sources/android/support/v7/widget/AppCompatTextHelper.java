package android.support.v7.widget;

import android.R;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.os.Build;
import android.support.v7.internal.text.AllCapsTransformationMethod;
import android.support.v7.internal.widget.ThemeUtils;
import android.util.AttributeSet;
import android.widget.TextView;

/* loaded from: com.android.support.appcompat-v7.23.0.1.jar:android/support/v7/widget/AppCompatTextHelper.class */
class AppCompatTextHelper {
    private static final int[] VIEW_ATTRS = {R.attr.textAppearance};
    private static final int[] TEXT_APPEARANCE_ATTRS = {android.support.v7.appcompat.R.attr.textAllCaps};
    private final TextView mView;

    AppCompatTextHelper(TextView view) {
        this.mView = view;
    }

    void loadFromAttributes(AttributeSet attrs, int defStyleAttr) {
        int disabledTextColor;
        Context context = this.mView.getContext();
        TypedArray a = context.obtainStyledAttributes(attrs, VIEW_ATTRS, defStyleAttr, 0);
        int ap = a.getResourceId(0, -1);
        a.recycle();
        if (ap != -1) {
            TypedArray appearance = context.obtainStyledAttributes(ap, android.support.v7.appcompat.R.styleable.TextAppearance);
            if (appearance.hasValue(android.support.v7.appcompat.R.styleable.TextAppearance_textAllCaps)) {
                setAllCaps(appearance.getBoolean(android.support.v7.appcompat.R.styleable.TextAppearance_textAllCaps, false));
            }
            appearance.recycle();
        }
        TypedArray a2 = context.obtainStyledAttributes(attrs, TEXT_APPEARANCE_ATTRS, defStyleAttr, 0);
        if (a2.hasValue(0)) {
            setAllCaps(a2.getBoolean(0, false));
        }
        a2.recycle();
        ColorStateList textColors = this.mView.getTextColors();
        if (textColors != null && !textColors.isStateful()) {
            if (Build.VERSION.SDK_INT < 21) {
                disabledTextColor = ThemeUtils.getDisabledThemeAttrColor(context, R.attr.textColorSecondary);
            } else {
                disabledTextColor = ThemeUtils.getThemeAttrColor(context, R.attr.textColorSecondary);
            }
            this.mView.setTextColor(ThemeUtils.createDisabledStateList(textColors.getDefaultColor(), disabledTextColor));
        }
    }

    void onSetTextAppearance(Context context, int resId) {
        TypedArray appearance = context.obtainStyledAttributes(resId, TEXT_APPEARANCE_ATTRS);
        if (appearance.hasValue(0)) {
            setAllCaps(appearance.getBoolean(0, false));
        }
        appearance.recycle();
    }

    void setAllCaps(boolean allCaps) {
        this.mView.setTransformationMethod(allCaps ? new AllCapsTransformationMethod(this.mView.getContext()) : null);
    }
}
