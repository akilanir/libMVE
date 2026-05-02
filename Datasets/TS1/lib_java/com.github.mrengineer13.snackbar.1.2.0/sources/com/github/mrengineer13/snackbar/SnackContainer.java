package com.github.mrengineer13.snackbar;

import android.content.Context;
import android.content.res.Resources;
import android.os.Bundle;
import android.os.Parcelable;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.AnimationSet;
import android.view.animation.TranslateAnimation;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.github.mrengineer13.snackbar.SnackBar;
import java.util.LinkedList;
import java.util.Queue;

/* loaded from: com.github.mrengineer13.snackbar.1.2.0.jar:com/github/mrengineer13/snackbar/SnackContainer.class */
class SnackContainer extends FrameLayout {
    private static final int ANIMATION_DURATION = 300;
    private static final String SAVED_MSGS = "SAVED_MSGS";
    private Queue<SnackHolder> mSnacks;
    private AnimationSet mOutAnimationSet;
    private AnimationSet mInAnimationSet;
    private float mPreviousY;
    private final Runnable mHideRunnable;

    public SnackContainer(Context context) {
        super(context);
        this.mSnacks = new LinkedList();
        this.mHideRunnable = new Runnable() { // from class: com.github.mrengineer13.snackbar.SnackContainer.3
            @Override // java.lang.Runnable
            public void run() {
                if (0 == SnackContainer.this.getVisibility()) {
                    SnackContainer.this.startAnimation(SnackContainer.this.mOutAnimationSet);
                }
            }
        };
        init();
    }

    public SnackContainer(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mSnacks = new LinkedList();
        this.mHideRunnable = new Runnable() { // from class: com.github.mrengineer13.snackbar.SnackContainer.3
            @Override // java.lang.Runnable
            public void run() {
                if (0 == SnackContainer.this.getVisibility()) {
                    SnackContainer.this.startAnimation(SnackContainer.this.mOutAnimationSet);
                }
            }
        };
        init();
    }

    SnackContainer(ViewGroup container) {
        super(container.getContext());
        this.mSnacks = new LinkedList();
        this.mHideRunnable = new Runnable() { // from class: com.github.mrengineer13.snackbar.SnackContainer.3
            @Override // java.lang.Runnable
            public void run() {
                if (0 == SnackContainer.this.getVisibility()) {
                    SnackContainer.this.startAnimation(SnackContainer.this.mOutAnimationSet);
                }
            }
        };
        container.addView(this, new ViewGroup.LayoutParams(-1, -1));
        setVisibility(8);
        setId(R.id.snackContainer);
        init();
    }

    private void init() {
        this.mInAnimationSet = new AnimationSet(false);
        TranslateAnimation mSlideInAnimation = new TranslateAnimation(2, 0.0f, 2, 0.0f, 1, 1.0f, 1, 0.0f);
        AlphaAnimation mFadeInAnimation = new AlphaAnimation(0.0f, 1.0f);
        this.mInAnimationSet.addAnimation(mSlideInAnimation);
        this.mInAnimationSet.addAnimation(mFadeInAnimation);
        this.mOutAnimationSet = new AnimationSet(false);
        TranslateAnimation mSlideOutAnimation = new TranslateAnimation(2, 0.0f, 2, 0.0f, 1, 0.0f, 1, 1.0f);
        AlphaAnimation mFadeOutAnimation = new AlphaAnimation(1.0f, 0.0f);
        this.mOutAnimationSet.addAnimation(mSlideOutAnimation);
        this.mOutAnimationSet.addAnimation(mFadeOutAnimation);
        this.mOutAnimationSet.setDuration(300L);
        this.mOutAnimationSet.setAnimationListener(new Animation.AnimationListener() { // from class: com.github.mrengineer13.snackbar.SnackContainer.1
            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationStart(Animation animation) {
            }

            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationEnd(Animation animation) {
                SnackContainer.this.removeAllViews();
                if (!SnackContainer.this.mSnacks.isEmpty()) {
                    SnackContainer.this.sendOnHide((SnackHolder) SnackContainer.this.mSnacks.poll());
                }
                if (!SnackContainer.this.isEmpty()) {
                    SnackContainer.this.showSnack((SnackHolder) SnackContainer.this.mSnacks.peek());
                } else {
                    SnackContainer.this.setVisibility(8);
                }
            }

            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationRepeat(Animation animation) {
            }
        });
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        this.mInAnimationSet.cancel();
        this.mOutAnimationSet.cancel();
        removeCallbacks(this.mHideRunnable);
        this.mSnacks.clear();
    }

    public boolean isEmpty() {
        return this.mSnacks.isEmpty();
    }

    public Snack peek() {
        return this.mSnacks.peek().snack;
    }

    public Snack pollSnack() {
        return this.mSnacks.poll().snack;
    }

    public void clearSnacks(boolean animate) {
        this.mSnacks.clear();
        removeCallbacks(this.mHideRunnable);
        if (animate) {
            this.mHideRunnable.run();
        }
    }

    public boolean isShowing() {
        return !this.mSnacks.isEmpty();
    }

    public void hide() {
        removeCallbacks(this.mHideRunnable);
        this.mHideRunnable.run();
    }

