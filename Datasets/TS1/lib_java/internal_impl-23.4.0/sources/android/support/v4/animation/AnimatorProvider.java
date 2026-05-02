package android.support.v4.animation;

import android.view.View;

/* loaded from: internal_impl-23.4.0.jar:android/support/v4/animation/AnimatorProvider.class */
interface AnimatorProvider {
    ValueAnimatorCompat emptyValueAnimator();

    void clearInterpolator(View view);
}
