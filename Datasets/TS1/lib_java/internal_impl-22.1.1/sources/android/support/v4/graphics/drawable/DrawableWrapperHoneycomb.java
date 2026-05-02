package android.support.v4.graphics.drawable;

import android.graphics.drawable.Drawable;

/* loaded from: internal_impl-22.1.1.jar:android/support/v4/graphics/drawable/DrawableWrapperHoneycomb.class */
class DrawableWrapperHoneycomb extends DrawableWrapperDonut {
    DrawableWrapperHoneycomb(Drawable drawable) {
        super(drawable);
    }

    @Override // android.graphics.drawable.Drawable
    public void jumpToCurrentState() {
        this.mDrawable.jumpToCurrentState();
    }
}
