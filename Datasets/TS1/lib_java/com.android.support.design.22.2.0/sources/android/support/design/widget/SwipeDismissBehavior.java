package android.support.design.widget;

import android.support.design.widget.CoordinatorLayout;
import android.support.v4.view.ViewCompat;
import android.support.v4.widget.ViewDragHelper;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;

/* loaded from: com.android.support.design.22.2.0.jar:android/support/design/widget/SwipeDismissBehavior.class */
public class SwipeDismissBehavior<V extends View> extends CoordinatorLayout.Behavior<V> {
    public static final int STATE_IDLE = 0;
    public static final int STATE_DRAGGING = 1;
    public static final int STATE_SETTLING = 2;
    public static final int SWIPE_DIRECTION_START_TO_END = 0;
    public static final int SWIPE_DIRECTION_END_TO_START = 1;
    public static final int SWIPE_DIRECTION_ANY = 2;
    private static final float DEFAULT_DRAG_DISMISS_THRESHOLD = 0.5f;
    private static final float DEFAULT_ALPHA_START_DISTANCE = 0.0f;
    private static final float DEFAULT_ALPHA_END_DISTANCE = 0.5f;
    private ViewDragHelper mViewDragHelper;
    private OnDismissListener mListener;
    private boolean mIgnoreEvents;
    private boolean mSensitivitySet;
    private float mSensitivity = DEFAULT_ALPHA_START_DISTANCE;
    private int mSwipeDirection = 2;
    private float mDragDismissThreshold = 0.5f;
    private float mAlphaStartSwipeDistance = DEFAULT_ALPHA_START_DISTANCE;
    private float mAlphaEndSwipeDistance = 0.5f;
    private final ViewDragHelper.Callback mDragCallback = new ViewDragHelper.Callback() { // from class: android.support.design.widget.SwipeDismissBehavior.1
        private int mOriginalCapturedViewLeft;

        public boolean tryCaptureView(View child, int pointerId) {
            this.mOriginalCapturedViewLeft = child.getLeft();
            return true;
        }

        public void onViewDragStateChanged(int state) {
            if (SwipeDismissBehavior.this.mListener != null) {
                SwipeDismissBehavior.this.mListener.onDragStateChanged(state);
            }
        }

        public void onViewReleased(View child, float xvel, float yvel) {
            int targetLeft;
            int childWidth = child.getWidth();
            boolean dismiss = false;
            if (shouldDismiss(child, xvel)) {
                targetLeft = child.getLeft() < this.mOriginalCapturedViewLeft ? this.mOriginalCapturedViewLeft - childWidth : this.mOriginalCapturedViewLeft + childWidth;
                dismiss = true;
            } else {
                targetLeft = this.mOriginalCapturedViewLeft;
            }
            if (SwipeDismissBehavior.this.mViewDragHelper.settleCapturedViewAt(targetLeft, child.getTop())) {
                ViewCompat.postOnAnimation(child, new SettleRunnable(child, dismiss));
            } else if (dismiss && SwipeDismissBehavior.this.mListener != null) {
                SwipeDismissBehavior.this.mListener.onDismiss(child);
            }
        }

        private boolean shouldDismiss(View child, float xvel) {
            if (xvel != SwipeDismissBehavior.DEFAULT_ALPHA_START_DISTANCE) {
                boolean isRtl = ViewCompat.getLayoutDirection(child) == 1;
                if (SwipeDismissBehavior.this.mSwipeDirection != 2) {
                    if (SwipeDismissBehavior.this.mSwipeDirection == 0) {
                        return isRtl ? xvel < SwipeDismissBehavior.DEFAULT_ALPHA_START_DISTANCE : xvel > SwipeDismissBehavior.DEFAULT_ALPHA_START_DISTANCE;
                    }
                    if (SwipeDismissBehavior.this.mSwipeDirection == 1) {
                        return isRtl ? xvel > SwipeDismissBehavior.DEFAULT_ALPHA_START_DISTANCE : xvel < SwipeDismissBehavior.DEFAULT_ALPHA_START_DISTANCE;
                    }
                    return false;
                }
                return true;
            }
            int distance = child.getLeft() - this.mOriginalCapturedViewLeft;
            int thresholdDistance = Math.round(child.getWidth() * SwipeDismissBehavior.this.mDragDismissThreshold);
            return Math.abs(distance) >= thresholdDistance;
        }

        public int getViewHorizontalDragRange(View child) {
            return child.getWidth();
        }

        public int clampViewPositionHorizontal(View child, int left, int dx) {
            int min;
            int max;
            boolean isRtl = ViewCompat.getLayoutDirection(child) == 1;
            if (SwipeDismissBehavior.this.mSwipeDirection != 0) {
                if (SwipeDismissBehavior.this.mSwipeDirection == 1) {
                    if (isRtl) {
                        min = this.mOriginalCapturedViewLeft;
                        max = this.mOriginalCapturedViewLeft + child.getWidth();
                    } else {
                        min = this.mOriginalCapturedViewLeft - child.getWidth();
                        max = this.mOriginalCapturedViewLeft;
                    }
                } else {
                    min = this.mOriginalCapturedViewLeft - child.getWidth();
                    max = this.mOriginalCapturedViewLeft + child.getWidth();
                }
            } else if (isRtl) {
                min = this.mOriginalCapturedViewLeft - child.getWidth();
                max = this.mOriginalCapturedViewLeft;
            } else {
                min = this.mOriginalCapturedViewLeft;
                max = this.mOriginalCapturedViewLeft + child.getWidth();
            }
            return SwipeDismissBehavior.clamp(min, left, max);
        }

        public int clampViewPositionVertical(View child, int top, int dy) {
            return child.getTop();
        }

        public void onViewPositionChanged(View child, int left, int top, int dx, int dy) {
            float startAlphaDistance = child.getWidth() * SwipeDismissBehavior.this.mAlphaStartSwipeDistance;
            float endAlphaDistance = child.getWidth() * SwipeDismissBehavior.this.mAlphaEndSwipeDistance;
            if (left <= startAlphaDistance) {
                ViewCompat.setAlpha(child, 1.0f);
            } else if (left >= endAlphaDistance) {
                ViewCompat.setAlpha(child, SwipeDismissBehavior.DEFAULT_ALPHA_START_DISTANCE);
            } else {
                float distance = SwipeDismissBehavior.fraction(startAlphaDistance, endAlphaDistance, left);
                ViewCompat.setAlpha(child, SwipeDismissBehavior.clamp(SwipeDismissBehavior.DEFAULT_ALPHA_START_DISTANCE, 1.0f - distance, 1.0f));
            }
        }
    };

