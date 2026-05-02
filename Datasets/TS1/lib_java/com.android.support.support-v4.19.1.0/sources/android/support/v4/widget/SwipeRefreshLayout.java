package android.support.v4.widget;

import android.R;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.os.Build;
import android.support.v4.view.ViewCompat;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.Animation;
import android.view.animation.DecelerateInterpolator;
import android.view.animation.Transformation;
import android.widget.AbsListView;

/* loaded from: support-v4-19.1.0.jar:android/support/v4/widget/SwipeRefreshLayout.class */
public class SwipeRefreshLayout extends ViewGroup {
    private static final long RETURN_TO_ORIGINAL_POSITION_TIMEOUT = 300;
    private static final float ACCELERATE_INTERPOLATION_FACTOR = 1.5f;
    private static final float DECELERATE_INTERPOLATION_FACTOR = 2.0f;
    private static final float PROGRESS_BAR_HEIGHT = 4.0f;
    private static final float MAX_SWIPE_DISTANCE_FACTOR = 0.6f;
    private static final int REFRESH_TRIGGER_DISTANCE = 120;
    private SwipeProgressBar mProgressBar;
    private View mTarget;
    private int mOriginalOffsetTop;
    private OnRefreshListener mListener;
    private MotionEvent mDownEvent;
    private int mFrom;
    private boolean mRefreshing;
    private int mTouchSlop;
    private float mDistanceToTriggerSync;
    private float mPrevY;
    private int mMediumAnimationDuration;
    private float mFromPercentage;
    private float mCurrPercentage;
    private int mProgressBarHeight;
    private int mCurrentTargetOffsetTop;
    private boolean mReturningToStart;
    private final DecelerateInterpolator mDecelerateInterpolator;
    private final AccelerateInterpolator mAccelerateInterpolator;
    private static final int[] LAYOUT_ATTRS = {R.attr.enabled};
    private final Animation mAnimateToStartPosition;
    private Animation mShrinkTrigger;
    private final Animation.AnimationListener mReturnToStartPositionListener;
    private final Animation.AnimationListener mShrinkAnimationListener;
    private final Runnable mReturnToStartPosition;
    private final Runnable mCancel;

    /* loaded from: support-v4-19.1.0.jar:android/support/v4/widget/SwipeRefreshLayout$OnRefreshListener.class */
    public interface OnRefreshListener {
        void onRefresh();
    }

    public SwipeRefreshLayout(Context context) {
        this(context, null);
    }

