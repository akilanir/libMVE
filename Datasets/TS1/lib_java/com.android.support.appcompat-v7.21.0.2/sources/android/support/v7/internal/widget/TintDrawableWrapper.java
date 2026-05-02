package android.support.v7.internal.widget;

import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;

/* loaded from: com.android.support.appcompat-v7.21.0.2.jar:android/support/v7/internal/widget/TintDrawableWrapper.class */
class TintDrawableWrapper extends DrawableWrapper {
    private final ColorStateList mTintStateList;
    private final PorterDuff.Mode mTintMode;
    private int mCurrentColor;

    public TintDrawableWrapper(Drawable drawable, ColorStateList tintStateList) {
        this(drawable, tintStateList, TintManager.DEFAULT_MODE);
    }

    public TintDrawableWrapper(Drawable drawable, ColorStateList tintStateList, PorterDuff.Mode tintMode) {
        super(drawable);
        this.mTintStateList = tintStateList;
        this.mTintMode = tintMode;
    }

    @Override // android.support.v7.internal.widget.DrawableWrapper, android.graphics.drawable.Drawable
    public boolean isStateful() {
        return (this.mTintStateList != null && this.mTintStateList.isStateful()) || super.isStateful();
    }

    @Override // android.support.v7.internal.widget.DrawableWrapper, android.graphics.drawable.Drawable
    public boolean setState(int[] stateSet) {
        boolean handled = super.setState(stateSet);
        boolean handled2 = updateTint(stateSet) || handled;
        return handled2;
    }

    private boolean updateTint(int[] state) {
        int color;
        if (this.mTintStateList != null && (color = this.mTintStateList.getColorForState(state, this.mCurrentColor)) != this.mCurrentColor) {
            if (color != 0) {
                setColorFilter(color, this.mTintMode);
            } else {
                clearColorFilter();
            }
            this.mCurrentColor = color;
            return true;
        }
        return false;
    }
}
