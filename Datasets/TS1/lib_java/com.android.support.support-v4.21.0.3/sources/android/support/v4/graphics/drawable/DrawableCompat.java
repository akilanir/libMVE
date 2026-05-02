package android.support.v4.graphics.drawable;

import android.content.res.ColorStateList;
import android.graphics.PorterDuff;
import android.graphics.drawable.Drawable;
import android.os.Build;

/* loaded from: com.android.support.support-v4.21.0.3.jar:android/support/v4/graphics/drawable/DrawableCompat.class */
public class DrawableCompat {
    static final DrawableImpl IMPL;

    /* loaded from: com.android.support.support-v4.21.0.3.jar:android/support/v4/graphics/drawable/DrawableCompat$DrawableImpl.class */
    interface DrawableImpl {
        void jumpToCurrentState(Drawable drawable);

        void setAutoMirrored(Drawable drawable, boolean z);

        boolean isAutoMirrored(Drawable drawable);

        void setHotspot(Drawable drawable, float f, float f2);

        void setHotspotBounds(Drawable drawable, int i, int i2, int i3, int i4);

        void setTint(Drawable drawable, int i);

        void setTintList(Drawable drawable, ColorStateList colorStateList);

        void setTintMode(Drawable drawable, PorterDuff.Mode mode);
    }

    /* loaded from: com.android.support.support-v4.21.0.3.jar:android/support/v4/graphics/drawable/DrawableCompat$BaseDrawableImpl.class */
    static class BaseDrawableImpl implements DrawableImpl {
        BaseDrawableImpl() {
        }

        @Override // android.support.v4.graphics.drawable.DrawableCompat.DrawableImpl
        public void jumpToCurrentState(Drawable drawable) {
        }

        @Override // android.support.v4.graphics.drawable.DrawableCompat.DrawableImpl
        public void setAutoMirrored(Drawable drawable, boolean mirrored) {
        }

        @Override // android.support.v4.graphics.drawable.DrawableCompat.DrawableImpl
        public boolean isAutoMirrored(Drawable drawable) {
            return false;
        }

        @Override // android.support.v4.graphics.drawable.DrawableCompat.DrawableImpl
        public void setHotspot(Drawable drawable, float x, float y) {
        }

        @Override // android.support.v4.graphics.drawable.DrawableCompat.DrawableImpl
        public void setHotspotBounds(Drawable drawable, int left, int top, int right, int bottom) {
        }

        @Override // android.support.v4.graphics.drawable.DrawableCompat.DrawableImpl
        public void setTint(Drawable drawable, int tint) {
        }

        @Override // android.support.v4.graphics.drawable.DrawableCompat.DrawableImpl
        public void setTintList(Drawable drawable, ColorStateList tint) {
        }

        @Override // android.support.v4.graphics.drawable.DrawableCompat.DrawableImpl
        public void setTintMode(Drawable drawable, PorterDuff.Mode tintMode) {
        }
    }

    /* loaded from: com.android.support.support-v4.21.0.3.jar:android/support/v4/graphics/drawable/DrawableCompat$HoneycombDrawableImpl.class */
    static class HoneycombDrawableImpl extends BaseDrawableImpl {
        HoneycombDrawableImpl() {
        }

        @Override // android.support.v4.graphics.drawable.DrawableCompat.BaseDrawableImpl, android.support.v4.graphics.drawable.DrawableCompat.DrawableImpl
        public void jumpToCurrentState(Drawable drawable) {
            DrawableCompatHoneycomb.jumpToCurrentState(drawable);
        }
    }

    /* loaded from: com.android.support.support-v4.21.0.3.jar:android/support/v4/graphics/drawable/DrawableCompat$KitKatDrawableImpl.class */
    static class KitKatDrawableImpl extends HoneycombDrawableImpl {
        KitKatDrawableImpl() {
        }

