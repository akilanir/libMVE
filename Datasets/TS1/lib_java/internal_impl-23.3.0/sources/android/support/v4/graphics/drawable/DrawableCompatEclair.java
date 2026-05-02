package android.support.v4.graphics.drawable;

import android.graphics.drawable.Drawable;

/* loaded from: internal_impl-23.3.0.jar:android/support/v4/graphics/drawable/DrawableCompatEclair.class */
class DrawableCompatEclair {
    DrawableCompatEclair() {
    }

    public static Drawable wrapForTinting(Drawable drawable) {
        if (!(drawable instanceof DrawableWrapperEclair)) {
            return new DrawableWrapperEclair(drawable);
        }
        return drawable;
    }
}