    /* loaded from: com.android.support.design.22.2.0.jar:android/support/design/widget/SwipeDismissBehavior$OnDismissListener.class */
    public interface OnDismissListener {
        void onDismiss(View view);

        void onDragStateChanged(int i);
    }

    public void setListener(OnDismissListener listener) {
        this.mListener = listener;
    }

    public void setSwipeDirection(int direction) {
        this.mSwipeDirection = direction;
    }

    public void setDragDismissDistance(float distance) {
        this.mDragDismissThreshold = clamp(DEFAULT_ALPHA_START_DISTANCE, distance, 1.0f);
    }

    public void setStartAlphaSwipeDistance(float fraction) {
        this.mAlphaStartSwipeDistance = clamp(DEFAULT_ALPHA_START_DISTANCE, fraction, 1.0f);
    }

    public void setEndAlphaSwipeDistance(float fraction) {
        this.mAlphaEndSwipeDistance = clamp(DEFAULT_ALPHA_START_DISTANCE, fraction, 1.0f);
    }

    public void setSensitivity(float sensitivity) {
        this.mSensitivity = sensitivity;
        this.mSensitivitySet = true;
    }

    @Override // android.support.design.widget.CoordinatorLayout.Behavior
    public boolean onInterceptTouchEvent(CoordinatorLayout parent, V child, MotionEvent event) {
        switch (event.getActionMasked()) {
            case 0:
                this.mIgnoreEvents = !parent.isPointInChildBounds(child, (int) event.getX(), (int) event.getY());
                break;
            case 1:
            case 3:
                if (this.mIgnoreEvents) {
                    this.mIgnoreEvents = false;
                    return false;
                }
                break;
        }
        if (this.mIgnoreEvents) {
            return false;
        }
        ensureViewDragHelper(parent);
        return this.mViewDragHelper.shouldInterceptTouchEvent(event);
    }

    @Override // android.support.design.widget.CoordinatorLayout.Behavior
    public boolean onTouchEvent(CoordinatorLayout parent, V child, MotionEvent event) {
        if (this.mViewDragHelper != null) {
            this.mViewDragHelper.processTouchEvent(event);
            return true;
        }
        return false;
    }

    private void ensureViewDragHelper(ViewGroup parent) {
        if (this.mViewDragHelper == null) {
            this.mViewDragHelper = this.mSensitivitySet ? ViewDragHelper.create(parent, this.mSensitivity, this.mDragCallback) : ViewDragHelper.create(parent, this.mDragCallback);
        }
    }

    /* loaded from: com.android.support.design.22.2.0.jar:android/support/design/widget/SwipeDismissBehavior$SettleRunnable.class */
    private class SettleRunnable implements Runnable {
        private final View mView;
        private final boolean mDismiss;

        SettleRunnable(View view, boolean dismiss) {
            this.mView = view;
            this.mDismiss = dismiss;
        }

        @Override // java.lang.Runnable
        public void run() {
            if (SwipeDismissBehavior.this.mViewDragHelper != null && SwipeDismissBehavior.this.mViewDragHelper.continueSettling(true)) {
                ViewCompat.postOnAnimation(this.mView, this);
            } else if (this.mDismiss && SwipeDismissBehavior.this.mListener != null) {
                SwipeDismissBehavior.this.mListener.onDismiss(this.mView);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static float clamp(float min, float value, float max) {
        return Math.min(Math.max(min, value), max);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static int clamp(int min, int value, int max) {
        return Math.min(Math.max(min, value), max);
    }

    public int getDragState() {
        if (this.mViewDragHelper != null) {
            return this.mViewDragHelper.getViewDragState();
        }
        return 0;
    }

    static float lerp(float startValue, float endValue, float fraction) {
        return startValue + (fraction * (endValue - startValue));
    }

    static float fraction(float startValue, float endValue, float value) {
        return (value - startValue) / (endValue - startValue);
    }
}