        @Override // android.support.v4.graphics.drawable.DrawableCompat.BaseDrawableImpl, android.support.v4.graphics.drawable.DrawableCompat.DrawableImpl
        public void setAutoMirrored(Drawable drawable, boolean mirrored) {
            DrawableCompatKitKat.setAutoMirrored(drawable, mirrored);
        }

        @Override // android.support.v4.graphics.drawable.DrawableCompat.BaseDrawableImpl, android.support.v4.graphics.drawable.DrawableCompat.DrawableImpl
        public boolean isAutoMirrored(Drawable drawable) {
            return DrawableCompatKitKat.isAutoMirrored(drawable);
        }
    }

    /* loaded from: com.android.support.support-v4.21.0.3.jar:android/support/v4/graphics/drawable/DrawableCompat$LDrawableImpl.class */
    static class LDrawableImpl extends KitKatDrawableImpl {
        LDrawableImpl() {
        }

        @Override // android.support.v4.graphics.drawable.DrawableCompat.BaseDrawableImpl, android.support.v4.graphics.drawable.DrawableCompat.DrawableImpl
        public void setHotspot(Drawable drawable, float x, float y) {
            DrawableCompatL.setHotspot(drawable, x, y);
        }

        @Override // android.support.v4.graphics.drawable.DrawableCompat.BaseDrawableImpl, android.support.v4.graphics.drawable.DrawableCompat.DrawableImpl
        public void setHotspotBounds(Drawable drawable, int left, int top, int right, int bottom) {
            DrawableCompatL.setHotspotBounds(drawable, left, top, right, bottom);
        }

        @Override // android.support.v4.graphics.drawable.DrawableCompat.BaseDrawableImpl, android.support.v4.graphics.drawable.DrawableCompat.DrawableImpl
        public void setTint(Drawable drawable, int tint) {
            DrawableCompatL.setTint(drawable, tint);
        }

        @Override // android.support.v4.graphics.drawable.DrawableCompat.BaseDrawableImpl, android.support.v4.graphics.drawable.DrawableCompat.DrawableImpl
        public void setTintList(Drawable drawable, ColorStateList tint) {
            DrawableCompatL.setTintList(drawable, tint);
        }

        @Override // android.support.v4.graphics.drawable.DrawableCompat.BaseDrawableImpl, android.support.v4.graphics.drawable.DrawableCompat.DrawableImpl
        public void setTintMode(Drawable drawable, PorterDuff.Mode tintMode) {
            DrawableCompatL.setTintMode(drawable, tintMode);
        }
    }

    static {
        int version = Build.VERSION.SDK_INT;
        if (version >= 21) {
            IMPL = new LDrawableImpl();
            return;
        }
        if (version >= 19) {
            IMPL = new KitKatDrawableImpl();
        } else if (version >= 11) {
            IMPL = new HoneycombDrawableImpl();
        } else {
            IMPL = new BaseDrawableImpl();
        }
    }

    public static void jumpToCurrentState(Drawable drawable) {
        IMPL.jumpToCurrentState(drawable);
    }

    public static void setAutoMirrored(Drawable drawable, boolean mirrored) {
        IMPL.setAutoMirrored(drawable, mirrored);
    }

    public static boolean isAutoMirrored(Drawable drawable) {
        return IMPL.isAutoMirrored(drawable);
    }

    public static void setHotspot(Drawable drawable, float x, float y) {
        IMPL.setHotspot(drawable, x, y);
    }

    public static void setHotspotBounds(Drawable drawable, int left, int top, int right, int bottom) {
        IMPL.setHotspotBounds(drawable, left, top, right, bottom);
    }

    public static void setTint(Drawable drawable, int tint) {
        IMPL.setTint(drawable, tint);
    }

    public static void setTintList(Drawable drawable, ColorStateList tint) {
        IMPL.setTintList(drawable, tint);
    }

    public static void setTintMode(Drawable drawable, PorterDuff.Mode tintMode) {
        IMPL.setTintMode(drawable, tintMode);
    }
}
