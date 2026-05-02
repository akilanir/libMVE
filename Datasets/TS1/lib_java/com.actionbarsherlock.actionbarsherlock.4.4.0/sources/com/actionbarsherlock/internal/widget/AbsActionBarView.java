package com.actionbarsherlock.internal.widget;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.os.Build;
import android.util.AttributeSet;
import android.view.View;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Interpolator;
import com.actionbarsherlock.R;
import com.actionbarsherlock.internal.ResourcesCompat;
import com.actionbarsherlock.internal.nineoldandroids.animation.Animator;
import com.actionbarsherlock.internal.nineoldandroids.animation.AnimatorSet;
import com.actionbarsherlock.internal.nineoldandroids.animation.ObjectAnimator;
import com.actionbarsherlock.internal.nineoldandroids.view.NineViewGroup;
import com.actionbarsherlock.internal.view.menu.ActionMenuPresenter;
import com.actionbarsherlock.internal.view.menu.ActionMenuView;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/widget/AbsActionBarView.class */
public abstract class AbsActionBarView extends NineViewGroup {
    protected ActionMenuView mMenuView;
    protected ActionMenuPresenter mActionMenuPresenter;
    protected ActionBarContainer mSplitView;
    protected boolean mSplitActionBar;
    protected boolean mSplitWhenNarrow;
    protected int mContentHeight;
    final Context mContext;
    protected Animator mVisibilityAnim;
    protected final VisibilityAnimListener mVisAnimListener;
    private static final Interpolator sAlphaInterpolator = new DecelerateInterpolator();
    private static final int FADE_DURATION = 200;

    public AbsActionBarView(Context context) {
        super(context);
        this.mVisAnimListener = new VisibilityAnimListener();
        this.mContext = context;
    }