    public SwipeRefreshLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mRefreshing = false;
        this.mDistanceToTriggerSync = -1.0f;
        this.mFromPercentage = 0.0f;
        this.mCurrPercentage = 0.0f;
        this.mAnimateToStartPosition = new Animation() { // from class: android.support.v4.widget.SwipeRefreshLayout.1
            @Override // android.view.animation.Animation
            public void applyTransformation(float interpolatedTime, Transformation t) {
                int targetTop = 0;
                if (SwipeRefreshLayout.this.mFrom != SwipeRefreshLayout.this.mOriginalOffsetTop) {
                    targetTop = SwipeRefreshLayout.this.mFrom + ((int) ((SwipeRefreshLayout.this.mOriginalOffsetTop - SwipeRefreshLayout.this.mFrom) * interpolatedTime));
                }
                int offset = targetTop - SwipeRefreshLayout.this.mTarget.getTop();
                int currentTop = SwipeRefreshLayout.this.mTarget.getTop();
                if (offset + currentTop < 0) {
                    offset = 0 - currentTop;
                }
                SwipeRefreshLayout.this.setTargetOffsetTopAndBottom(offset);
            }
        };
        this.mShrinkTrigger = new Animation() { // from class: android.support.v4.widget.SwipeRefreshLayout.2
            @Override // android.view.animation.Animation
            public void applyTransformation(float interpolatedTime, Transformation t) {
                float percent = SwipeRefreshLayout.this.mFromPercentage + ((0.0f - SwipeRefreshLayout.this.mFromPercentage) * interpolatedTime);
                SwipeRefreshLayout.this.mProgressBar.setTriggerPercentage(percent);
            }
        };
        this.mReturnToStartPositionListener = new BaseAnimationListener() { // from class: android.support.v4.widget.SwipeRefreshLayout.3
            @Override // android.support.v4.widget.SwipeRefreshLayout.BaseAnimationListener, android.view.animation.Animation.AnimationListener
            public void onAnimationEnd(Animation animation) {
                SwipeRefreshLayout.this.mCurrentTargetOffsetTop = 0;
            }
        };
        this.mShrinkAnimationListener = new BaseAnimationListener() { // from class: android.support.v4.widget.SwipeRefreshLayout.4
            @Override // android.support.v4.widget.SwipeRefreshLayout.BaseAnimationListener, android.view.animation.Animation.AnimationListener
            public void onAnimationEnd(Animation animation) {
                SwipeRefreshLayout.this.mCurrPercentage = 0.0f;
            }
        };
        this.mReturnToStartPosition = new Runnable() { // from class: android.support.v4.widget.SwipeRefreshLayout.5
            @Override // java.lang.Runnable
            public void run() {
                SwipeRefreshLayout.this.mReturningToStart = true;
                SwipeRefreshLayout.this.animateOffsetToStartPosition(SwipeRefreshLayout.this.mCurrentTargetOffsetTop + SwipeRefreshLayout.this.getPaddingTop(), SwipeRefreshLayout.this.mReturnToStartPositionListener);
            }
        };
        this.mCancel = new Runnable() { // from class: android.support.v4.widget.SwipeRefreshLayout.6
            @Override // java.lang.Runnable
            public void run() {
                SwipeRefreshLayout.this.mReturningToStart = true;
                if (SwipeRefreshLayout.this.mProgressBar != null) {
                    SwipeRefreshLayout.this.mFromPercentage = SwipeRefreshLayout.this.mCurrPercentage;
                    SwipeRefreshLayout.this.mShrinkTrigger.setDuration(SwipeRefreshLayout.this.mMediumAnimationDuration);
                    SwipeRefreshLayout.this.mShrinkTrigger.setAnimationListener(SwipeRefreshLayout.this.mShrinkAnimationListener);
                    SwipeRefreshLayout.this.mShrinkTrigger.reset();
                    SwipeRefreshLayout.this.mShrinkTrigger.setInterpolator(SwipeRefreshLayout.this.mDecelerateInterpolator);
                    SwipeRefreshLayout.this.startAnimation(SwipeRefreshLayout.this.mShrinkTrigger);
                }
                SwipeRefreshLayout.this.animateOffsetToStartPosition(SwipeRefreshLayout.this.mCurrentTargetOffsetTop + SwipeRefreshLayout.this.getPaddingTop(), SwipeRefreshLayout.this.mReturnToStartPositionListener);
            }
        };
        this.mTouchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
        this.mMediumAnimationDuration = getResources().getInteger(R.integer.config_mediumAnimTime);
        setWillNotDraw(false);
        this.mProgressBar = new SwipeProgressBar(this);
        DisplayMetrics metrics = getResources().getDisplayMetrics();
        this.mProgressBarHeight = (int) (metrics.density * PROGRESS_BAR_HEIGHT);
        this.mDecelerateInterpolator = new DecelerateInterpolator(DECELERATE_INTERPOLATION_FACTOR);
        this.mAccelerateInterpolator = new AccelerateInterpolator(ACCELERATE_INTERPOLATION_FACTOR);
        TypedArray a = context.obtainStyledAttributes(attrs, LAYOUT_ATTRS);
        setEnabled(a.getBoolean(0, true));
        a.recycle();
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        removeCallbacks(this.mCancel);
        removeCallbacks(this.mReturnToStartPosition);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        removeCallbacks(this.mReturnToStartPosition);
        removeCallbacks(this.mCancel);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void animateOffsetToStartPosition(int from, Animation.AnimationListener listener) {
        this.mFrom = from;
        this.mAnimateToStartPosition.reset();
        this.mAnimateToStartPosition.setDuration(this.mMediumAnimationDuration);
        this.mAnimateToStartPosition.setAnimationListener(listener);
        this.mAnimateToStartPosition.setInterpolator(this.mDecelerateInterpolator);
        this.mTarget.startAnimation(this.mAnimateToStartPosition);
    }

