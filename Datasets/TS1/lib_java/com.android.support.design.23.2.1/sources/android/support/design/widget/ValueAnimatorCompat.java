package android.support.design.widget;

import android.view.animation.Interpolator;

/* loaded from: com.android.support.design.23.2.1.jar:android/support/design/widget/ValueAnimatorCompat.class */
class ValueAnimatorCompat {
    private final Impl mImpl;

    /* loaded from: com.android.support.design.23.2.1.jar:android/support/design/widget/ValueAnimatorCompat$AnimatorListener.class */
    interface AnimatorListener {
        void onAnimationStart(ValueAnimatorCompat valueAnimatorCompat);

        void onAnimationEnd(ValueAnimatorCompat valueAnimatorCompat);

        void onAnimationCancel(ValueAnimatorCompat valueAnimatorCompat);
    }

    /* loaded from: com.android.support.design.23.2.1.jar:android/support/design/widget/ValueAnimatorCompat$AnimatorUpdateListener.class */
    interface AnimatorUpdateListener {
        void onAnimationUpdate(ValueAnimatorCompat valueAnimatorCompat);
    }

    /* loaded from: com.android.support.design.23.2.1.jar:android/support/design/widget/ValueAnimatorCompat$Creator.class */
    interface Creator {
        ValueAnimatorCompat createAnimator();
    }

    /* loaded from: com.android.support.design.23.2.1.jar:android/support/design/widget/ValueAnimatorCompat$AnimatorListenerAdapter.class */
    static class AnimatorListenerAdapter implements AnimatorListener {
        AnimatorListenerAdapter() {
        }

        @Override // android.support.design.widget.ValueAnimatorCompat.AnimatorListener
        public void onAnimationStart(ValueAnimatorCompat animator) {
        }

        @Override // android.support.design.widget.ValueAnimatorCompat.AnimatorListener
        public void onAnimationEnd(ValueAnimatorCompat animator) {
        }

        @Override // android.support.design.widget.ValueAnimatorCompat.AnimatorListener
        public void onAnimationCancel(ValueAnimatorCompat animator) {
        }
    }

    /* loaded from: com.android.support.design.23.2.1.jar:android/support/design/widget/ValueAnimatorCompat$Impl.class */
    static abstract class Impl {

        /* loaded from: com.android.support.design.23.2.1.jar:android/support/design/widget/ValueAnimatorCompat$Impl$AnimatorListenerProxy.class */
        interface AnimatorListenerProxy {
            void onAnimationStart();

            void onAnimationEnd();

            void onAnimationCancel();
        }

        /* loaded from: com.android.support.design.23.2.1.jar:android/support/design/widget/ValueAnimatorCompat$Impl$AnimatorUpdateListenerProxy.class */
        interface AnimatorUpdateListenerProxy {
            void onAnimationUpdate();
        }

        abstract void start();

        abstract boolean isRunning();

        abstract void setInterpolator(Interpolator interpolator);

        abstract void setListener(AnimatorListenerProxy animatorListenerProxy);

        abstract void setUpdateListener(AnimatorUpdateListenerProxy animatorUpdateListenerProxy);

        abstract void setIntValues(int i, int i2);

        abstract int getAnimatedIntValue();

        abstract void setFloatValues(float f, float f2);

        abstract float getAnimatedFloatValue();

        abstract void setDuration(int i);

        abstract void cancel();

        abstract float getAnimatedFraction();

        abstract void end();

        abstract long getDuration();

        Impl() {
        }
    }

    ValueAnimatorCompat(Impl impl) {
        this.mImpl = impl;
    }

    public void start() {
        this.mImpl.start();
    }

    public boolean isRunning() {
        return this.mImpl.isRunning();
    }

    public void setInterpolator(Interpolator interpolator) {
        this.mImpl.setInterpolator(interpolator);
    }

    public void setUpdateListener(final AnimatorUpdateListener updateListener) {
        if (updateListener != null) {
            this.mImpl.setUpdateListener(new Impl.AnimatorUpdateListenerProxy() { // from class: android.support.design.widget.ValueAnimatorCompat.1
                @Override // android.support.design.widget.ValueAnimatorCompat.Impl.AnimatorUpdateListenerProxy
                public void onAnimationUpdate() {
                    updateListener.onAnimationUpdate(ValueAnimatorCompat.this);
                }
            });
        } else {
            this.mImpl.setUpdateListener(null);
        }
    }

    public void setListener(final AnimatorListener listener) {
        if (listener != null) {
            this.mImpl.setListener(new Impl.AnimatorListenerProxy() { // from class: android.support.design.widget.ValueAnimatorCompat.2
                @Override // android.support.design.widget.ValueAnimatorCompat.Impl.AnimatorListenerProxy
                public void onAnimationStart() {
                    listener.onAnimationStart(ValueAnimatorCompat.this);
                }

                @Override // android.support.design.widget.ValueAnimatorCompat.Impl.AnimatorListenerProxy
                public void onAnimationEnd() {
                    listener.onAnimationEnd(ValueAnimatorCompat.this);
                }

                @Override // android.support.design.widget.ValueAnimatorCompat.Impl.AnimatorListenerProxy
                public void onAnimationCancel() {
                    listener.onAnimationCancel(ValueAnimatorCompat.this);
                }
            });
        } else {
            this.mImpl.setListener(null);
        }
    }

    public void setIntValues(int from, int to) {
        this.mImpl.setIntValues(from, to);
    }

    public int getAnimatedIntValue() {
        return this.mImpl.getAnimatedIntValue();
    }

    public void setFloatValues(float from, float to) {
        this.mImpl.setFloatValues(from, to);
    }

    public float getAnimatedFloatValue() {
        return this.mImpl.getAnimatedFloatValue();
    }

    public void setDuration(int duration) {
        this.mImpl.setDuration(duration);
    }

    public void cancel() {
        this.mImpl.cancel();
    }

    public float getAnimatedFraction() {
        return this.mImpl.getAnimatedFraction();
    }

    public void end() {
        this.mImpl.end();
    }

    public long getDuration() {
        return this.mImpl.getDuration();
    }
}
