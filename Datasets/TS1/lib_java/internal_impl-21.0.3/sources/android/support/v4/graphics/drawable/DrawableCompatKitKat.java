package android.support.v4.graphics.drawable;

import android.graphics.drawable.Drawable;

/* loaded from: internal_impl-21.0.3.jar:android/support/v4/graphics/drawable/DrawableCompatKitKat.class */
class DrawableCompatKitKat {
    DrawableCompatKitKat() {
    }

    public static void setAutoMirrored(Drawable drawable, boolean mirrored) {
        drawable.setAutoMirrored(mirrored);
    }

    public static boolean isAutoMirrored(Drawable drawable) {
        return drawable.isAutoMirrored();
    }
}
