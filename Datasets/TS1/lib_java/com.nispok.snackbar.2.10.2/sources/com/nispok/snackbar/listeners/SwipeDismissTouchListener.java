package com.nispok.snackbar.listeners;

import android.R;
import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import com.nispok.snackbar.BuildConfig;

/* loaded from: com.nispok.snackbar.2.10.2.jar:com/nispok/snackbar/listeners/SwipeDismissTouchListener.class */
public class SwipeDismissTouchListener implements View.OnTouchListener {
    private int mSlop;
    private int mMinFlingVelocity;
    private int mMaxFlingVelocity;
    private long mAnimationTime;
    private View mView;
    private DismissCallbacks mCallbacks;
    private int mViewWidth = 1;
    private float mDownX;
    private float mDownY;
    private boolean mSwiping;
    private int mSwipingSlop;
    private Object mToken;
    private VelocityTracker mVelocityTracker;
    private float mTranslationX;

    /* loaded from: com.nispok.snackbar.2.10.2.jar:com/nispok/snackbar/listeners/SwipeDismissTouchListener$DismissCallbacks.class */
    public interface DismissCallbacks {
        boolean canDismiss(Object obj);

        void onDismiss(View view, Object obj);

        void pauseTimer(boolean z);
    }

    public SwipeDismissTouchListener(View view, Object token, DismissCallbacks callbacks) {
        ViewConfiguration vc = ViewConfiguration.get(view.getContext());
        this.mSlop = vc.getScaledTouchSlop();
        this.mMinFlingVelocity = vc.getScaledMinimumFlingVelocity() * 16;
        this.mMaxFlingVelocity = vc.getScaledMaximumFlingVelocity();
        this.mAnimationTime = view.getContext().getResources().getInteger(R.integer.config_shortAnimTime);
        this.mView = view;
        this.mToken = token;
        this.mCallbacks = callbacks;
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View view, MotionEvent motionEvent) {
        motionEvent.offsetLocation(this.mTranslationX, 0.0f);
        if (this.mViewWidth < 2) {
            this.mViewWidth = this.mView.getWidth();
        }
        switch (motionEvent.getActionMasked()) {
            case BuildConfig.DEBUG /* 0 */:
                this.mDownX = motionEvent.getRawX();
                this.mDownY = motionEvent.getRawY();
                if (this.mCallbacks.canDismiss(this.mToken)) {
                    this.mCallbacks.pauseTimer(true);
                    this.mVelocityTracker = VelocityTracker.obtain();
                    this.mVelocityTracker.addMovement(motionEvent);
                    return false;
                }
                return false;
            case 1:
                if (this.mVelocityTracker != null) {
                    this.mCallbacks.pauseTimer(false);
                    float deltaX = motionEvent.getRawX() - this.mDownX;
                    this.mVelocityTracker.addMovement(motionEvent);
                    this.mVelocityTracker.computeCurrentVelocity(1000);
                    float velocityX = this.mVelocityTracker.getXVelocity();
                    float absVelocityX = Math.abs(velocityX);
                    float absVelocityY = Math.abs(this.mVelocityTracker.getYVelocity());
                    boolean dismiss = false;
                    boolean dismissRight = false;
                    if (Math.abs(deltaX) > this.mViewWidth / 2 && this.mSwiping) {
                        dismiss = true;
                        dismissRight = deltaX > 0.0f;
                    } else if (this.mMinFlingVelocity <= absVelocityX && absVelocityX <= this.mMaxFlingVelocity && absVelocityY < absVelocityX && absVelocityY < absVelocityX && this.mSwiping) {
                        dismiss = ((velocityX > 0.0f ? 1 : (velocityX == 0.0f ? 0 : -1)) < 0) == ((deltaX > 0.0f ? 1 : (deltaX == 0.0f ? 0 : -1)) < 0);
                        dismissRight = this.mVelocityTracker.getXVelocity() > 0.0f;
                    }
                    if (dismiss) {
                        this.mView.animate().translationX(dismissRight ? this.mViewWidth : -this.mViewWidth).alpha(0.0f).setDuration(this.mAnimationTime).setListener(new AnimatorListenerAdapter() { // from class: com.nispok.snackbar.listeners.SwipeDismissTouchListener.1
                            @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
                            public void onAnimationEnd(Animator animation) {
                                SwipeDismissTouchListener.this.performDismiss();
                            }
                        });
                    } else if (this.mSwiping) {
                        this.mView.animate().translationX(0.0f).alpha(1.0f).setDuration(this.mAnimationTime).setListener(null);
                    }
                    if (this.mVelocityTracker != null) {
                        this.mVelocityTracker.recycle();
                        this.mVelocityTracker = null;
                    }
                    this.mTranslationX = 0.0f;
                    this.mDownX = 0.0f;
                    this.mDownY = 0.0f;
                    this.mSwiping = false;
                    return false;
                }
                return false;
            case 2:
                if (this.mVelocityTracker != null) {
                    this.mVelocityTracker.addMovement(motionEvent);
                    float deltaX2 = motionEvent.getRawX() - this.mDownX;
                    float deltaY = motionEvent.getRawY() - this.mDownY;
                    if (Math.abs(deltaX2) > this.mSlop && Math.abs(deltaY) < Math.abs(deltaX2) / 2.0f) {
                        this.mSwiping = true;
                        this.mSwipingSlop = deltaX2 > 0.0f ? this.mSlop : -this.mSlop;
                        if (this.mView.getParent() != null) {
                            this.mView.getParent().requestDisallowInterceptTouchEvent(true);
                        }
                        MotionEvent cancelEvent = MotionEvent.obtain(motionEvent);
                        cancelEvent.setAction(3 | (motionEvent.getActionIndex() << 8));
                        this.mView.onTouchEvent(cancelEvent);
                        cancelEvent.recycle();
                    }
                    if (this.mSwiping) {
                        this.mTranslationX = deltaX2;
                        this.mView.setTranslationX(deltaX2 - this.mSwipingSlop);
                        this.mView.setAlpha(Math.max(0.0f, Math.min(1.0f, 1.0f - ((2.0f * Math.abs(deltaX2)) / this.mViewWidth))));
                        return true;
                    }
                    return false;
                }
                return false;
            case 3:
                if (this.mVelocityTracker != null) {
                    this.mView.animate().translationX(0.0f).alpha(1.0f).setDuration(this.mAnimationTime).setListener(null);
                    this.mVelocityTracker.recycle();
                    this.mVelocityTracker = null;
                    this.mTranslationX = 0.0f;
                    this.mDownX = 0.0f;
                    this.mDownY = 0.0f;
                    this.mSwiping = false;
                    return false;
                }
                return false;
            default:
                return false;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void performDismiss() {
        this.mCallbacks.onDismiss(this.mView, this.mToken);
    }
}
