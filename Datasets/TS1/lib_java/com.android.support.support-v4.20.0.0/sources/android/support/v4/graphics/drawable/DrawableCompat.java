package android.support.v4.graphics.drawable;

import android.graphics.drawable.Drawable;
import android.os.Build;

/* loaded from: com.android.support.support-v4.20.0.0.jar:android/support/v4/graphics/drawable/DrawableCompat.class */
public class DrawableCompat {
    static final DrawableImpl IMPL;

    /* loaded from: com.android.support.support-v4.20.0.0.jar:android/support/v4/graphics/drawable/DrawableCompat$DrawableImpl.class */
    interface DrawableImpl {
        void jumpToCurrentState(Drawable drawable);

        void setAutoMirrored(Drawable drawable, boolean z);

        boolean isAutoMirrored(Drawable drawable);
    }

    /* loaded from: com.android.support.support-v4.20.0.0.jar:android/support/v4/graphics/drawable/DrawableCompat$BaseDrawableImpl.class */
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
    }

    /* loaded from: com.android.support.support-v4.20.0.0.jar:android/support/v4/graphics/drawable/DrawableCompat$HoneycombDrawableImpl.class */
    static class HoneycombDrawableImpl extends BaseDrawableImpl {
        HoneycombDrawableImpl() {
        }

        @Override // android.support.v4.graphics.drawable.DrawableCompat.BaseDrawableImpl, android.support.v4.graphics.drawable.DrawableCompat.DrawableImpl
        public void jumpToCurrentState(Drawable drawable) {
            DrawableCompatHoneycomb.jumpToCurrentState(drawable);
        }
    }

    /* loaded from: com.android.support.support-v4.20.0.0.jar:android/support/v4/graphics/drawable/DrawableCompat$KitKatDrawableImpl.class */
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

    static {
        int version = Build.VERSION.SDK_INT;
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
}
