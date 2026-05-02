package android.support.v7.widget;

import android.R;
import android.content.Context;
import android.support.annotation.DrawableRes;
import android.util.AttributeSet;
import android.widget.CheckedTextView;

/* loaded from: com.android.support.appcompat-v7.23.2.0.jar:android/support/v7/widget/AppCompatCheckedTextView.class */
public class AppCompatCheckedTextView extends CheckedTextView {
    private static final int[] TINT_ATTRS = {R.attr.checkMark};
    private AppCompatDrawableManager mDrawableManager;
    private AppCompatTextHelper mTextHelper;

    public AppCompatCheckedTextView(Context context) {
        this(context, null);
    }

    public AppCompatCheckedTextView(Context context, AttributeSet attrs) {
        this(context, attrs, R.attr.checkedTextViewStyle);
    }

    public AppCompatCheckedTextView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(TintContextWrapper.wrap(context), attrs, defStyleAttr);
        this.mTextHelper = AppCompatTextHelper.create(this);
        this.mTextHelper.loadFromAttributes(attrs, defStyleAttr);
        this.mTextHelper.applyCompoundDrawablesTints();
        this.mDrawableManager = AppCompatDrawableManager.get();
        TintTypedArray a = TintTypedArray.obtainStyledAttributes(getContext(), attrs, TINT_ATTRS, defStyleAttr, 0);
        setCheckMarkDrawable(a.getDrawable(0));
        a.recycle();
    }

    @Override // android.widget.CheckedTextView
    public void setCheckMarkDrawable(@DrawableRes int resId) {
        if (this.mDrawableManager != null) {
            setCheckMarkDrawable(this.mDrawableManager.getDrawable(getContext(), resId));
        } else {
            super.setCheckMarkDrawable(resId);
        }
    }

    @Override // android.widget.TextView
    public void setTextAppearance(Context context, int resId) {
        super.setTextAppearance(context, resId);
        if (this.mTextHelper != null) {
            this.mTextHelper.onSetTextAppearance(context, resId);
        }
    }

    @Override // android.widget.CheckedTextView, android.widget.TextView, android.view.View
    protected void drawableStateChanged() {
        super.drawableStateChanged();
        if (this.mTextHelper != null) {
            this.mTextHelper.applyCompoundDrawablesTints();
        }
    }
}
