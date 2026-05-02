package android.support.v7.widget;

import android.R;
import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.support.annotation.DrawableRes;
import android.support.v7.internal.widget.TintManager;
import android.support.v7.internal.widget.TintTypedArray;
import android.util.AttributeSet;
import android.widget.CheckBox;

/* loaded from: com.android.support.appcompat-v7.22.2.0.jar:android/support/v7/widget/AppCompatCheckBox.class */
public class AppCompatCheckBox extends CheckBox {
    private static final int[] TINT_ATTRS = {R.attr.button};
    private TintManager mTintManager;
    private Drawable mButtonDrawable;

    public AppCompatCheckBox(Context context) {
        this(context, null);
    }

    public AppCompatCheckBox(Context context, AttributeSet attrs) {
        this(context, attrs, android.support.v7.appcompat.R.attr.checkboxStyle);
    }

    public AppCompatCheckBox(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        if (TintManager.SHOULD_BE_USED) {
            TintTypedArray a = TintTypedArray.obtainStyledAttributes(getContext(), attrs, TINT_ATTRS, defStyleAttr, 0);
            setButtonDrawable(a.getDrawable(0));
            a.recycle();
            this.mTintManager = a.getTintManager();
        }
    }

    @Override // android.widget.CompoundButton
    public void setButtonDrawable(Drawable buttonDrawable) {
        super.setButtonDrawable(buttonDrawable);
        this.mButtonDrawable = buttonDrawable;
    }

    @Override // android.widget.CompoundButton
    public void setButtonDrawable(@DrawableRes int resId) {
        if (this.mTintManager != null) {
            setButtonDrawable(this.mTintManager.getDrawable(resId));
        } else {
            super.setButtonDrawable(resId);
        }
    }

    @Override // android.widget.CompoundButton, android.widget.TextView
    public int getCompoundPaddingLeft() {
        int padding = super.getCompoundPaddingLeft();
        if (Build.VERSION.SDK_INT < 17 && this.mButtonDrawable != null) {
            padding += this.mButtonDrawable.getIntrinsicWidth();
        }
        return padding;
    }
}