    public void showSnack(Snack snack, View snackView, SnackBar.OnVisibilityChangeListener listener) {
        showSnack(snack, snackView, listener, false);
    }

    public void showSnack(Snack snack, View snackView, SnackBar.OnVisibilityChangeListener listener, boolean immediately) {
        if (snackView.getParent() != null && snackView.getParent() != this) {
            ((ViewGroup) snackView.getParent()).removeView(snackView);
        }
        SnackHolder holder = new SnackHolder(snack, snackView, listener);
        this.mSnacks.offer(holder);
        if (this.mSnacks.size() == 1) {
            showSnack(holder, immediately);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showSnack(SnackHolder holder) {
        showSnack(holder, false);
    }

    private void showSnack(final SnackHolder holder, boolean showImmediately) {
        setVisibility(0);
        sendOnShow(holder);
        addView(holder.snackView);
        holder.messageView.setText(holder.snack.mMessage);
        if (holder.snack.mActionMessage != null) {
            holder.button.setVisibility(0);
            holder.button.setText(holder.snack.mActionMessage);
            holder.button.setCompoundDrawablesWithIntrinsicBounds(holder.snack.mActionIcon, 0, 0, 0);
        } else {
            holder.button.setVisibility(8);
        }
        holder.button.setTypeface(holder.snack.mTypeface);
        holder.messageView.setTypeface(holder.snack.mTypeface);
        holder.button.setTextColor(holder.snack.mBtnTextColor);
        holder.snackView.setBackgroundColor(holder.snack.mBackgroundColor.getDefaultColor());
        if (holder.snack.mHeight > 0) {
            holder.snackView.getLayoutParams().height = getPxFromDp(holder.snack.mHeight);
        }
        if (showImmediately) {
            this.mInAnimationSet.setDuration(0L);
        } else {
            this.mInAnimationSet.setDuration(300L);
        }
        startAnimation(this.mInAnimationSet);
        if (holder.snack.mDuration > 0) {
            postDelayed(this.mHideRunnable, holder.snack.mDuration);
        }
        holder.snackView.setOnTouchListener(new View.OnTouchListener() { // from class: com.github.mrengineer13.snackbar.SnackContainer.2
            @Override // android.view.View.OnTouchListener
            public boolean onTouch(View v, MotionEvent event) {
                float y = event.getY();
                switch (event.getAction()) {
                    case 2:
                        int[] location = new int[2];
                        holder.snackView.getLocationInWindow(location);
                        if (y > SnackContainer.this.mPreviousY) {
                            float dy = y - SnackContainer.this.mPreviousY;
                            holder.snackView.offsetTopAndBottom(Math.round(4.0f * dy));
                            if ((SnackContainer.this.getResources().getDisplayMetrics().heightPixels - location[1]) - 100 <= 0) {
                                SnackContainer.this.removeCallbacks(SnackContainer.this.mHideRunnable);
                                SnackContainer.this.sendOnHide(holder);
                                SnackContainer.this.startAnimation(SnackContainer.this.mOutAnimationSet);
                                if (!SnackContainer.this.mSnacks.isEmpty()) {
                                    SnackContainer.this.mSnacks.clear();
                                    break;
                                }
                            }
                        }
                        break;
                }
                SnackContainer.this.mPreviousY = y;
                return true;
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sendOnHide(SnackHolder snackHolder) {
        if (snackHolder.visListener != null) {
            snackHolder.visListener.onHide(this.mSnacks.size());
        }
    }

    private void sendOnShow(SnackHolder snackHolder) {
        if (snackHolder.visListener != null) {
            snackHolder.visListener.onShow(this.mSnacks.size());
        }
    }

    public void restoreState(Bundle state, View v) {
        Parcelable[] messages = state.getParcelableArray(SAVED_MSGS);
        boolean showImmediately = true;
        for (Parcelable message : messages) {
            showSnack((Snack) message, v, null, showImmediately);
            showImmediately = false;
        }
    }

    public Bundle saveState() {
        Bundle outState = new Bundle();
        int count = this.mSnacks.size();
        Snack[] snacks = new Snack[count];
        int i = 0;
        for (SnackHolder holder : this.mSnacks) {
            int i2 = i;
            i++;
            snacks[i2] = holder.snack;
        }
        outState.putParcelableArray(SAVED_MSGS, snacks);
        return outState;
    }

    /* loaded from: com.github.mrengineer13.snackbar.1.2.0.jar:com/github/mrengineer13/snackbar/SnackContainer$SnackHolder.class */
    private static class SnackHolder {
        final View snackView;
        final TextView messageView;
        final TextView button;
        final Snack snack;
        final SnackBar.OnVisibilityChangeListener visListener;

        private SnackHolder(Snack snack, View snackView, SnackBar.OnVisibilityChangeListener listener) {
            this.snackView = snackView;
            this.button = (TextView) snackView.findViewById(R.id.snackButton);
            this.messageView = (TextView) snackView.findViewById(R.id.snackMessage);
            this.snack = snack;
            this.visListener = listener;
        }
    }

    private int getPxFromDp(int dp) {
        Resources rs = getResources();
        int pxConverter = (int) TypedValue.applyDimension(1, 1.0f, rs.getDisplayMetrics());
        int px = pxConverter * dp;
        return px;
    }
}
