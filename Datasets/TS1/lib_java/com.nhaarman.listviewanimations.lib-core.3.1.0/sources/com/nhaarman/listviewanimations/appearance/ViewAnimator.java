package com.nhaarman.listviewanimations.appearance;

import android.annotation.SuppressLint;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcelable;
import android.os.SystemClock;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.SparseArray;
import android.view.View;
import android.widget.GridView;
import com.nhaarman.listviewanimations.util.ListViewWrapper;
import com.nineoldandroids.animation.Animator;
import com.nineoldandroids.animation.AnimatorSet;
import com.nineoldandroids.view.ViewHelper;

/* loaded from: com.nhaarman.listviewanimations.lib-core.3.1.0.jar:com/nhaarman/listviewanimations/appearance/ViewAnimator.class */
public class ViewAnimator {
    private static final String SAVEDINSTANCESTATE_FIRSTANIMATEDPOSITION = "savedinstancestate_firstanimatedposition";
    private static final String SAVEDINSTANCESTATE_LASTANIMATEDPOSITION = "savedinstancestate_lastanimatedposition";
    private static final String SAVEDINSTANCESTATE_SHOULDANIMATE = "savedinstancestate_shouldanimate";
    private static final int INITIAL_DELAY_MILLIS = 150;
    private static final int DEFAULT_ANIMATION_DELAY_MILLIS = 100;
    private static final int DEFAULT_ANIMATION_DURATION_MILLIS = 300;

    @NonNull
    private final ListViewWrapper mListViewWrapper;

    @NonNull
    private final SparseArray<Animator> mAnimators = new SparseArray<>();
    private int mInitialDelayMillis = INITIAL_DELAY_MILLIS;
    private int mAnimationDelayMillis = DEFAULT_ANIMATION_DELAY_MILLIS;
    private int mAnimationDurationMillis = DEFAULT_ANIMATION_DURATION_MILLIS;
    private boolean mShouldAnimate = true;
    private long mAnimationStartMillis = -1;
    private int mFirstAnimatedPosition = -1;
    private int mLastAnimatedPosition = -1;

    public ViewAnimator(@NonNull ListViewWrapper listViewWrapper) {
        this.mListViewWrapper = listViewWrapper;
    }

    public void reset() {
        for (int i = 0; i < this.mAnimators.size(); i++) {
            this.mAnimators.get(this.mAnimators.keyAt(i)).cancel();
        }
        this.mAnimators.clear();
        this.mFirstAnimatedPosition = -1;
        this.mLastAnimatedPosition = -1;
        this.mAnimationStartMillis = -1L;
        this.mShouldAnimate = true;
    }

    public void setShouldAnimateFromPosition(int position) {
        enableAnimations();
        this.mFirstAnimatedPosition = position - 1;
        this.mLastAnimatedPosition = position - 1;
    }

    public void setShouldAnimateNotVisible() {
        enableAnimations();
        this.mFirstAnimatedPosition = this.mListViewWrapper.getLastVisiblePosition();
        this.mLastAnimatedPosition = this.mListViewWrapper.getLastVisiblePosition();
    }

    void setLastAnimatedPosition(int lastAnimatedPosition) {
        this.mLastAnimatedPosition = lastAnimatedPosition;
    }

    public void setInitialDelayMillis(int delayMillis) {
        this.mInitialDelayMillis = delayMillis;
    }

    public void setAnimationDelayMillis(int delayMillis) {
        this.mAnimationDelayMillis = delayMillis;
    }

    public void setAnimationDurationMillis(int durationMillis) {
        this.mAnimationDurationMillis = durationMillis;
    }

    public void enableAnimations() {
        this.mShouldAnimate = true;
    }

    public void disableAnimations() {
        this.mShouldAnimate = false;
    }

    void cancelExistingAnimation(@NonNull View view) {
        int hashCode = view.hashCode();
        Animator animator = this.mAnimators.get(hashCode);
        if (animator != null) {
            animator.end();
            this.mAnimators.remove(hashCode);
        }
    }

    public void animateViewIfNecessary(int position, @NonNull View view, @NonNull Animator[] animators) {
        if (this.mShouldAnimate && position > this.mLastAnimatedPosition) {
            if (this.mFirstAnimatedPosition == -1) {
                this.mFirstAnimatedPosition = position;
            }
            animateView(position, view, animators);
            this.mLastAnimatedPosition = position;
        }
    }

    private void animateView(int position, @NonNull View view, @NonNull Animator[] animators) {
        if (this.mAnimationStartMillis == -1) {
            this.mAnimationStartMillis = SystemClock.uptimeMillis();
        }
        ViewHelper.setAlpha(view, 0.0f);
        Animator animatorSet = new AnimatorSet();
        animatorSet.playTogether(animators);
        animatorSet.setStartDelay(calculateAnimationDelay(position));
        animatorSet.setDuration(this.mAnimationDurationMillis);
        animatorSet.start();
        this.mAnimators.put(view.hashCode(), animatorSet);
    }

    @SuppressLint({"NewApi"})
    private int calculateAnimationDelay(int position) {
        int delay;
        int lastVisiblePosition = this.mListViewWrapper.getLastVisiblePosition();
        int firstVisiblePosition = this.mListViewWrapper.getFirstVisiblePosition();
        int numberOfItemsOnScreen = lastVisiblePosition - firstVisiblePosition;
        int numberOfAnimatedItems = (position - 1) - this.mFirstAnimatedPosition;
        if (numberOfItemsOnScreen + 1 < numberOfAnimatedItems) {
            delay = this.mAnimationDelayMillis;
            if ((this.mListViewWrapper.getListView() instanceof GridView) && Build.VERSION.SDK_INT >= 11) {
                int numColumns = ((GridView) this.mListViewWrapper.getListView()).getNumColumns();
                delay += this.mAnimationDelayMillis * (position % numColumns);
            }
        } else {
            int delaySinceStart = (position - this.mFirstAnimatedPosition) * this.mAnimationDelayMillis;
            delay = Math.max(0, (int) ((-SystemClock.uptimeMillis()) + this.mAnimationStartMillis + this.mInitialDelayMillis + delaySinceStart));
        }
        return delay;
    }

    @NonNull
    public Parcelable onSaveInstanceState() {
        Bundle bundle = new Bundle();
        bundle.putInt(SAVEDINSTANCESTATE_FIRSTANIMATEDPOSITION, this.mFirstAnimatedPosition);
        bundle.putInt(SAVEDINSTANCESTATE_LASTANIMATEDPOSITION, this.mLastAnimatedPosition);
        bundle.putBoolean(SAVEDINSTANCESTATE_SHOULDANIMATE, this.mShouldAnimate);
        return bundle;
    }

    public void onRestoreInstanceState(@Nullable Parcelable parcelable) {
        if (parcelable instanceof Bundle) {
            Bundle bundle = (Bundle) parcelable;
            this.mFirstAnimatedPosition = bundle.getInt(SAVEDINSTANCESTATE_FIRSTANIMATEDPOSITION);
            this.mLastAnimatedPosition = bundle.getInt(SAVEDINSTANCESTATE_LASTANIMATEDPOSITION);
            this.mShouldAnimate = bundle.getBoolean(SAVEDINSTANCESTATE_SHOULDANIMATE);
        }
    }
}
