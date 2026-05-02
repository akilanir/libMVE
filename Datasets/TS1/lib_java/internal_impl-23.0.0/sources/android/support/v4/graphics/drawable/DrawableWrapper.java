package android.support.v4.graphics.drawable;

import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;

/* loaded from: internal_impl-23.0.0.jar:android/support/v4/graphics/drawable/DrawableWrapper.class */
public interface DrawableWrapper {
    void setTint(int i);

    void setTintList(ColorStateList colorStateList);

    void setTintMode(PorterDuff.Mode mode);

    Drawable getWrappedDrawable();

    void setWrappedDrawable(Drawable drawable);
}
