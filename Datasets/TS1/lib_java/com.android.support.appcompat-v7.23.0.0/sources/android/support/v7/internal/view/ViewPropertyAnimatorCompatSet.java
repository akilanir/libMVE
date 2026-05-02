package android.support.v7.internal.view;

import android.support.v4.view.ViewPropertyAnimatorCompat;
import android.support.v4.view.ViewPropertyAnimatorListener;
import android.support.v4.view.ViewPropertyAnimatorListenerAdapter;
import android.view.View;
import android.view.animation.Interpolator;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: com.android.support.appcompat-v7.23.0.0.jar:android/support/v7/internal/view/ViewPropertyAnimatorCompatSet.class */
public class ViewPropertyAnimatorCompatSet {
    private Interpolator mInterpolator;
    private ViewPropertyAnimatorListener mListener;
    private boolean mIsStarted;
    private long mDuration = -1;
    private final ViewPropertyAnimatorListenerAdapter mProxyListener = new ViewPropertyAnimatorListenerAdapter() { // from class: android.support.v7.internal.view.ViewPropertyAnimatorCompatSet.1
        private boolean mProxyStarted = false;
        private int mProxyEndCount = 0;

        public void onAnimationStart(View view) {
            if (this.mProxyStarted) {
                return;
            }
            this.mProxyStarted = true;
            if (ViewPropertyAnimatorCompatSet.this.mListener != null) {
                ViewPropertyAnimatorCompatSet.this.mListener.onAnimationStart((View) null);
            }
        }

        void onEnd() {
            this.mProxyEndCount = 0;
            this.mProxyStarted = false;
            ViewPropertyAnimatorCompatSet.this.onAnimationsEnded();
        }

        public void onAnimationEnd(View view) {
            int i = this.mProxyEndCount + 1;
            this.mProxyEndCount = i;
            if (i == ViewPropertyAnimatorCompatSet.this.mAnimators.size()) {
                if (ViewPropertyAnimatorCompatSet.this.mListener != null) {
                    ViewPropertyAnimatorCompatSet.this.mListener.onAnimationEnd((View) null);
                }
                onEnd();
            }
        }
    };
    private final ArrayList<ViewPropertyAnimatorCompat> mAnimators = new ArrayList<>();

    public ViewPropertyAnimatorCompatSet play(ViewPropertyAnimatorCompat animator) {
        if (!this.mIsStarted) {
            this.mAnimators.add(animator);
        }
        return this;
    }

    public ViewPropertyAnimatorCompatSet playSequentially(ViewPropertyAnimatorCompat anim1, ViewPropertyAnimatorCompat anim2) {
        this.mAnimators.add(anim1);
        anim2.setStartDelay(anim1.getDuration());
        this.mAnimators.add(anim2);
        return this;
    }

    public void start() {
        if (this.mIsStarted) {
            return;
        }
        Iterator i$ = this.mAnimators.iterator();
        while (i$.hasNext()) {
            ViewPropertyAnimatorCompat animator = i$.next();
            if (this.mDuration >= 0) {
                animator.setDuration(this.mDuration);
            }
            if (this.mInterpolator != null) {
                animator.setInterpolator(this.mInterpolator);
            }
            if (this.mListener != null) {
                animator.setListener(this.mProxyListener);
            }
            animator.start();
        }
        this.mIsStarted = true;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onAnimationsEnded() {
        this.mIsStarted = false;
    }

    public void cancel() {
        if (!this.mIsStarted) {
            return;
        }
        Iterator i$ = this.mAnimators.iterator();
        while (i$.hasNext()) {
            ViewPropertyAnimatorCompat animator = i$.next();
            animator.cancel();
        }
        this.mIsStarted = false;
    }

    public ViewPropertyAnimatorCompatSet setDuration(long duration) {
        if (!this.mIsStarted) {
            this.mDuration = duration;
        }
        return this;
    }

    public ViewPropertyAnimatorCompatSet setInterpolator(Interpolator interpolator) {
        if (!this.mIsStarted) {
            this.mInterpolator = interpolator;
        }
        return this;
    }

    public ViewPropertyAnimatorCompatSet setListener(ViewPropertyAnimatorListener listener) {
        if (!this.mIsStarted) {
            this.mListener = listener;
        }
        return this;
    }
}
