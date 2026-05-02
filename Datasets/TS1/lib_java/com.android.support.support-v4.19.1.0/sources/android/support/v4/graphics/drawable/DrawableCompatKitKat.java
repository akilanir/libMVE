package android.support.v4.graphics.drawable;

import android.graphics.drawable.Drawable;

/* loaded from: support-v4-19.1.0.jar:android/support/v4/graphics/drawable/DrawableCompatKitKat.class */
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
