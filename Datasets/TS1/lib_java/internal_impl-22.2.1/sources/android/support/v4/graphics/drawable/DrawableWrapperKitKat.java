package android.support.v4.graphics.drawable;

import android.graphics.drawable.Drawable;

/* loaded from: internal_impl-22.2.1.jar:android/support/v4/graphics/drawable/DrawableWrapperKitKat.class */
class DrawableWrapperKitKat extends DrawableWrapperHoneycomb {
    DrawableWrapperKitKat(Drawable drawable) {
        super(drawable);
    }

    @Override // android.graphics.drawable.Drawable
    public void setAutoMirrored(boolean mirrored) {
        this.mDrawable.setAutoMirrored(mirrored);
    }

    @Override // android.graphics.drawable.Drawable
    public boolean isAutoMirrored() {
        return this.mDrawable.isAutoMirrored();
    }
}
