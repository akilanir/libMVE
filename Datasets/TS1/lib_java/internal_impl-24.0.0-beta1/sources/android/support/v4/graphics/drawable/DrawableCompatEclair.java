package android.support.v4.graphics.drawable;

import android.graphics.drawable.Drawable;

/* loaded from: internal_impl-24.0.0-beta1.jar:android/support/v4/graphics/drawable/DrawableCompatEclair.class */
class DrawableCompatEclair {
    DrawableCompatEclair() {
    }

    public static Drawable wrapForTinting(Drawable drawable) {
        if (!(drawable instanceof TintAwareDrawable)) {
            return new DrawableWrapperEclair(drawable);
        }
        return drawable;
    }
}
