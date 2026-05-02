package android.support.v7.widget;

import android.R;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.support.annotation.DrawableRes;
import android.support.annotation.Nullable;
import android.support.v4.view.TintableBackgroundView;
import android.util.AttributeSet;
import android.widget.TextView;

/* loaded from: com.android.support.appcompat-v7.23.2.0.jar:android/support/v7/widget/AppCompatTextView.class */
public class AppCompatTextView extends TextView implements TintableBackgroundView {
    private AppCompatDrawableManager mDrawableManager;
    private AppCompatBackgroundHelper mBackgroundTintHelper;
    private AppCompatTextHelper mTextHelper;

    public AppCompatTextView(Context context) {
        this(context, null);
    }

    public AppCompatTextView(Context context, AttributeSet attrs) {
        this(context, attrs, R.attr.textViewStyle);
    }

    public AppCompatTextView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(TintContextWrapper.wrap(context), attrs, defStyleAttr);
        this.mDrawableManager = AppCompatDrawableManager.get();
        this.mBackgroundTintHelper = new AppCompatBackgroundHelper(this, this.mDrawableManager);
        this.mBackgroundTintHelper.loadFromAttributes(attrs, defStyleAttr);
        this.mTextHelper = AppCompatTextHelper.create(this);
        this.mTextHelper.loadFromAttributes(attrs, defStyleAttr);
        this.mTextHelper.applyCompoundDrawablesTints();
    }

    @Override // android.view.View
    public void setBackgroundResource(@DrawableRes int resId) {
        super.setBackgroundResource(resId);
        if (this.mBackgroundTintHelper != null) {
            this.mBackgroundTintHelper.onSetBackgroundResource(resId);
        }
    }

    @Override // android.view.View
    public void setBackgroundDrawable(Drawable background) {
        super.setBackgroundDrawable(background);
        if (this.mBackgroundTintHelper != null) {
            this.mBackgroundTintHelper.onSetBackgroundDrawable(background);
        }
    }

    public void setSupportBackgroundTintList(@Nullable ColorStateList tint) {
        if (this.mBackgroundTintHelper != null) {
            this.mBackgroundTintHelper.setSupportBackgroundTintList(tint);
        }
    }

    @Nullable
    public ColorStateList getSupportBackgroundTintList() {
        if (this.mBackgroundTintHelper != null) {
            return this.mBackgroundTintHelper.getSupportBackgroundTintList();
        }
        return null;
    }

    public void setSupportBackgroundTintMode(@Nullable PorterDuff.Mode tintMode) {
        if (this.mBackgroundTintHelper != null) {
            this.mBackgroundTintHelper.setSupportBackgroundTintMode(tintMode);
        }
    }

    @Nullable
    public PorterDuff.Mode getSupportBackgroundTintMode() {
        if (this.mBackgroundTintHelper != null) {
            return this.mBackgroundTintHelper.getSupportBackgroundTintMode();
        }
        return null;
    }

    @Override // android.widget.TextView
    public void setTextAppearance(Context context, int resId) {
        super.setTextAppearance(context, resId);
        if (this.mTextHelper != null) {
            this.mTextHelper.onSetTextAppearance(context, resId);
        }
    }

    @Override // android.widget.TextView, android.view.View
    protected void drawableStateChanged() {
        super.drawableStateChanged();
        if (this.mBackgroundTintHelper != null) {
            this.mBackgroundTintHelper.applySupportBackgroundTint();
        }
        if (this.mTextHelper != null) {
            this.mTextHelper.applyCompoundDrawablesTints();
        }
    }
}
