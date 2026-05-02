package com.nineoldandroids.animation;

/* loaded from: library-2.4.0.jar:com/nineoldandroids/animation/TimeAnimator.class */
public class TimeAnimator extends ValueAnimator {
    private TimeListener mListener;
    private long mPreviousTime = -1;

    /* loaded from: library-2.4.0.jar:com/nineoldandroids/animation/TimeAnimator$TimeListener.class */
    public interface TimeListener {
        void onTimeUpdate(TimeAnimator timeAnimator, long j, long j2);
    }

    @Override // com.nineoldandroids.animation.ValueAnimator
    boolean animationFrame(long currentTime) {
        if (this.mPlayingState == 0) {
            this.mPlayingState = 1;
            if (this.mSeekTime < 0) {
                this.mStartTime = currentTime;
            } else {
                this.mStartTime = currentTime - this.mSeekTime;
                this.mSeekTime = -1L;
            }
        }
        if (this.mListener != null) {
            long totalTime = currentTime - this.mStartTime;
            long deltaTime = this.mPreviousTime < 0 ? 0L : currentTime - this.mPreviousTime;
            this.mPreviousTime = currentTime;
            this.mListener.onTimeUpdate(this, totalTime, deltaTime);
            return false;
        }
        return false;
    }

    public void setTimeListener(TimeListener listener) {
        this.mListener = listener;
    }

    @Override // com.nineoldandroids.animation.ValueAnimator
    void animateValue(float fraction) {
    }

    @Override // com.nineoldandroids.animation.ValueAnimator
    void initAnimation() {
    }
}
