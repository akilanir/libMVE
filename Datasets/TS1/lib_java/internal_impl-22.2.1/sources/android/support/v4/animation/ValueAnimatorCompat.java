package android.support.v4.animation;

import android.view.View;

/* loaded from: internal_impl-22.2.1.jar:android/support/v4/animation/ValueAnimatorCompat.class */
public interface ValueAnimatorCompat {
    void setTarget(View view);

    void addListener(AnimatorListenerCompat animatorListenerCompat);

    void setDuration(long j);

    void start();

    void cancel();

    void addUpdateListener(AnimatorUpdateListenerCompat animatorUpdateListenerCompat);

    float getAnimatedFraction();
}
