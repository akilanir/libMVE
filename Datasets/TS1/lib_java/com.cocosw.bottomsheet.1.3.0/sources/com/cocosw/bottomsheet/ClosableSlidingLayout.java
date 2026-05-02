package com.cocosw.bottomsheet;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.Build;
import android.support.annotation.NonNull;
import android.support.v4.view.MotionEventCompat;
import android.support.v4.view.ViewCompat;
import android.support.v4.widget.ViewDragHelper;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.widget.AbsListView;
import android.widget.FrameLayout;

/* loaded from: com.cocosw.bottomsheet.1.3.0.jar:com/cocosw/bottomsheet/ClosableSlidingLayout.class */
class ClosableSlidingLayout extends FrameLayout {
    private static final int INVALID_POINTER = -1;
    private final float MINVEL;
    View mTarget;
    boolean swipeable;
    private ViewDragHelper mDragHelper;
    private SlideListener mListener;
    private int height;
    private int top;
    private int mActivePointerId;
    private boolean mIsBeingDragged;
    private float mInitialMotionY;
    private boolean collapsible;
    private float yDiff;

    /* loaded from: com.cocosw.bottomsheet.1.3.0.jar:com/cocosw/bottomsheet/ClosableSlidingLayout$SlideListener.class */
    interface SlideListener {
        void onClosed();

        void onOpened();
    }

    public ClosableSlidingLayout(Context context) {
        this(context, null);
    }

    public ClosableSlidingLayout(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    @TargetApi(11)
    public ClosableSlidingLayout(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.swipeable = true;
        this.collapsible = false;
        this.mDragHelper = ViewDragHelper.create(this, 0.8f, new ViewDragCallback());
        this.MINVEL = getResources().getDisplayMetrics().density * 400.0f;
    }

    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(@NonNull MotionEvent event) {
        int action = MotionEventCompat.getActionMasked(event);
        if (!isEnabled() || canChildScrollUp()) {
            return false;
        }
        if (action == 3 || action == 1) {
            this.mActivePointerId = -1;
            this.mIsBeingDragged = false;
            if (this.collapsible && (-this.yDiff) > this.mDragHelper.getTouchSlop()) {
                expand(this.mDragHelper.getCapturedView(), 0.0f);
            }
            this.mDragHelper.cancel();
            return false;
        }
        switch (action) {
            case BuildConfig.DEBUG /* 0 */:
                this.height = getChildAt(0).getHeight();
                this.top = getChildAt(0).getTop();
                this.mActivePointerId = MotionEventCompat.getPointerId(event, 0);
                this.mIsBeingDragged = false;
                float initialMotionY = getMotionEventY(event, this.mActivePointerId);
                if (initialMotionY == -1.0f) {
                    return false;
                }
                this.mInitialMotionY = initialMotionY;
                this.yDiff = 0.0f;
                break;
            case 2:
                if (this.mActivePointerId == -1) {
                    return false;
                }
                float y = getMotionEventY(event, this.mActivePointerId);
                if (y == -1.0f) {
                    return false;
                }
                this.yDiff = y - this.mInitialMotionY;
                if (this.swipeable && this.yDiff > this.mDragHelper.getTouchSlop() && !this.mIsBeingDragged) {
                    this.mIsBeingDragged = true;
                    this.mDragHelper.captureChildView(getChildAt(0), 0);
                    break;
                }
                break;
        }
        this.mDragHelper.shouldInterceptTouchEvent(event);
        return this.mIsBeingDragged;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public void requestDisallowInterceptTouchEvent(boolean b) {
    }

    private boolean canChildScrollUp() {
        if (Build.VERSION.SDK_INT < 14) {
            if (!(this.mTarget instanceof AbsListView)) {
                return this.mTarget.getScrollY() > 0;
            }
            AbsListView absListView = (AbsListView) this.mTarget;
            return absListView.getChildCount() > 0 && (absListView.getFirstVisiblePosition() > 0 || absListView.getChildAt(0).getTop() < absListView.getPaddingTop());
        }
        return ViewCompat.canScrollVertically(this.mTarget, -1);
    }

    private float getMotionEventY(MotionEvent ev, int activePointerId) {
        int index = MotionEventCompat.findPointerIndex(ev, activePointerId);
        if (index < 0) {
            return -1.0f;
        }
        return MotionEventCompat.getY(ev, index);
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent ev) {
        if (!isEnabled() || canChildScrollUp()) {
            return super.onTouchEvent(ev);
        }
        try {
            if (this.swipeable) {
                this.mDragHelper.processTouchEvent(ev);
            }
            return true;
        } catch (Exception e) {
            return true;
        }
    }

    @Override // android.view.View
    public void computeScroll() {
        if (this.mDragHelper.continueSettling(true)) {
            ViewCompat.postInvalidateOnAnimation(this);
        }
    }

    void setSlideListener(SlideListener listener) {
        this.mListener = listener;
    }

    void setCollapsible(boolean collapsible) {
        this.collapsible = collapsible;
    }

    private void expand(View releasedChild, float yvel) {
        if (this.mListener != null) {
            this.mListener.onOpened();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dismiss(View view, float yvel) {
        this.mDragHelper.smoothSlideViewTo(view, 0, this.top + this.height);
        ViewCompat.postInvalidateOnAnimation(this);
    }

    /* loaded from: com.cocosw.bottomsheet.1.3.0.jar:com/cocosw/bottomsheet/ClosableSlidingLayout$ViewDragCallback.class */
    private class ViewDragCallback extends ViewDragHelper.Callback {
        private ViewDragCallback() {
        }

        public boolean tryCaptureView(View child, int pointerId) {
            return true;
        }

        public void onViewReleased(View releasedChild, float xvel, float yvel) {
            if (yvel > ClosableSlidingLayout.this.MINVEL) {
                ClosableSlidingLayout.this.dismiss(releasedChild, yvel);
            } else if (releasedChild.getTop() >= ClosableSlidingLayout.this.top + (ClosableSlidingLayout.this.height / 2)) {
                ClosableSlidingLayout.this.dismiss(releasedChild, yvel);
            } else {
                ClosableSlidingLayout.this.mDragHelper.smoothSlideViewTo(releasedChild, 0, ClosableSlidingLayout.this.top);
                ViewCompat.postInvalidateOnAnimation(ClosableSlidingLayout.this);
            }
        }

        public void onViewPositionChanged(View changedView, int left, int top, int dx, int dy) {
            if (Build.VERSION.SDK_INT < 11) {
                ClosableSlidingLayout.this.invalidate();
            }
            if (ClosableSlidingLayout.this.height - top < 1 && ClosableSlidingLayout.this.mListener != null) {
                ClosableSlidingLayout.this.mDragHelper.cancel();
                ClosableSlidingLayout.this.mListener.onClosed();
                ClosableSlidingLayout.this.mDragHelper.smoothSlideViewTo(changedView, 0, top);
            }
        }

        public int clampViewPositionVertical(View child, int top, int dy) {
            return Math.max(top, ClosableSlidingLayout.this.top);
        }
    }
}
