package android.support.design.widget;

import android.os.Build;
import android.support.design.widget.ValueAnimatorCompat;
import android.view.View;

/* loaded from: com.android.support.design.23.1.0.jar:android/support/design/widget/ViewUtils.class */
class ViewUtils {
    static final ValueAnimatorCompat.Creator DEFAULT_ANIMATOR_CREATOR = new ValueAnimatorCompat.Creator() { // from class: android.support.design.widget.ViewUtils.1
        @Override // android.support.design.widget.ValueAnimatorCompat.Creator
        public ValueAnimatorCompat createAnimator() {
            return new ValueAnimatorCompat(Build.VERSION.SDK_INT >= 12 ? new ValueAnimatorCompatImplHoneycombMr1() : new ValueAnimatorCompatImplEclairMr1());
        }
    };
    private static final ViewUtilsImpl IMPL;

    /* loaded from: com.android.support.design.23.1.0.jar:android/support/design/widget/ViewUtils$ViewUtilsImpl.class */
    private interface ViewUtilsImpl {
        void setBoundsViewOutlineProvider(View view);
    }

    ViewUtils() {
    }

    static {
        int version = Build.VERSION.SDK_INT;
        if (version >= 21) {
            IMPL = new ViewUtilsImplLollipop();
        } else {
            IMPL = new ViewUtilsImplBase();
        }
    }

    /* loaded from: com.android.support.design.23.1.0.jar:android/support/design/widget/ViewUtils$ViewUtilsImplBase.class */
    private static class ViewUtilsImplBase implements ViewUtilsImpl {
        private ViewUtilsImplBase() {
        }

        @Override // android.support.design.widget.ViewUtils.ViewUtilsImpl
        public void setBoundsViewOutlineProvider(View view) {
        }
    }

    /* loaded from: com.android.support.design.23.1.0.jar:android/support/design/widget/ViewUtils$ViewUtilsImplLollipop.class */
    private static class ViewUtilsImplLollipop implements ViewUtilsImpl {
        private ViewUtilsImplLollipop() {
        }

        @Override // android.support.design.widget.ViewUtils.ViewUtilsImpl
        public void setBoundsViewOutlineProvider(View view) {
            ViewUtilsLollipop.setBoundsViewOutlineProvider(view);
        }
    }

    static void setBoundsViewOutlineProvider(View view) {
        IMPL.setBoundsViewOutlineProvider(view);
    }

    static ValueAnimatorCompat createAnimator() {
        return DEFAULT_ANIMATOR_CREATOR.createAnimator();
    }
}
