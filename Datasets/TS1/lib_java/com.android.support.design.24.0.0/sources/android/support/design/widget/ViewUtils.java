package android.support.design.widget;

import android.os.Build;
import android.support.design.widget.ValueAnimatorCompat;

/* loaded from: com.android.support.design.24.0.0.jar:android/support/design/widget/ViewUtils.class */
class ViewUtils {
    static final ValueAnimatorCompat.Creator DEFAULT_ANIMATOR_CREATOR = new ValueAnimatorCompat.Creator() { // from class: android.support.design.widget.ViewUtils.1
        @Override // android.support.design.widget.ValueAnimatorCompat.Creator
        public ValueAnimatorCompat createAnimator() {
            return new ValueAnimatorCompat(Build.VERSION.SDK_INT >= 12 ? new ValueAnimatorCompatImplHoneycombMr1() : new ValueAnimatorCompatImplEclairMr1());
        }
    };

    ViewUtils() {
    }

    static ValueAnimatorCompat createAnimator() {
        return DEFAULT_ANIMATOR_CREATOR.createAnimator();
    }
}
