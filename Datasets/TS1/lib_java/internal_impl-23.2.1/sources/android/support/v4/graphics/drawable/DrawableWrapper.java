package android.support.v4.graphics.drawable;

import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;

/* loaded from: internal_impl-23.2.1.jar:android/support/v4/graphics/drawable/DrawableWrapper.class */
public interface DrawableWrapper {
    void setCompatTint(int i);

    void setCompatTintList(ColorStateList colorStateList);

    void setCompatTintMode(PorterDuff.Mode mode);

    Drawable getWrappedDrawable();

    void setWrappedDrawable(Drawable drawable);
}