    public void setOnRefreshListener(OnRefreshListener listener) {
        this.mListener = listener;
    }

    private void setTriggerPercentage(float percent) {
        if (percent == 0.0f) {
            this.mCurrPercentage = 0.0f;
        } else {
            this.mCurrPercentage = percent;
            this.mProgressBar.setTriggerPercentage(percent);
        }
    }

    public void setRefreshing(boolean refreshing) {
        if (this.mRefreshing != refreshing) {
            ensureTarget();
            this.mCurrPercentage = 0.0f;
            this.mRefreshing = refreshing;
            if (this.mRefreshing) {
                this.mProgressBar.start();
            } else {
                this.mProgressBar.stop();
            }
        }
    }

    public void setColorScheme(int colorRes1, int colorRes2, int colorRes3, int colorRes4) {
        ensureTarget();
        Resources res = getResources();
        int color1 = res.getColor(colorRes1);
        int color2 = res.getColor(colorRes2);
        int color3 = res.getColor(colorRes3);
        int color4 = res.getColor(colorRes4);
        this.mProgressBar.setColorScheme(color1, color2, color3, color4);
    }

    public boolean isRefreshing() {
        return this.mRefreshing;
    }

    private void ensureTarget() {
        if (this.mTarget == null) {
            if (getChildCount() > 1 && !isInEditMode()) {
                throw new IllegalStateException("SwipeRefreshLayout can host only one direct child");
            }
            this.mTarget = getChildAt(0);
            this.mOriginalOffsetTop = this.mTarget.getTop() + getPaddingTop();
        }
        if (this.mDistanceToTriggerSync == -1.0f && getParent() != null && ((View) getParent()).getHeight() > 0) {
            DisplayMetrics metrics = getResources().getDisplayMetrics();
            this.mDistanceToTriggerSync = (int) Math.min(((View) getParent()).getHeight() * MAX_SWIPE_DISTANCE_FACTOR, 120.0f * metrics.density);
        }
    }

    @Override // android.view.View
    public void draw(Canvas canvas) {
        super.draw(canvas);
        this.mProgressBar.draw(canvas);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int left, int top, int right, int bottom) {
        int width = getMeasuredWidth();
        int height = getMeasuredHeight();
        this.mProgressBar.setBounds(0, 0, width, this.mProgressBarHeight);
        if (getChildCount() == 0) {
            return;
        }
        View child = getChildAt(0);
        int childLeft = getPaddingLeft();
        int childTop = this.mCurrentTargetOffsetTop + getPaddingTop();
        int childWidth = (width - getPaddingLeft()) - getPaddingRight();
        int childHeight = (height - getPaddingTop()) - getPaddingBottom();
        child.layout(childLeft, childTop, childLeft + childWidth, childTop + childHeight);
    }

