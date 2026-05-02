package android.support.v4.graphics.drawable;

import android.graphics.drawable.Drawable;

/* loaded from: internal_impl-22.2.1.jar:android/support/v4/graphics/drawable/DrawableCompatHoneycomb.class */
class DrawableCompatHoneycomb {
    DrawableCompatHoneycomb() {
    }

    public static void jumpToCurrentState(Drawable drawable) {
        drawable.jumpToCurrentState();
    }

    public static Drawable wrapForTinting(Drawable drawable) {
        if (!(drawable instanceof DrawableWrapperHoneycomb)) {
            return new DrawableWrapperHoneycomb(drawable);
        }
        return drawable;
    }
}
