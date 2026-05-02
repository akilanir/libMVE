package android.support.v7.widget;

import android.R;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.support.annotation.Nullable;
import android.support.v4.view.TintableBackgroundView;
import android.support.v7.internal.widget.TintContextWrapper;
import android.support.v7.internal.widget.TintInfo;
import android.support.v7.internal.widget.TintManager;
import android.support.v7.internal.widget.TintTypedArray;
import android.util.AttributeSet;
import android.widget.EditText;

/* loaded from: com.android.support.appcompat-v7.22.1.1.jar:android/support/v7/widget/AppCompatEditText.class */
public class AppCompatEditText extends EditText implements TintableBackgroundView {
    private static final int[] TINT_ATTRS = {R.attr.background};
    private TintInfo mBackgroundTint;

    public AppCompatEditText(Context context) {
        this(context, null);
    }

    public AppCompatEditText(Context context, AttributeSet attrs) {
        this(context, attrs, android.support.v7.appcompat.R.attr.editTextStyle);
    }

    public AppCompatEditText(Context context, AttributeSet attrs, int defStyleAttr) {
        ColorStateList tint;
        super(TintContextWrapper.wrap(context), attrs, defStyleAttr);
        if (TintManager.SHOULD_BE_USED) {
            TintTypedArray a = TintTypedArray.obtainStyledAttributes(getContext(), attrs, TINT_ATTRS, defStyleAttr, 0);
            if (a.hasValue(0) && (tint = a.getTintManager().getTintList(a.getResourceId(0, -1))) != null) {
                setSupportBackgroundTintList(tint);
            }
            a.recycle();
        }
    }

    public void setSupportBackgroundTintList(@Nullable ColorStateList tint) {
        if (this.mBackgroundTint == null) {
            this.mBackgroundTint = new TintInfo();
        }
        this.mBackgroundTint.mTintList = tint;
        this.mBackgroundTint.mHasTintList = true;
        applySupportBackgroundTint();
    }

    @Nullable
    public ColorStateList getSupportBackgroundTintList() {
        if (this.mBackgroundTint != null) {
            return this.mBackgroundTint.mTintList;
        }
        return null;
    }

    public void setSupportBackgroundTintMode(@Nullable PorterDuff.Mode tintMode) {
        if (this.mBackgroundTint == null) {
            this.mBackgroundTint = new TintInfo();
        }
        this.mBackgroundTint.mTintMode = tintMode;
        this.mBackgroundTint.mHasTintMode = true;
        applySupportBackgroundTint();
    }

    @Nullable
    public PorterDuff.Mode getSupportBackgroundTintMode() {
        if (this.mBackgroundTint != null) {
            return this.mBackgroundTint.mTintMode;
        }
        return null;
    }

    @Override // android.widget.TextView, android.view.View
    protected void drawableStateChanged() {
        super.drawableStateChanged();
        applySupportBackgroundTint();
    }

    private void applySupportBackgroundTint() {
        if (getBackground() != null && this.mBackgroundTint != null) {
            TintManager.tintViewBackground(this, this.mBackgroundTint);
        }
    }
}
