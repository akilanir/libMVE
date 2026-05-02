package android.support.design.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.support.design.R;
import android.support.design.widget.CoordinatorLayout;
import android.support.v4.view.MotionEventCompat;
import android.support.v4.view.NestedScrollingChild;
import android.support.v4.view.VelocityTrackerCompat;
import android.support.v4.view.ViewCompat;
import android.support.v4.widget.ViewDragHelper;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.ref.WeakReference;

/* loaded from: com.android.support.design.23.2.1.jar:android/support/design/widget/BottomSheetBehavior.class */
public class BottomSheetBehavior<V extends View> extends CoordinatorLayout.Behavior<V> {
    public static final int STATE_DRAGGING = 1;
    public static final int STATE_SETTLING = 2;
    public static final int STATE_EXPANDED = 3;
    public static final int STATE_COLLAPSED = 4;
    public static final int STATE_HIDDEN = 5;
    private static final float HIDE_THRESHOLD = 0.5f;
    private static final float HIDE_FRICTION = 0.1f;
    private float mMaximumVelocity;
    private int mPeekHeight;
    private int mMinOffset;
    private int mMaxOffset;
    private boolean mHideable;
    private int mState;
    private ViewDragHelper mViewDragHelper;
    private boolean mIgnoreEvents;
    private int mLastNestedScrollDy;
    private boolean mNestedScrolled;
    private int mParentHeight;
    private WeakReference<V> mViewRef;
    private WeakReference<View> mNestedScrollingChildRef;
    private BottomSheetCallback mCallback;
    private VelocityTracker mVelocityTracker;
    private int mActivePointerId;
    private int mInitialY;
    private boolean mTouchingScrollingChild;
    private final ViewDragHelper.Callback mDragCallback;

    /* loaded from: com.android.support.design.23.2.1.jar:android/support/design/widget/BottomSheetBehavior$BottomSheetCallback.class */
    public static abstract class BottomSheetCallback {
        public abstract void onStateChanged(@NonNull View view, int i);

        public abstract void onSlide(@NonNull View view, float f);
    }

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: com.android.support.design.23.2.1.jar:android/support/design/widget/BottomSheetBehavior$State.class */
    public @interface State {
    }

    public BottomSheetBehavior() {
        this.mState = 4;
        this.mDragCallback = new ViewDragHelper.Callback() { // from class: android.support.design.widget.BottomSheetBehavior.1
            public boolean tryCaptureView(View child, int pointerId) {
                View scroll;
                if (BottomSheetBehavior.this.mState == 1 || BottomSheetBehavior.this.mTouchingScrollingChild) {
                    return false;
                }
                return ((BottomSheetBehavior.this.mState == 3 && BottomSheetBehavior.this.mActivePointerId == pointerId && (scroll = (View) BottomSheetBehavior.this.mNestedScrollingChildRef.get()) != null && ViewCompat.canScrollVertically(scroll, -1)) || BottomSheetBehavior.this.mViewRef == null || BottomSheetBehavior.this.mViewRef.get() != child) ? false : true;
            }

            public void onViewPositionChanged(View changedView, int left, int top, int dx, int dy) {
                BottomSheetBehavior.this.dispatchOnSlide(top);
            }

            public void onViewDragStateChanged(int state) {
                if (state == 1) {
                    BottomSheetBehavior.this.setStateInternal(1);
                }
            }

            public void onViewReleased(View releasedChild, float xvel, float yvel) {
                int top;
                int targetState;
                if (yvel < 0.0f) {
                    top = BottomSheetBehavior.this.mMinOffset;
                    targetState = 3;
                } else if (BottomSheetBehavior.this.mHideable && BottomSheetBehavior.this.shouldHide(releasedChild, yvel)) {
                    top = BottomSheetBehavior.this.mParentHeight;
                    targetState = 5;
                } else if (yvel != 0.0f) {
                    top = BottomSheetBehavior.this.mMaxOffset;
                    targetState = 4;
                } else {
                    int currentTop = releasedChild.getTop();
                    if (Math.abs(currentTop - BottomSheetBehavior.this.mMinOffset) < Math.abs(currentTop - BottomSheetBehavior.this.mMaxOffset)) {
                        top = BottomSheetBehavior.this.mMinOffset;
                        targetState = 3;
                    } else {
                        top = BottomSheetBehavior.this.mMaxOffset;
                        targetState = 4;
                    }
                }
                if (BottomSheetBehavior.this.mViewDragHelper.settleCapturedViewAt(releasedChild.getLeft(), top)) {
                    BottomSheetBehavior.this.setStateInternal(2);
                    ViewCompat.postOnAnimation(releasedChild, new SettleRunnable(releasedChild, targetState));
                } else {
                    BottomSheetBehavior.this.setStateInternal(targetState);
                }
            }

            public int clampViewPositionVertical(View child, int top, int dy) {
                return MathUtils.constrain(top, BottomSheetBehavior.this.mMinOffset, BottomSheetBehavior.this.mHideable ? BottomSheetBehavior.this.mParentHeight : BottomSheetBehavior.this.mMaxOffset);
            }

            public int clampViewPositionHorizontal(View child, int left, int dx) {
                return child.getLeft();
            }

            public int getViewVerticalDragRange(View child) {
                return BottomSheetBehavior.this.mHideable ? BottomSheetBehavior.this.mParentHeight - BottomSheetBehavior.this.mMinOffset : BottomSheetBehavior.this.mMaxOffset - BottomSheetBehavior.this.mMinOffset;
            }
        };
    }