    public AbsActionBarView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mVisAnimListener = new VisibilityAnimListener();
        this.mContext = context;
    }

    public AbsActionBarView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mVisAnimListener = new VisibilityAnimListener();
        this.mContext = context;
    }

    @Override // android.view.View
    public void onConfigurationChanged(Configuration newConfig) {
        if (Build.VERSION.SDK_INT >= 8) {
            super.onConfigurationChanged(newConfig);
        } else if (this.mMenuView != null) {
            this.mMenuView.onConfigurationChanged(newConfig);
        }
        TypedArray a = getContext().obtainStyledAttributes(null, R.styleable.SherlockActionBar, R.attr.actionBarStyle, 0);
        setContentHeight(a.getLayoutDimension(3, 0));
        a.recycle();
        if (this.mSplitWhenNarrow) {
            setSplitActionBar(ResourcesCompat.getResources_getBoolean(getContext(), R.bool.abs__split_action_bar_is_narrow));
        }
        if (this.mActionMenuPresenter != null) {
            this.mActionMenuPresenter.onConfigurationChanged(newConfig);
        }
    }

    public void setSplitActionBar(boolean split) {
        this.mSplitActionBar = split;
    }

    public void setSplitWhenNarrow(boolean splitWhenNarrow) {
        this.mSplitWhenNarrow = splitWhenNarrow;
    }

    public void setContentHeight(int height) {
        this.mContentHeight = height;
        requestLayout();
    }

    public int getContentHeight() {
        return this.mContentHeight;
    }

    public void setSplitView(ActionBarContainer splitView) {
        this.mSplitView = splitView;
    }

    public int getAnimatedVisibility() {
        if (this.mVisibilityAnim != null) {
            return this.mVisAnimListener.mFinalVisibility;
        }
        return getVisibility();
    }

    public void animateToVisibility(int visibility) {
        if (this.mVisibilityAnim != null) {
            this.mVisibilityAnim.cancel();
        }
        if (visibility == 0) {
            if (getVisibility() != 0) {
                setAlpha(0.0f);
                if (this.mSplitView != null && this.mMenuView != null) {
                    this.mMenuView.setAlpha(0.0f);
                }
            }
            ObjectAnimator anim = ObjectAnimator.ofFloat(this, "alpha", 1.0f);
            anim.setDuration(200L);
            anim.setInterpolator(sAlphaInterpolator);
            if (this.mSplitView != null && this.mMenuView != null) {
                AnimatorSet set = new AnimatorSet();
                ObjectAnimator splitAnim = ObjectAnimator.ofFloat(this.mMenuView, "alpha", 1.0f);
                splitAnim.setDuration(200L);
                set.addListener(this.mVisAnimListener.withFinalVisibility(visibility));
                set.play(anim).with(splitAnim);
                set.start();
                return;
            }
            anim.addListener(this.mVisAnimListener.withFinalVisibility(visibility));
            anim.start();
            return;
        }
        ObjectAnimator anim2 = ObjectAnimator.ofFloat(this, "alpha", 0.0f);
        anim2.setDuration(200L);
        anim2.setInterpolator(sAlphaInterpolator);
        if (this.mSplitView != null && this.mMenuView != null) {
            AnimatorSet set2 = new AnimatorSet();
            ObjectAnimator splitAnim2 = ObjectAnimator.ofFloat(this.mMenuView, "alpha", 0.0f);
            splitAnim2.setDuration(200L);
            set2.addListener(this.mVisAnimListener.withFinalVisibility(visibility));
            set2.play(anim2).with(splitAnim2);
            set2.start();
            return;
        }
        anim2.addListener(this.mVisAnimListener.withFinalVisibility(visibility));
        anim2.start();
    }

    @Override // com.actionbarsherlock.internal.nineoldandroids.view.NineViewGroup, android.view.View
    public void setVisibility(int visibility) {
        if (this.mVisibilityAnim != null) {
            this.mVisibilityAnim.end();
        }
        super.setVisibility(visibility);
    }

    public boolean showOverflowMenu() {
        if (this.mActionMenuPresenter != null) {
            return this.mActionMenuPresenter.showOverflowMenu();
        }
        return false;
    }

    public void postShowOverflowMenu() {
        post(new Runnable() { // from class: com.actionbarsherlock.internal.widget.AbsActionBarView.1
            @Override // java.lang.Runnable
            public void run() {
                AbsActionBarView.this.showOverflowMenu();
            }
        });
    }

    public boolean hideOverflowMenu() {
        if (this.mActionMenuPresenter != null) {
            return this.mActionMenuPresenter.hideOverflowMenu();
        }
        return false;
    }

    public boolean isOverflowMenuShowing() {
        if (this.mActionMenuPresenter != null) {
            return this.mActionMenuPresenter.isOverflowMenuShowing();
        }
        return false;
    }

    public boolean isOverflowReserved() {
        return this.mActionMenuPresenter != null && this.mActionMenuPresenter.isOverflowReserved();
    }

    public void dismissPopupMenus() {
        if (this.mActionMenuPresenter != null) {
            this.mActionMenuPresenter.dismissPopupMenus();
        }
    }

    protected int measureChildView(View child, int availableWidth, int childSpecHeight, int spacing) {
        child.measure(View.MeasureSpec.makeMeasureSpec(availableWidth, Integer.MIN_VALUE), childSpecHeight);
        return Math.max(0, (availableWidth - child.getMeasuredWidth()) - spacing);
    }

    protected int positionChild(View child, int x, int y, int contentHeight) {
        int childWidth = child.getMeasuredWidth();
        int childHeight = child.getMeasuredHeight();
        int childTop = y + ((contentHeight - childHeight) / 2);
        child.layout(x, childTop, x + childWidth, childTop + childHeight);
        return childWidth;
    }

    protected int positionChildInverse(View child, int x, int y, int contentHeight) {
        int childWidth = child.getMeasuredWidth();
        int childHeight = child.getMeasuredHeight();
        int childTop = y + ((contentHeight - childHeight) / 2);
        child.layout(x - childWidth, childTop, x, childTop + childHeight);
        return childWidth;
    }

    /* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/widget/AbsActionBarView$VisibilityAnimListener.class */
    protected class VisibilityAnimListener implements Animator.AnimatorListener {
        private boolean mCanceled = false;
        int mFinalVisibility;

        protected VisibilityAnimListener() {
        }

        public VisibilityAnimListener withFinalVisibility(int visibility) {
            this.mFinalVisibility = visibility;
            return this;
        }

        @Override // com.actionbarsherlock.internal.nineoldandroids.animation.Animator.AnimatorListener
        public void onAnimationStart(Animator animation) {
            AbsActionBarView.this.setVisibility(0);
            AbsActionBarView.this.mVisibilityAnim = animation;
            this.mCanceled = false;
        }

        @Override // com.actionbarsherlock.internal.nineoldandroids.animation.Animator.AnimatorListener
        public void onAnimationEnd(Animator animation) {
            if (this.mCanceled) {
                return;
            }
            AbsActionBarView.this.mVisibilityAnim = null;
            AbsActionBarView.this.setVisibility(this.mFinalVisibility);
            if (AbsActionBarView.this.mSplitView != null && AbsActionBarView.this.mMenuView != null) {
                AbsActionBarView.this.mMenuView.setVisibility(this.mFinalVisibility);
            }
        }

        @Override // com.actionbarsherlock.internal.nineoldandroids.animation.Animator.AnimatorListener
        public void onAnimationCancel(Animator animation) {
            this.mCanceled = true;
        }

        @Override // com.actionbarsherlock.internal.nineoldandroids.animation.Animator.AnimatorListener
        public void onAnimationRepeat(Animator animation) {
        }
    }
}
