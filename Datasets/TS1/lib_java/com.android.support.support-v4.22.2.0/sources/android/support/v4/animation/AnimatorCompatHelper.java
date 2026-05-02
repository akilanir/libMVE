package android.support.v4.animation;

import android.os.Build;

/* loaded from: com.android.support.support-v4.22.2.0.jar:android/support/v4/animation/AnimatorCompatHelper.class */
public abstract class AnimatorCompatHelper {
    static AnimatorProvider IMPL;

    static {
        if (Build.VERSION.SDK_INT >= 12) {
            IMPL = new HoneycombMr1AnimatorCompatProvider();
        } else {
            IMPL = new DonutAnimatorCompatProvider();
        }
    }

    public static ValueAnimatorCompat emptyValueAnimator() {
        return IMPL.emptyValueAnimator();
    }

    AnimatorCompatHelper() {
    }
}
