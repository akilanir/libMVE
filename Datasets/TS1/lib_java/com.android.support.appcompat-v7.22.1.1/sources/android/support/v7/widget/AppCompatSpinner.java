package android.support.v7.widget;

import android.R;
import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.support.annotation.Nullable;
import android.support.v4.view.TintableBackgroundView;
import android.support.v7.internal.widget.TintInfo;
import android.support.v7.internal.widget.TintManager;
import android.support.v7.internal.widget.TintTypedArray;
import android.util.AttributeSet;
import android.widget.Spinner;
import java.lang.reflect.Field;

/* loaded from: com.android.support.appcompat-v7.22.1.1.jar:android/support/v7/widget/AppCompatSpinner.class */
public class AppCompatSpinner extends Spinner implements TintableBackgroundView {
    private static final int[] TINT_ATTRS = {R.attr.background, R.attr.popupBackground};
    private TintInfo mBackgroundTint;

    public AppCompatSpinner(Context context) {
        this(context, null);
    }

    public AppCompatSpinner(Context context, AttributeSet attrs) {
        this(context, attrs, android.support.v7.appcompat.R.attr.spinnerStyle);
    }

    public AppCompatSpinner(Context context, AttributeSet attrs, int defStyleAttr) {
        ColorStateList tint;
        super(context, attrs, defStyleAttr);
        if (TintManager.SHOULD_BE_USED) {
            TintTypedArray a = TintTypedArray.obtainStyledAttributes(getContext(), attrs, TINT_ATTRS, defStyleAttr, 0);
            if (a.hasValue(0) && (tint = a.getTintManager().getTintList(a.getResourceId(0, -1))) != null) {
                setSupportBackgroundTintList(tint);
            }
            if (a.hasValue(1)) {
                Drawable popupBackground = a.getDrawable(1);
                if (Build.VERSION.SDK_INT >= 16) {
                    setPopupBackgroundDrawable(popupBackground);
                } else if (Build.VERSION.SDK_INT >= 11) {
                    setPopupBackgroundDrawableV11(this, popupBackground);
                }
            }
            a.recycle();
        }
    }

    @TargetApi(11)
    private static void setPopupBackgroundDrawableV11(Spinner view, Drawable background) {
        try {
            Field popupField = Spinner.class.getDeclaredField("mPopup");
            popupField.setAccessible(true);
            Object popup = popupField.get(view);
            if (popup instanceof android.widget.ListPopupWindow) {
                ((android.widget.ListPopupWindow) popup).setBackgroundDrawable(background);
            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (NoSuchFieldException e2) {
            e2.printStackTrace();
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

    @Override // android.view.ViewGroup, android.view.View
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
