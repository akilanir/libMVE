package android.support.v7.widget;

import android.R;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.support.v7.text.AllCapsTransformationMethod;
import android.text.method.PasswordTransformationMethod;
import android.util.AttributeSet;
import android.widget.TextView;

/* loaded from: com.android.support.appcompat-v7.23.3.0.jar:android/support/v7/widget/AppCompatTextHelper.class */
class AppCompatTextHelper {
    private static final int[] VIEW_ATTRS = {R.attr.textAppearance, R.attr.drawableLeft, R.attr.drawableTop, R.attr.drawableRight, R.attr.drawableBottom};
    private static final int[] TEXT_APPEARANCE_ATTRS = {android.support.v7.appcompat.R.attr.textAllCaps};
    final TextView mView;
    private TintInfo mDrawableLeftTint;
    private TintInfo mDrawableTopTint;
    private TintInfo mDrawableRightTint;
    private TintInfo mDrawableBottomTint;

    static AppCompatTextHelper create(TextView textView) {
        if (Build.VERSION.SDK_INT >= 17) {
            return new AppCompatTextHelperV17(textView);
        }
        return new AppCompatTextHelper(textView);
    }

    AppCompatTextHelper(TextView view) {
        this.mView = view;
    }

    void loadFromAttributes(AttributeSet attrs, int defStyleAttr) {
        Context context = this.mView.getContext();
        AppCompatDrawableManager drawableManager = AppCompatDrawableManager.get();
        TypedArray a = context.obtainStyledAttributes(attrs, VIEW_ATTRS, defStyleAttr, 0);
        int ap = a.getResourceId(0, -1);
        if (a.hasValue(1)) {
            this.mDrawableLeftTint = createTintInfo(context, drawableManager, a.getResourceId(1, 0));
        }
        if (a.hasValue(2)) {
            this.mDrawableTopTint = createTintInfo(context, drawableManager, a.getResourceId(2, 0));
        }
        if (a.hasValue(3)) {
            this.mDrawableRightTint = createTintInfo(context, drawableManager, a.getResourceId(3, 0));
        }
        if (a.hasValue(4)) {
            this.mDrawableBottomTint = createTintInfo(context, drawableManager, a.getResourceId(4, 0));
        }
        a.recycle();
        if (!(this.mView.getTransformationMethod() instanceof PasswordTransformationMethod)) {
            boolean allCaps = false;
            boolean allCapsSet = false;
            if (ap != -1) {
                TypedArray appearance = context.obtainStyledAttributes(ap, android.support.v7.appcompat.R.styleable.TextAppearance);
                if (appearance.hasValue(android.support.v7.appcompat.R.styleable.TextAppearance_textAllCaps)) {
                    allCapsSet = true;
                    allCaps = appearance.getBoolean(android.support.v7.appcompat.R.styleable.TextAppearance_textAllCaps, false);
                }
                appearance.recycle();
            }
            TypedArray a2 = context.obtainStyledAttributes(attrs, TEXT_APPEARANCE_ATTRS, defStyleAttr, 0);
            if (a2.hasValue(0)) {
                allCapsSet = true;
                allCaps = a2.getBoolean(0, false);
            }
            a2.recycle();
            if (allCapsSet) {
                setAllCaps(allCaps);
            }
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

    void applyCompoundDrawablesTints() {
        if (this.mDrawableLeftTint != null || this.mDrawableTopTint != null || this.mDrawableRightTint != null || this.mDrawableBottomTint != null) {
            Drawable[] compoundDrawables = this.mView.getCompoundDrawables();
            applyCompoundDrawableTint(compoundDrawables[0], this.mDrawableLeftTint);
            applyCompoundDrawableTint(compoundDrawables[1], this.mDrawableTopTint);
            applyCompoundDrawableTint(compoundDrawables[2], this.mDrawableRightTint);
            applyCompoundDrawableTint(compoundDrawables[3], this.mDrawableBottomTint);
        }
    }

    final void applyCompoundDrawableTint(Drawable drawable, TintInfo info) {
        if (drawable != null && info != null) {
            AppCompatDrawableManager.tintDrawable(drawable, info, this.mView.getDrawableState());
        }
    }

    protected static TintInfo createTintInfo(Context context, AppCompatDrawableManager drawableManager, int drawableId) {
        ColorStateList tintList = drawableManager.getTintList(context, drawableId);
        if (tintList != null) {
            TintInfo tintInfo = new TintInfo();
            tintInfo.mHasTintList = true;
            tintInfo.mTintList = tintList;
            return tintInfo;
        }
        return null;
    }
}