    public BottomSheetBehavior(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mState = 4;
        this.mDragCallback = new ViewDragHelper.Callback() { // from class: android.support.design.widget.BottomSheetBehavior.1
            public boolean tryCaptureView(View child, int pointerId) {
                View scroll;
                if (BottomSheetBehavior.this.mState == 1 || BottomSheetBehavior.this.mTouchingScrollingChild) {
                    return false;
                }
                return ((BottomSheetBehavior.this.mState == 3 && BottomSheetBehavior.this.mActivePointerId == pointerId && (scroll = (View) BottomSheetBehavior.this.mNestedScrollingChildRef.get()) != null && ViewCompat.canScrollVertically(scroll, -1)) || BottomSheetBehavior.this.mViewRef == null || BottomSheetBehavior.this.mViewRef.get() != child) ? false : true;
            }

            public void onViewPositionChanged(View changedView, int left, int top, int dx, int dy) {
                BottomSheetBehavior.this.dispatchOnSlide(top);
            }

            public void onViewDragStateChanged(int state) {
                if (state == 1) {
                    BottomSheetBehavior.this.setStateInternal(1);
                }
            }

            public void onViewReleased(View releasedChild, float xvel, float yvel) {
                int top;
                int targetState;
                if (yvel < 0.0f) {
                    top = BottomSheetBehavior.this.mMinOffset;
                    targetState = 3;
                } else if (BottomSheetBehavior.this.mHideable && BottomSheetBehavior.this.shouldHide(releasedChild, yvel)) {
                    top = BottomSheetBehavior.this.mParentHeight;
                    targetState = 5;
                } else if (yvel != 0.0f) {
                    top = BottomSheetBehavior.this.mMaxOffset;
                    targetState = 4;
                } else {
                    int currentTop = releasedChild.getTop();
                    if (Math.abs(currentTop - BottomSheetBehavior.this.mMinOffset) < Math.abs(currentTop - BottomSheetBehavior.this.mMaxOffset)) {
                        top = BottomSheetBehavior.this.mMinOffset;
                        targetState = 3;
                    } else {
                        top = BottomSheetBehavior.this.mMaxOffset;
                        targetState = 4;
                    }
                }
                if (BottomSheetBehavior.this.mViewDragHelper.settleCapturedViewAt(releasedChild.getLeft(), top)) {
                    BottomSheetBehavior.this.setStateInternal(2);
                    ViewCompat.postOnAnimation(releasedChild, new SettleRunnable(releasedChild, targetState));
                } else {
                    BottomSheetBehavior.this.setStateInternal(targetState);
                }
            }

            public int clampViewPositionVertical(View child, int top, int dy) {
                return MathUtils.constrain(top, BottomSheetBehavior.this.mMinOffset, BottomSheetBehavior.this.mHideable ? BottomSheetBehavior.this.mParentHeight : BottomSheetBehavior.this.mMaxOffset);
            }

            public int clampViewPositionHorizontal(View child, int left, int dx) {
                return child.getLeft();
            }

            public int getViewVerticalDragRange(View child) {
                return BottomSheetBehavior.this.mHideable ? BottomSheetBehavior.this.mParentHeight - BottomSheetBehavior.this.mMinOffset : BottomSheetBehavior.this.mMaxOffset - BottomSheetBehavior.this.mMinOffset;
            }
        };
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.BottomSheetBehavior_Params);
        setPeekHeight(a.getDimensionPixelSize(R.styleable.BottomSheetBehavior_Params_behavior_peekHeight, 0));
        setHideable(a.getBoolean(R.styleable.BottomSheetBehavior_Params_behavior_hideable, false));
        a.recycle();
        ViewConfiguration configuration = ViewConfiguration.get(context);
        this.mMaximumVelocity = configuration.getScaledMaximumFlingVelocity();
    }

    @Override // android.support.design.widget.CoordinatorLayout.Behavior
    public Parcelable onSaveInstanceState(CoordinatorLayout parent, V child) {
        return new SavedState(super.onSaveInstanceState(parent, child), this.mState);
    }

    @Override // android.support.design.widget.CoordinatorLayout.Behavior
    public void onRestoreInstanceState(CoordinatorLayout parent, V child, Parcelable state) {
        SavedState ss = (SavedState) state;
        super.onRestoreInstanceState(parent, child, ss.getSuperState());
        if (ss.state == 1 || ss.state == 2) {
            this.mState = 4;
        } else {
            this.mState = ss.state;
        }
    }

    @Override // android.support.design.widget.CoordinatorLayout.Behavior
    public boolean onLayoutChild(CoordinatorLayout parent, V child, int layoutDirection) {
        if (this.mState != 1 && this.mState != 2) {
            parent.onLayoutChild(child, layoutDirection);
        }
        this.mParentHeight = parent.getHeight();
        this.mMinOffset = Math.max(0, this.mParentHeight - child.getHeight());
        this.mMaxOffset = Math.max(this.mParentHeight - this.mPeekHeight, this.mMinOffset);
        if (this.mState == 3) {
            ViewCompat.offsetTopAndBottom(child, this.mMinOffset);
        } else if (this.mHideable && this.mState == 5) {
            ViewCompat.offsetTopAndBottom(child, this.mParentHeight);
        } else if (this.mState == 4) {
            ViewCompat.offsetTopAndBottom(child, this.mMaxOffset);
        }
        if (this.mViewDragHelper == null) {
            this.mViewDragHelper = ViewDragHelper.create(parent, this.mDragCallback);
        }
        this.mViewRef = new WeakReference<>(child);
        this.mNestedScrollingChildRef = new WeakReference<>(findScrollingChild(child));
        return true;
    }

    @Override // android.support.design.widget.CoordinatorLayout.Behavior
    public boolean onInterceptTouchEvent(CoordinatorLayout parent, V child, MotionEvent event) {
        if (!child.isShown()) {
            return false;
        }
        int action = MotionEventCompat.getActionMasked(event);
        if (action == 0) {
            reset();
        }
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        }
        this.mVelocityTracker.addMovement(event);
        switch (action) {
            case 0:
                int initialX = (int) event.getX();
                this.mInitialY = (int) event.getY();
                View scroll = this.mNestedScrollingChildRef.get();
                if (scroll != null && parent.isPointInChildBounds(scroll, initialX, this.mInitialY)) {
                    this.mActivePointerId = event.getPointerId(event.getActionIndex());
                    this.mTouchingScrollingChild = true;
                }
                this.mIgnoreEvents = this.mActivePointerId == -1 && !parent.isPointInChildBounds(child, initialX, this.mInitialY);
                break;
            case 1:
            case 3:
                this.mTouchingScrollingChild = false;
                this.mActivePointerId = -1;
                if (this.mIgnoreEvents) {
                    this.mIgnoreEvents = false;
                    return false;
                }
                break;
        }
        if (!this.mIgnoreEvents && this.mViewDragHelper.shouldInterceptTouchEvent(event)) {
            return true;
        }
        View scroll2 = this.mNestedScrollingChildRef.get();
        return (action != 2 || scroll2 == null || this.mIgnoreEvents || this.mState == 1 || parent.isPointInChildBounds(scroll2, (int) event.getX(), (int) event.getY()) || Math.abs(((float) this.mInitialY) - event.getY()) <= ((float) this.mViewDragHelper.getTouchSlop())) ? false : true;
    }

    @Override // android.support.design.widget.CoordinatorLayout.Behavior
    public boolean onTouchEvent(CoordinatorLayout parent, V child, MotionEvent event) {
        if (!child.isShown()) {
            return false;
        }
        int action = MotionEventCompat.getActionMasked(event);
        if (this.mState == 1 && action == 0) {
            return true;
        }
        this.mViewDragHelper.processTouchEvent(event);
        if (action == 0) {
            reset();
        }
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        }
        this.mVelocityTracker.addMovement(event);
        if (action == 2 && Math.abs(this.mInitialY - event.getY()) > this.mViewDragHelper.getTouchSlop()) {
            this.mViewDragHelper.captureChildView(child, event.getPointerId(event.getActionIndex()));
            return true;
        }
        return true;
    }

    @Override // android.support.design.widget.CoordinatorLayout.Behavior
    public boolean onStartNestedScroll(CoordinatorLayout coordinatorLayout, V child, View directTargetChild, View target, int nestedScrollAxes) {
        this.mLastNestedScrollDy = 0;
        this.mNestedScrolled = false;
        return (nestedScrollAxes & 2) != 0;
    }

    @Override // android.support.design.widget.CoordinatorLayout.Behavior
    public void onNestedPreScroll(CoordinatorLayout coordinatorLayout, V child, View target, int dx, int dy, int[] consumed) {
        View scrollingChild = this.mNestedScrollingChildRef.get();
        if (target != scrollingChild) {
            return;
        }
        int currentTop = child.getTop();
        int newTop = currentTop - dy;
        if (dy > 0) {
            if (newTop < this.mMinOffset) {
                consumed[1] = currentTop - this.mMinOffset;
                ViewCompat.offsetTopAndBottom(child, -consumed[1]);
                setStateInternal(3);
            } else {
                consumed[1] = dy;
                ViewCompat.offsetTopAndBottom(child, -dy);
                setStateInternal(1);
            }
        } else if (dy < 0 && !ViewCompat.canScrollVertically(target, -1)) {
            if (newTop <= this.mMaxOffset || this.mHideable) {
                consumed[1] = dy;
                ViewCompat.offsetTopAndBottom(child, -dy);
                setStateInternal(1);
            } else {
                consumed[1] = currentTop - this.mMaxOffset;
                ViewCompat.offsetTopAndBottom(child, -consumed[1]);
                setStateInternal(4);
            }
        }
        dispatchOnSlide(child.getTop());
        this.mLastNestedScrollDy = dy;
        this.mNestedScrolled = true;
    }

    @Override // android.support.design.widget.CoordinatorLayout.Behavior
    public void onStopNestedScroll(CoordinatorLayout coordinatorLayout, V child, View target) {
        int top;
        int targetState;
        if (child.getTop() == this.mMinOffset) {
            setStateInternal(3);
            return;
        }
        if (target != this.mNestedScrollingChildRef.get() || !this.mNestedScrolled) {
            return;
        }
        if (this.mLastNestedScrollDy > 0) {
            top = this.mMinOffset;
            targetState = 3;
        } else if (this.mHideable && shouldHide(child, getYVelocity())) {
            top = this.mParentHeight;
            targetState = 5;
        } else if (this.mLastNestedScrollDy == 0) {
            int currentTop = child.getTop();
            if (Math.abs(currentTop - this.mMinOffset) < Math.abs(currentTop - this.mMaxOffset)) {
                top = this.mMinOffset;
                targetState = 3;
            } else {
                top = this.mMaxOffset;
                targetState = 4;
            }
        } else {
            top = this.mMaxOffset;
            targetState = 4;
        }
        if (this.mViewDragHelper.smoothSlideViewTo(child, child.getLeft(), top)) {
            setStateInternal(2);
            ViewCompat.postOnAnimation(child, new SettleRunnable(child, targetState));
        } else {
            setStateInternal(targetState);
        }
        this.mNestedScrolled = false;
    }

    @Override // android.support.design.widget.CoordinatorLayout.Behavior
    public boolean onNestedPreFling(CoordinatorLayout coordinatorLayout, V child, View target, float velocityX, float velocityY) {
        return target == this.mNestedScrollingChildRef.get() && (this.mState != 3 || super.onNestedPreFling(coordinatorLayout, child, target, velocityX, velocityY));
    }

    public final void setPeekHeight(int peekHeight) {
        this.mPeekHeight = Math.max(0, peekHeight);
        this.mMaxOffset = this.mParentHeight - peekHeight;
    }

    public final int getPeekHeight() {
        return this.mPeekHeight;
    }

    public void setHideable(boolean hideable) {
        this.mHideable = hideable;
    }

    public boolean isHideable() {
        return this.mHideable;
    }

    public void setBottomSheetCallback(BottomSheetCallback callback) {
        this.mCallback = callback;
    }

    public final void setState(int state) {
        int top;
        V child = this.mViewRef.get();
        if (child == null) {
            return;
        }
        if (state == 4) {
            top = this.mMaxOffset;
        } else if (state == 3) {
            top = this.mMinOffset;
        } else if (this.mHideable && state == 5) {
            top = this.mParentHeight;
        } else {
            throw new IllegalArgumentException("Illegal state argument: " + state);
        }
        setStateInternal(2);
        if (this.mViewDragHelper.smoothSlideViewTo(child, child.getLeft(), top)) {
            ViewCompat.postOnAnimation(child, new SettleRunnable(child, state));
        }
    }

    public final int getState() {
        return this.mState;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setStateInternal(int state) {
        if (this.mState == state) {
            return;
        }
        this.mState = state;
        View bottomSheet = this.mViewRef.get();
        if (bottomSheet != null && this.mCallback != null) {
            this.mCallback.onStateChanged(bottomSheet, state);
        }
    }

    private void reset() {
        this.mActivePointerId = -1;
        if (this.mVelocityTracker != null) {
            this.mVelocityTracker.recycle();
            this.mVelocityTracker = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean shouldHide(View child, float yvel) {
        if (child.getTop() < this.mMaxOffset) {
            return false;
        }
        float newTop = child.getTop() + (yvel * HIDE_FRICTION);
        return Math.abs(newTop - ((float) this.mMaxOffset)) / ((float) this.mPeekHeight) > HIDE_THRESHOLD;
    }

    private View findScrollingChild(View view) {
        if (view instanceof NestedScrollingChild) {
            return view;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            int count = group.getChildCount();
            for (int i = 0; i < count; i++) {
                View scrollingChild = findScrollingChild(group.getChildAt(i));
                if (scrollingChild != null) {
                    return scrollingChild;
                }
            }
            return null;
        }
        return null;
    }

    private float getYVelocity() {
        this.mVelocityTracker.computeCurrentVelocity(1000, this.mMaximumVelocity);
        return VelocityTrackerCompat.getYVelocity(this.mVelocityTracker, this.mActivePointerId);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dispatchOnSlide(int top) {
        View bottomSheet = this.mViewRef.get();
        if (bottomSheet != null && this.mCallback != null) {
            if (top > this.mMaxOffset) {
                this.mCallback.onSlide(bottomSheet, (this.mMaxOffset - top) / this.mPeekHeight);
            } else {
                this.mCallback.onSlide(bottomSheet, (this.mMaxOffset - top) / (this.mMaxOffset - this.mMinOffset));
            }
        }
    }

    /* loaded from: com.android.support.design.23.2.1.jar:android/support/design/widget/BottomSheetBehavior$SettleRunnable.class */
    private class SettleRunnable implements Runnable {
        private final View mView;
        private final int mTargetState;

        SettleRunnable(View view, int targetState) {
            this.mView = view;
            this.mTargetState = targetState;
        }

        @Override // java.lang.Runnable
        public void run() {
            if (BottomSheetBehavior.this.mViewDragHelper == null || !BottomSheetBehavior.this.mViewDragHelper.continueSettling(true)) {
                BottomSheetBehavior.this.setStateInternal(this.mTargetState);
            } else {
                ViewCompat.postOnAnimation(this.mView, this);
            }
        }
    }

    /* loaded from: com.android.support.design.23.2.1.jar:android/support/design/widget/BottomSheetBehavior$SavedState.class */
    protected static class SavedState extends View.BaseSavedState {
        final int state;
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: android.support.design.widget.BottomSheetBehavior.SavedState.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public SavedState createFromParcel(Parcel source) {
                return new SavedState(source);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public SavedState[] newArray(int size) {
                return new SavedState[size];
            }
        };

        public SavedState(Parcel source) {
            super(source);
            this.state = source.readInt();
        }

        public SavedState(Parcelable superState, int state) {
            super(superState);
            this.state = state;
        }

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel out, int flags) {
            super.writeToParcel(out, flags);
            out.writeInt(this.state);
        }
    }

    public static <V extends View> BottomSheetBehavior<V> from(V view) {
        ViewGroup.LayoutParams params = view.getLayoutParams();
        if (!(params instanceof CoordinatorLayout.LayoutParams)) {
            throw new IllegalArgumentException("The view is not a child of CoordinatorLayout");
        }
        CoordinatorLayout.Behavior behavior = ((CoordinatorLayout.LayoutParams) params).getBehavior();
        if (!(behavior instanceof BottomSheetBehavior)) {
            throw new IllegalArgumentException("The view is not associated with BottomSheetBehavior");
        }
        return (BottomSheetBehavior) behavior;
    }
}
