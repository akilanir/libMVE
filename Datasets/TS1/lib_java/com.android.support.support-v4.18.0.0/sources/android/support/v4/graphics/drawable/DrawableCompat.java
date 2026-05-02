package android.support.v4.graphics.drawable;

import android.graphics.drawable.Drawable;
import android.os.Build;

/* loaded from: support-v4-18.0.0.jar:android/support/v4/graphics/drawable/DrawableCompat.class */
public class DrawableCompat {
    static final DrawableImpl IMPL;

    /* loaded from: support-v4-18.0.0.jar:android/support/v4/graphics/drawable/DrawableCompat$DrawableImpl.class */
    interface DrawableImpl {
        void jumpToCurrentState(Drawable drawable);
    }

    /* loaded from: support-v4-18.0.0.jar:android/support/v4/graphics/drawable/DrawableCompat$BaseDrawableImpl.class */
    static class BaseDrawableImpl implements DrawableImpl {
        BaseDrawableImpl() {
        }

        @Override // android.support.v4.graphics.drawable.DrawableCompat.DrawableImpl
        public void jumpToCurrentState(Drawable drawable) {
        }
    }

    /* loaded from: support-v4-18.0.0.jar:android/support/v4/graphics/drawable/DrawableCompat$HoneycombDrawableImpl.class */
    static class HoneycombDrawableImpl implements DrawableImpl {
        HoneycombDrawableImpl() {
        }

        @Override // android.support.v4.graphics.drawable.DrawableCompat.DrawableImpl
        public void jumpToCurrentState(Drawable drawable) {
            DrawableCompatHoneycomb.jumpToCurrentState(drawable);
        }
    }

    static {
        int version = Build.VERSION.SDK_INT;
        if (version >= 11) {
            IMPL = new HoneycombDrawableImpl();
        } else {
            IMPL = new BaseDrawableImpl();
        }
    }

    public static void jumpToCurrentState(Drawable drawable) {
        IMPL.jumpToCurrentState(drawable);
    }
}