    @Override // android.view.View
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        if (getChildCount() > 1 && !isInEditMode()) {
            throw new IllegalStateException("SwipeRefreshLayout can host only one direct child");
        }
        if (getChildCount() > 0) {
            getChildAt(0).measure(View.MeasureSpec.makeMeasureSpec((getMeasuredWidth() - getPaddingLeft()) - getPaddingRight(), 1073741824), View.MeasureSpec.makeMeasureSpec((getMeasuredHeight() - getPaddingTop()) - getPaddingBottom(), 1073741824));
        }
    }

    public boolean canChildScrollUp() {
        if (Build.VERSION.SDK_INT < 14) {
            if (!(this.mTarget instanceof AbsListView)) {
                return this.mTarget.getScrollY() > 0;
            }
            AbsListView absListView = (AbsListView) this.mTarget;
            return absListView.getChildCount() > 0 && (absListView.getFirstVisiblePosition() > 0 || absListView.getChildAt(0).getTop() < absListView.getPaddingTop());
        }
        return ViewCompat.canScrollVertically(this.mTarget, -1);
    }

    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent ev) {
        ensureTarget();
        boolean handled = false;
        if (this.mReturningToStart && ev.getAction() == 0) {
            this.mReturningToStart = false;
        }
        if (isEnabled() && !this.mReturningToStart && !canChildScrollUp()) {
            handled = onTouchEvent(ev);
        }
        return !handled ? super.onInterceptTouchEvent(ev) : handled;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public void requestDisallowInterceptTouchEvent(boolean b) {
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        int action = event.getAction();
        boolean handled = false;
        switch (action) {
            case 0:
                this.mCurrPercentage = 0.0f;
                this.mDownEvent = MotionEvent.obtain(event);
                this.mPrevY = this.mDownEvent.getY();
                break;
            case 1:
            case 3:
                if (this.mDownEvent != null) {
                    this.mDownEvent.recycle();
                    this.mDownEvent = null;
                    break;
                }
                break;
            case 2:
                if (this.mDownEvent != null && !this.mReturningToStart) {
                    float eventY = event.getY();
                    float yDiff = eventY - this.mDownEvent.getY();
                    if (yDiff > this.mTouchSlop) {
                        if (yDiff > this.mDistanceToTriggerSync) {
                            startRefresh();
                            handled = true;
                            break;
                        } else {
                            setTriggerPercentage(this.mAccelerateInterpolator.getInterpolation(yDiff / this.mDistanceToTriggerSync));
                            float offsetTop = yDiff;
                            if (this.mPrevY > eventY) {
                                offsetTop = yDiff - this.mTouchSlop;
                            }
                            updateContentOffsetTop((int) offsetTop);
                            if (this.mPrevY > eventY && this.mTarget.getTop() < this.mTouchSlop) {
                                removeCallbacks(this.mCancel);
                            } else {
                                updatePositionTimeout();
                            }
                            this.mPrevY = event.getY();
                            handled = true;
                            break;
                        }
                    }
                }
                break;
        }
        return handled;
    }

    private void startRefresh() {
        removeCallbacks(this.mCancel);
        this.mReturnToStartPosition.run();
        setRefreshing(true);
        this.mListener.onRefresh();
    }

    private void updateContentOffsetTop(int targetTop) {
        int currentTop = this.mTarget.getTop();
        if (targetTop > this.mDistanceToTriggerSync) {
            targetTop = (int) this.mDistanceToTriggerSync;
        } else if (targetTop < 0) {
            targetTop = 0;
        }
        setTargetOffsetTopAndBottom(targetTop - currentTop);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setTargetOffsetTopAndBottom(int offset) {
        this.mTarget.offsetTopAndBottom(offset);
        this.mCurrentTargetOffsetTop = this.mTarget.getTop();
    }

    private void updatePositionTimeout() {
        removeCallbacks(this.mCancel);
        postDelayed(this.mCancel, RETURN_TO_ORIGINAL_POSITION_TIMEOUT);
    }

    /* loaded from: support-v4-19.1.0.jar:android/support/v4/widget/SwipeRefreshLayout$BaseAnimationListener.class */
    private class BaseAnimationListener implements Animation.AnimationListener {
        private BaseAnimationListener() {
        }

        @Override // android.view.animation.Animation.AnimationListener
        public void onAnimationStart(Animation animation) {
        }

        @Override // android.view.animation.Animation.AnimationListener
        public void onAnimationEnd(Animation animation) {
        }

        @Override // android.view.animation.Animation.AnimationListener
        public void onAnimationRepeat(Animation animation) {
        }
    }
}
