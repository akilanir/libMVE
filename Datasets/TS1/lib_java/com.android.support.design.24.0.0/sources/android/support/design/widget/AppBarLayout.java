package android.support.design.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.VisibleForTesting;
import android.support.design.R;
import android.support.design.widget.CoordinatorLayout;
import android.support.design.widget.ValueAnimatorCompat;
import android.support.v4.os.ParcelableCompat;
import android.support.v4.os.ParcelableCompatCreatorCallbacks;
import android.support.v4.view.AbsSavedState;
import android.support.v4.view.OnApplyWindowInsetsListener;
import android.support.v4.view.ViewCompat;
import android.support.v4.view.WindowInsetsCompat;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Interpolator;
import android.widget.LinearLayout;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;

@CoordinatorLayout.DefaultBehavior(Behavior.class)
/* loaded from: com.android.support.design.24.0.0.jar:android/support/design/widget/AppBarLayout.class */
public class AppBarLayout extends LinearLayout {
    private static final int PENDING_ACTION_NONE = 0;
    private static final int PENDING_ACTION_EXPANDED = 1;
    private static final int PENDING_ACTION_COLLAPSED = 2;
    private static final int PENDING_ACTION_ANIMATE_ENABLED = 4;
    private static final int INVALID_SCROLL_RANGE = -1;
    private int mTotalScrollRange;
    private int mDownPreScrollRange;
    private int mDownScrollRange;
    private boolean mHaveChildWithInterpolator;
    private int mPendingAction;
    private WindowInsetsCompat mLastInsets;
    private List<OnOffsetChangedListener> mListeners;
    private boolean mCollapsible;
    private boolean mCollapsed;
    private final int[] mTmpStatesArray;

    /* loaded from: com.android.support.design.24.0.0.jar:android/support/design/widget/AppBarLayout$OnOffsetChangedListener.class */
    public interface OnOffsetChangedListener {
        void onOffsetChanged(AppBarLayout appBarLayout, int i);
    }

    public AppBarLayout(Context context) {
        this(context, null);
    }

    public AppBarLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mTotalScrollRange = -1;
        this.mDownPreScrollRange = -1;
        this.mDownScrollRange = -1;
        this.mPendingAction = 0;
        this.mTmpStatesArray = new int[2];
        setOrientation(1);
        ThemeUtils.checkAppCompatTheme(context);
        if (Build.VERSION.SDK_INT >= 21) {
            ViewUtilsLollipop.setBoundsViewOutlineProvider(this);
            ViewUtilsLollipop.setStateListAnimatorFromAttrs(this, attrs, 0, R.style.Widget_Design_AppBarLayout);
        }
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.AppBarLayout, 0, R.style.Widget_Design_AppBarLayout);
        setBackgroundDrawable(a.getDrawable(R.styleable.AppBarLayout_android_background));
        if (a.hasValue(R.styleable.AppBarLayout_expanded)) {
            setExpanded(a.getBoolean(R.styleable.AppBarLayout_expanded, false));
        }
        if (Build.VERSION.SDK_INT >= 21 && a.hasValue(R.styleable.AppBarLayout_elevation)) {
            ViewUtilsLollipop.setDefaultAppBarLayoutStateListAnimator(this, a.getDimensionPixelSize(R.styleable.AppBarLayout_elevation, 0));
        }
        a.recycle();
        ViewCompat.setOnApplyWindowInsetsListener(this, new OnApplyWindowInsetsListener() { // from class: android.support.design.widget.AppBarLayout.1
            public WindowInsetsCompat onApplyWindowInsets(View v, WindowInsetsCompat insets) {
                return AppBarLayout.this.onWindowInsetChanged(insets);
            }
        });
    }

    public void addOnOffsetChangedListener(OnOffsetChangedListener listener) {
        if (this.mListeners == null) {
            this.mListeners = new ArrayList();
        }
        if (listener != null && !this.mListeners.contains(listener)) {
            this.mListeners.add(listener);
        }
    }

    public void removeOnOffsetChangedListener(OnOffsetChangedListener listener) {
        if (this.mListeners != null && listener != null) {
            this.mListeners.remove(listener);
        }
    }

    @Override // android.widget.LinearLayout, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        invalidateScrollRanges();
    }

    @Override // android.widget.LinearLayout, android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        super.onLayout(changed, l, t, r, b);
        invalidateScrollRanges();
        this.mHaveChildWithInterpolator = false;
        int i = 0;
        int z = getChildCount();
        while (true) {
            if (i >= z) {
                break;
            }
            View child = getChildAt(i);
            LayoutParams childLp = (LayoutParams) child.getLayoutParams();
            Interpolator interpolator = childLp.getScrollInterpolator();
            if (interpolator == null) {
                i++;
            } else {
                this.mHaveChildWithInterpolator = true;
                break;
            }
        }
        updateCollapsible();
    }

    private void updateCollapsible() {
        boolean haveCollapsibleChild = false;
        int i = 0;
        int z = getChildCount();
        while (true) {
            if (i >= z) {
                break;
            }
            if (!((LayoutParams) getChildAt(i).getLayoutParams()).isCollapsible()) {
                i++;
            } else {
                haveCollapsibleChild = true;
                break;
            }
        }
        setCollapsibleState(haveCollapsibleChild);
    }

    private void invalidateScrollRanges() {
        this.mTotalScrollRange = -1;
        this.mDownPreScrollRange = -1;
        this.mDownScrollRange = -1;
    }

    @Override // android.widget.LinearLayout
    public void setOrientation(int orientation) {
        if (orientation != 1) {
            throw new IllegalArgumentException("AppBarLayout is always vertical and does not support horizontal orientation");
        }
        super.setOrientation(orientation);
    }

    public void setExpanded(boolean expanded) {
        setExpanded(expanded, ViewCompat.isLaidOut(this));
    }

    public void setExpanded(boolean expanded, boolean animate) {
        this.mPendingAction = (expanded ? 1 : 2) | (animate ? 4 : 0);
        requestLayout();
    }

    @Override // android.widget.LinearLayout, android.view.ViewGroup
    protected boolean checkLayoutParams(ViewGroup.LayoutParams p) {
        return p instanceof LayoutParams;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.widget.LinearLayout, android.view.ViewGroup
    public LayoutParams generateDefaultLayoutParams() {
        return new LayoutParams(-1, -2);
    }

    @Override // android.widget.LinearLayout, android.view.ViewGroup
    public LayoutParams generateLayoutParams(AttributeSet attrs) {
        return new LayoutParams(getContext(), attrs);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.widget.LinearLayout, android.view.ViewGroup
    public LayoutParams generateLayoutParams(ViewGroup.LayoutParams p) {
        if (p instanceof LinearLayout.LayoutParams) {
            return new LayoutParams((LinearLayout.LayoutParams) p);
        }
        if (p instanceof ViewGroup.MarginLayoutParams) {
            return new LayoutParams((ViewGroup.MarginLayoutParams) p);
        }
        return new LayoutParams(p);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean hasChildWithInterpolator() {
        return this.mHaveChildWithInterpolator;
    }

    public final int getTotalScrollRange() {
        if (this.mTotalScrollRange != -1) {
            return this.mTotalScrollRange;
        }
        int range = 0;
        int i = 0;
        int z = getChildCount();
        while (true) {
            if (i >= z) {
                break;
            }
            View child = getChildAt(i);
            LayoutParams lp = (LayoutParams) child.getLayoutParams();
            int childHeight = child.getMeasuredHeight();
            int flags = lp.mScrollFlags;
            if ((flags & 1) == 0) {
                break;
            }
            range += childHeight + lp.topMargin + lp.bottomMargin;
            if ((flags & 2) == 0) {
                i++;
            } else {
                range -= ViewCompat.getMinimumHeight(child);
                break;
            }
        }
        int max = Math.max(0, range - getTopInset());
        this.mTotalScrollRange = max;
        return max;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean hasScrollableChildren() {
        return getTotalScrollRange() != 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int getUpNestedPreScrollRange() {
        return getTotalScrollRange();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int getDownNestedPreScrollRange() {
        if (this.mDownPreScrollRange != -1) {
            return this.mDownPreScrollRange;
        }
        int range = 0;
        for (int i = getChildCount() - 1; i >= 0; i--) {
            View child = getChildAt(i);
            LayoutParams lp = (LayoutParams) child.getLayoutParams();
            int childHeight = child.getMeasuredHeight();
            int flags = lp.mScrollFlags;
            if ((flags & 5) == 5) {
                int range2 = range + lp.topMargin + lp.bottomMargin;
                if ((flags & 8) != 0) {
                    range = range2 + ViewCompat.getMinimumHeight(child);
                } else if ((flags & 2) != 0) {
                    range = range2 + (childHeight - ViewCompat.getMinimumHeight(child));
                } else {
                    range = range2 + childHeight;
                }
            } else if (range > 0) {
                break;
            }
        }
        int max = Math.max(0, range);
        this.mDownPreScrollRange = max;
        return max;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int getDownNestedScrollRange() {
        if (this.mDownScrollRange != -1) {
            return this.mDownScrollRange;
        }
        int range = 0;
        int i = 0;
        int z = getChildCount();
        while (true) {
            if (i >= z) {
                break;
            }
            View child = getChildAt(i);
            LayoutParams lp = (LayoutParams) child.getLayoutParams();
            int childHeight = child.getMeasuredHeight();
            int childHeight2 = childHeight + lp.topMargin + lp.bottomMargin;
            int flags = lp.mScrollFlags;
            if ((flags & 1) == 0) {
                break;
            }
            range += childHeight2;
            if ((flags & 2) == 0) {
                i++;
            } else {
                range -= ViewCompat.getMinimumHeight(child) + getTopInset();
                break;
            }
        }
        int max = Math.max(0, range);
        this.mDownScrollRange = max;
        return max;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dispatchOffsetUpdates(int offset) {
        if (this.mListeners != null) {
            int z = this.mListeners.size();
            for (int i = 0; i < z; i++) {
                OnOffsetChangedListener listener = this.mListeners.get(i);
                if (listener != null) {
                    listener.onOffsetChanged(this, offset);
                }
            }
        }
    }

    final int getMinimumHeightForVisibleOverlappingContent() {
        int topInset = getTopInset();
        int minHeight = ViewCompat.getMinimumHeight(this);
        if (minHeight != 0) {
            return (minHeight * 2) + topInset;
        }
        int childCount = getChildCount();
        int lastChildMinHeight = childCount >= 1 ? ViewCompat.getMinimumHeight(getChildAt(childCount - 1)) : 0;
        if (lastChildMinHeight != 0) {
            return (lastChildMinHeight * 2) + topInset;
        }
        return getHeight() / 3;
    }

    @Override // android.view.ViewGroup, android.view.View
    protected int[] onCreateDrawableState(int extraSpace) {
        int[] extraStates = this.mTmpStatesArray;
        int[] states = super.onCreateDrawableState(extraSpace + extraStates.length);
        extraStates[0] = this.mCollapsible ? R.attr.state_collapsible : -R.attr.state_collapsible;
        extraStates[1] = (this.mCollapsible && this.mCollapsed) ? R.attr.state_collapsed : -R.attr.state_collapsed;
        return mergeDrawableStates(states, extraStates);
    }

    private void setCollapsibleState(boolean collapsible) {
        if (this.mCollapsible != collapsible) {
            this.mCollapsible = collapsible;
            refreshDrawableState();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setCollapsedState(boolean collapsed) {
        if (this.mCollapsed != collapsed) {
            this.mCollapsed = collapsed;
            refreshDrawableState();
        }
    }

    @Deprecated
    public void setTargetElevation(float elevation) {
        if (Build.VERSION.SDK_INT >= 21) {
            ViewUtilsLollipop.setDefaultAppBarLayoutStateListAnimator(this, elevation);
        }
    }

    @Deprecated
    public float getTargetElevation() {
        return 0.0f;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int getPendingAction() {
        return this.mPendingAction;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void resetPendingAction() {
        this.mPendingAction = 0;
    }

    @VisibleForTesting
    final int getTopInset() {
        if (this.mLastInsets != null) {
            return this.mLastInsets.getSystemWindowInsetTop();
        }
        return 0;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public WindowInsetsCompat onWindowInsetChanged(WindowInsetsCompat insets) {
        WindowInsetsCompat newInsets = null;
        if (ViewCompat.getFitsSystemWindows(this)) {
            newInsets = insets;
        }
        if (newInsets != this.mLastInsets) {
            this.mLastInsets = newInsets;
            invalidateScrollRanges();
        }
        return insets;
    }

    /* loaded from: com.android.support.design.24.0.0.jar:android/support/design/widget/AppBarLayout$LayoutParams.class */
    public static class LayoutParams extends LinearLayout.LayoutParams {
        public static final int SCROLL_FLAG_SCROLL = 1;
        public static final int SCROLL_FLAG_EXIT_UNTIL_COLLAPSED = 2;
        public static final int SCROLL_FLAG_ENTER_ALWAYS = 4;
        public static final int SCROLL_FLAG_ENTER_ALWAYS_COLLAPSED = 8;
        public static final int SCROLL_FLAG_SNAP = 16;
        static final int FLAG_QUICK_RETURN = 5;
        static final int FLAG_SNAP = 17;
        static final int COLLAPSIBLE_FLAGS = 10;
        int mScrollFlags;
        Interpolator mScrollInterpolator;

        @Retention(RetentionPolicy.SOURCE)
        /* loaded from: com.android.support.design.24.0.0.jar:android/support/design/widget/AppBarLayout$LayoutParams$ScrollFlags.class */
        public @interface ScrollFlags {
        }

        public LayoutParams(Context c, AttributeSet attrs) {
            super(c, attrs);
            this.mScrollFlags = 1;
            TypedArray a = c.obtainStyledAttributes(attrs, R.styleable.AppBarLayout_Layout);
            this.mScrollFlags = a.getInt(R.styleable.AppBarLayout_Layout_layout_scrollFlags, 0);
            if (a.hasValue(R.styleable.AppBarLayout_Layout_layout_scrollInterpolator)) {
                int resId = a.getResourceId(R.styleable.AppBarLayout_Layout_layout_scrollInterpolator, 0);
                this.mScrollInterpolator = android.view.animation.AnimationUtils.loadInterpolator(c, resId);
            }
            a.recycle();
        }

        public LayoutParams(int width, int height) {
            super(width, height);
            this.mScrollFlags = 1;
        }

        public LayoutParams(int width, int height, float weight) {
            super(width, height, weight);
            this.mScrollFlags = 1;
        }

        public LayoutParams(ViewGroup.LayoutParams p) {
            super(p);
            this.mScrollFlags = 1;
        }

        public LayoutParams(ViewGroup.MarginLayoutParams source) {
            super(source);
            this.mScrollFlags = 1;
        }

        public LayoutParams(LinearLayout.LayoutParams source) {
            super(source);
            this.mScrollFlags = 1;
        }

        public LayoutParams(LayoutParams source) {
            super((LinearLayout.LayoutParams) source);
            this.mScrollFlags = 1;
            this.mScrollFlags = source.mScrollFlags;
            this.mScrollInterpolator = source.mScrollInterpolator;
        }

        public void setScrollFlags(int flags) {
            this.mScrollFlags = flags;
        }

        public int getScrollFlags() {
            return this.mScrollFlags;
        }

        public void setScrollInterpolator(Interpolator interpolator) {
            this.mScrollInterpolator = interpolator;
        }

        public Interpolator getScrollInterpolator() {
            return this.mScrollInterpolator;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public boolean isCollapsible() {
            return (this.mScrollFlags & 1) == 1 && (this.mScrollFlags & COLLAPSIBLE_FLAGS) != 0;
        }
    }

    /* loaded from: com.android.support.design.24.0.0.jar:android/support/design/widget/AppBarLayout$Behavior.class */
    public static class Behavior extends HeaderBehavior<AppBarLayout> {
        private static final int MAX_OFFSET_ANIMATION_DURATION = 600;
        private static final int INVALID_POSITION = -1;
        private int mOffsetDelta;
        private boolean mSkipNestedPreScroll;
        private boolean mWasNestedFlung;
        private ValueAnimatorCompat mOffsetAnimator;
        private int mOffsetToChildIndexOnLayout;
        private boolean mOffsetToChildIndexOnLayoutIsMinHeight;
        private float mOffsetToChildIndexOnLayoutPerc;
        private WeakReference<View> mLastNestedScrollingChildRef;
        private DragCallback mOnDragCallback;

        /* loaded from: com.android.support.design.24.0.0.jar:android/support/design/widget/AppBarLayout$Behavior$DragCallback.class */
        public static abstract class DragCallback {
            public abstract boolean canDrag(@NonNull AppBarLayout appBarLayout);
        }

        @Override // android.support.design.widget.ViewOffsetBehavior
        public /* bridge */ /* synthetic */ int getLeftAndRightOffset() {
            return super.getLeftAndRightOffset();
        }

        @Override // android.support.design.widget.ViewOffsetBehavior
        public /* bridge */ /* synthetic */ int getTopAndBottomOffset() {
            return super.getTopAndBottomOffset();
        }

        @Override // android.support.design.widget.ViewOffsetBehavior
        public /* bridge */ /* synthetic */ boolean setLeftAndRightOffset(int i) {
            return super.setLeftAndRightOffset(i);
        }

        @Override // android.support.design.widget.ViewOffsetBehavior
        public /* bridge */ /* synthetic */ boolean setTopAndBottomOffset(int i) {
            return super.setTopAndBottomOffset(i);
        }

        public Behavior() {
            this.mOffsetToChildIndexOnLayout = -1;
        }

        public Behavior(Context context, AttributeSet attrs) {
            super(context, attrs);
            this.mOffsetToChildIndexOnLayout = -1;
        }

        @Override // android.support.design.widget.CoordinatorLayout.Behavior
        public boolean onStartNestedScroll(CoordinatorLayout parent, AppBarLayout child, View directTargetChild, View target, int nestedScrollAxes) {
            boolean started = (nestedScrollAxes & 2) != 0 && child.hasScrollableChildren() && parent.getHeight() - directTargetChild.getHeight() <= child.getHeight();
            if (started && this.mOffsetAnimator != null) {
                this.mOffsetAnimator.cancel();
            }
            this.mLastNestedScrollingChildRef = null;
            return started;
        }

        @Override // android.support.design.widget.CoordinatorLayout.Behavior
        public void onNestedPreScroll(CoordinatorLayout coordinatorLayout, AppBarLayout child, View target, int dx, int dy, int[] consumed) {
            int min;
            int max;
            if (dy != 0 && !this.mSkipNestedPreScroll) {
                if (dy >= 0) {
                    min = -child.getUpNestedPreScrollRange();
                    max = 0;
                } else {
                    min = -child.getTotalScrollRange();
                    max = min + child.getDownNestedPreScrollRange();
                }
                consumed[1] = scroll(coordinatorLayout, child, dy, min, max);
            }
        }

        @Override // android.support.design.widget.CoordinatorLayout.Behavior
        public void onNestedScroll(CoordinatorLayout coordinatorLayout, AppBarLayout child, View target, int dxConsumed, int dyConsumed, int dxUnconsumed, int dyUnconsumed) {
            if (dyUnconsumed < 0) {
                scroll(coordinatorLayout, child, dyUnconsumed, -child.getDownNestedScrollRange(), 0);
                this.mSkipNestedPreScroll = true;
            } else {
                this.mSkipNestedPreScroll = false;
            }
        }

        @Override // android.support.design.widget.CoordinatorLayout.Behavior
        public void onStopNestedScroll(CoordinatorLayout coordinatorLayout, AppBarLayout abl, View target) {
            if (!this.mWasNestedFlung) {
                snapToChildIfNeeded(coordinatorLayout, abl);
            }
            this.mSkipNestedPreScroll = false;
            this.mWasNestedFlung = false;
            this.mLastNestedScrollingChildRef = new WeakReference<>(target);
        }

        @Override // android.support.design.widget.CoordinatorLayout.Behavior
        public boolean onNestedFling(CoordinatorLayout coordinatorLayout, AppBarLayout child, View target, float velocityX, float velocityY, boolean consumed) {
            boolean flung = false;
            if (!consumed) {
                flung = fling(coordinatorLayout, child, -child.getTotalScrollRange(), 0, -velocityY);
            } else if (velocityY < 0.0f) {
                int targetScroll = (-child.getTotalScrollRange()) + child.getDownNestedPreScrollRange();
                if (getTopBottomOffsetForScrollingSibling() < targetScroll) {
                    animateOffsetTo(coordinatorLayout, child, targetScroll, velocityY);
                    flung = true;
                }
            } else {
                int targetScroll2 = -child.getUpNestedPreScrollRange();
                if (getTopBottomOffsetForScrollingSibling() > targetScroll2) {
                    animateOffsetTo(coordinatorLayout, child, targetScroll2, velocityY);
                    flung = true;
                }
            }
            this.mWasNestedFlung = flung;
            return flung;
        }

        public void setDragCallback(@Nullable DragCallback callback) {
            this.mOnDragCallback = callback;
        }

        private void animateOffsetTo(CoordinatorLayout coordinatorLayout, AppBarLayout child, int offset, float velocity) {
            int duration;
            int distance = Math.abs(getTopBottomOffsetForScrollingSibling() - offset);
            float velocity2 = Math.abs(velocity);
            if (velocity2 > 0.0f) {
                duration = 3 * Math.round(1000.0f * (distance / velocity2));
            } else {
                float distanceRatio = distance / child.getHeight();
                duration = (int) ((distanceRatio + 1.0f) * 150.0f);
            }
            animateOffsetWithDuration(coordinatorLayout, child, offset, duration);
        }

        private void animateOffsetWithDuration(final CoordinatorLayout coordinatorLayout, final AppBarLayout child, int offset, int duration) {
            int currentOffset = getTopBottomOffsetForScrollingSibling();
            if (currentOffset == offset) {
                if (this.mOffsetAnimator != null && this.mOffsetAnimator.isRunning()) {
                    this.mOffsetAnimator.cancel();
                    return;
                }
                return;
            }
            if (this.mOffsetAnimator == null) {
                this.mOffsetAnimator = ViewUtils.createAnimator();
                this.mOffsetAnimator.setInterpolator(AnimationUtils.DECELERATE_INTERPOLATOR);
                this.mOffsetAnimator.setUpdateListener(new ValueAnimatorCompat.AnimatorUpdateListener() { // from class: android.support.design.widget.AppBarLayout.Behavior.1
                    @Override // android.support.design.widget.ValueAnimatorCompat.AnimatorUpdateListener
                    public void onAnimationUpdate(ValueAnimatorCompat animator) {
                        Behavior.this.setHeaderTopBottomOffset(coordinatorLayout, child, animator.getAnimatedIntValue());
                    }
                });
            } else {
                this.mOffsetAnimator.cancel();
            }
            this.mOffsetAnimator.setDuration(Math.min(duration, MAX_OFFSET_ANIMATION_DURATION));
            this.mOffsetAnimator.setIntValues(currentOffset, offset);
            this.mOffsetAnimator.start();
        }

        private int getChildIndexOnOffset(AppBarLayout abl, int offset) {
            int count = abl.getChildCount();
            for (int i = 0; i < count; i++) {
                View child = abl.getChildAt(i);
                if (child.getTop() <= (-offset) && child.getBottom() >= (-offset)) {
                    return i;
                }
            }
            return -1;
        }

        private void snapToChildIfNeeded(CoordinatorLayout coordinatorLayout, AppBarLayout abl) {
            int offset = getTopBottomOffsetForScrollingSibling();
            int offsetChildIndex = getChildIndexOnOffset(abl, offset);
            if (offsetChildIndex >= 0) {
                View offsetChild = abl.getChildAt(offsetChildIndex);
                LayoutParams lp = (LayoutParams) offsetChild.getLayoutParams();
                int flags = lp.getScrollFlags();
                if ((flags & 17) == 17) {
                    int snapTop = -offsetChild.getTop();
                    int snapBottom = -offsetChild.getBottom();
                    if (offsetChildIndex == abl.getChildCount() - 1) {
                        snapBottom += abl.getTopInset();
                    }
                    if (checkFlag(flags, 2)) {
                        snapBottom += ViewCompat.getMinimumHeight(offsetChild);
                    } else if (checkFlag(flags, 5)) {
                        int seam = snapBottom + ViewCompat.getMinimumHeight(offsetChild);
                        if (offset < seam) {
                            snapTop = seam;
                        } else {
                            snapBottom = seam;
                        }
                    }
                    int newOffset = offset < (snapBottom + snapTop) / 2 ? snapBottom : snapTop;
                    animateOffsetTo(coordinatorLayout, abl, MathUtils.constrain(newOffset, -abl.getTotalScrollRange(), 0), 0.0f);
                }
            }
        }

        private static boolean checkFlag(int flags, int check) {
            return (flags & check) == check;
        }

        @Override // android.support.design.widget.CoordinatorLayout.Behavior
        public boolean onMeasureChild(CoordinatorLayout parent, AppBarLayout child, int parentWidthMeasureSpec, int widthUsed, int parentHeightMeasureSpec, int heightUsed) {
            CoordinatorLayout.LayoutParams lp = (CoordinatorLayout.LayoutParams) child.getLayoutParams();
            if (lp.height == -2) {
                parent.onMeasureChild(child, parentWidthMeasureSpec, widthUsed, View.MeasureSpec.makeMeasureSpec(0, 0), heightUsed);
                return true;
            }
            return super.onMeasureChild(parent, (CoordinatorLayout) child, parentWidthMeasureSpec, widthUsed, parentHeightMeasureSpec, heightUsed);
        }

        @Override // android.support.design.widget.ViewOffsetBehavior, android.support.design.widget.CoordinatorLayout.Behavior
        public boolean onLayoutChild(CoordinatorLayout parent, AppBarLayout abl, int layoutDirection) {
            int offset;
            boolean handled = super.onLayoutChild(parent, (CoordinatorLayout) abl, layoutDirection);
            int pendingAction = abl.getPendingAction();
            if (pendingAction != 0) {
                boolean animate = (pendingAction & 4) != 0;
                if ((pendingAction & 2) != 0) {
                    int offset2 = -abl.getUpNestedPreScrollRange();
                    if (animate) {
                        animateOffsetTo(parent, abl, offset2, 0.0f);
                    } else {
                        setHeaderTopBottomOffset(parent, abl, offset2);
                    }
                } else if ((pendingAction & 1) != 0) {
                    if (animate) {
                        animateOffsetTo(parent, abl, 0, 0.0f);
                    } else {
                        setHeaderTopBottomOffset(parent, abl, 0);
                    }
                }
            } else if (this.mOffsetToChildIndexOnLayout >= 0) {
                View child = abl.getChildAt(this.mOffsetToChildIndexOnLayout);
                int offset3 = -child.getBottom();
                if (this.mOffsetToChildIndexOnLayoutIsMinHeight) {
                    offset = offset3 + ViewCompat.getMinimumHeight(child);
                } else {
                    offset = offset3 + Math.round(child.getHeight() * this.mOffsetToChildIndexOnLayoutPerc);
                }
                setTopAndBottomOffset(offset);
            }
            abl.resetPendingAction();
            this.mOffsetToChildIndexOnLayout = -1;
            setTopAndBottomOffset(MathUtils.constrain(getTopAndBottomOffset(), -abl.getTotalScrollRange(), 0));
            abl.dispatchOffsetUpdates(getTopAndBottomOffset());
            return handled;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        @Override // android.support.design.widget.HeaderBehavior
        public boolean canDragView(AppBarLayout view) {
            if (this.mOnDragCallback != null) {
                return this.mOnDragCallback.canDrag(view);
            }
            if (this.mLastNestedScrollingChildRef != null) {
                View scrollingView = this.mLastNestedScrollingChildRef.get();
                return (scrollingView == null || !scrollingView.isShown() || ViewCompat.canScrollVertically(scrollingView, -1)) ? false : true;
            }
            return true;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        @Override // android.support.design.widget.HeaderBehavior
        public void onFlingFinished(CoordinatorLayout parent, AppBarLayout layout) {
            snapToChildIfNeeded(parent, layout);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        @Override // android.support.design.widget.HeaderBehavior
        public int getMaxDragOffset(AppBarLayout view) {
            return -view.getDownNestedScrollRange();
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        @Override // android.support.design.widget.HeaderBehavior
        public int getScrollRangeForDragFling(AppBarLayout view) {
            return view.getTotalScrollRange();
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        @Override // android.support.design.widget.HeaderBehavior
        public int setHeaderTopBottomOffset(CoordinatorLayout coordinatorLayout, AppBarLayout header, int newOffset, int minOffset, int maxOffset) {
            int curOffset = getTopBottomOffsetForScrollingSibling();
            int consumed = 0;
            if (minOffset != 0 && curOffset >= minOffset && curOffset <= maxOffset) {
                int newOffset2 = MathUtils.constrain(newOffset, minOffset, maxOffset);
                if (curOffset != newOffset2) {
                    int interpolatedOffset = header.hasChildWithInterpolator() ? interpolateOffset(header, newOffset2) : newOffset2;
                    boolean offsetChanged = setTopAndBottomOffset(interpolatedOffset);
                    consumed = curOffset - newOffset2;
                    this.mOffsetDelta = newOffset2 - interpolatedOffset;
                    if (!offsetChanged && header.hasChildWithInterpolator()) {
                        coordinatorLayout.dispatchDependentViewsChanged(header);
                    }
                    header.dispatchOffsetUpdates(getTopAndBottomOffset());
                    updateAppBarLayoutDrawableState(header, newOffset2, newOffset2 < curOffset ? -1 : 1);
                }
            } else {
                this.mOffsetDelta = 0;
            }
            return consumed;
        }

        private int interpolateOffset(AppBarLayout layout, int offset) {
            int absOffset = Math.abs(offset);
            int i = 0;
            int z = layout.getChildCount();
            while (true) {
                if (i >= z) {
                    break;
                }
                View child = layout.getChildAt(i);
                LayoutParams childLp = (LayoutParams) child.getLayoutParams();
                Interpolator interpolator = childLp.getScrollInterpolator();
                if (absOffset < child.getTop() || absOffset > child.getBottom()) {
                    i++;
                } else if (interpolator != null) {
                    int childScrollableHeight = 0;
                    int flags = childLp.getScrollFlags();
                    if ((flags & 1) != 0) {
                        childScrollableHeight = 0 + child.getHeight() + childLp.topMargin + childLp.bottomMargin;
                        if ((flags & 2) != 0) {
                            childScrollableHeight -= ViewCompat.getMinimumHeight(child);
                        }
                    }
                    if (ViewCompat.getFitsSystemWindows(child)) {
                        childScrollableHeight -= layout.getTopInset();
                    }
                    if (childScrollableHeight > 0) {
                        int offsetForView = absOffset - child.getTop();
                        int interpolatedDiff = Math.round(childScrollableHeight * interpolator.getInterpolation(offsetForView / childScrollableHeight));
                        return Integer.signum(offset) * (child.getTop() + interpolatedDiff);
                    }
                }
            }
            return offset;
        }

        private void updateAppBarLayoutDrawableState(AppBarLayout layout, int offset, int direction) {
            View child = getAppBarChildOnOffset(layout, offset);
            if (child != null) {
                LayoutParams childLp = (LayoutParams) child.getLayoutParams();
                int flags = childLp.getScrollFlags();
                boolean collapsed = false;
                if ((flags & 1) != 0) {
                    int minHeight = ViewCompat.getMinimumHeight(child);
                    if (direction > 0 && (flags & 12) != 0) {
                        collapsed = (-offset) >= (child.getBottom() - minHeight) - layout.getTopInset();
                    } else if ((flags & 2) != 0) {
                        collapsed = (-offset) >= (child.getBottom() - minHeight) - layout.getTopInset();
                    }
                }
                layout.setCollapsedState(collapsed);
            }
        }

        private static View getAppBarChildOnOffset(AppBarLayout layout, int offset) {
            int absOffset = Math.abs(offset);
            int z = layout.getChildCount();
            for (int i = 0; i < z; i++) {
                View child = layout.getChildAt(i);
                if (absOffset >= child.getTop() && absOffset <= child.getBottom()) {
                    return child;
                }
            }
            return null;
        }

        @Override // android.support.design.widget.HeaderBehavior
        int getTopBottomOffsetForScrollingSibling() {
            return getTopAndBottomOffset() + this.mOffsetDelta;
        }

        /* JADX WARN: Type inference failed for: r0v18, types: [android.os.Parcelable, android.support.design.widget.AppBarLayout$Behavior$SavedState] */
        @Override // android.support.design.widget.CoordinatorLayout.Behavior
        public Parcelable onSaveInstanceState(CoordinatorLayout parent, AppBarLayout appBarLayout) {
            Parcelable superState = super.onSaveInstanceState(parent, (CoordinatorLayout) appBarLayout);
            int offset = getTopAndBottomOffset();
            int count = appBarLayout.getChildCount();
            for (int i = 0; i < count; i++) {
                View child = appBarLayout.getChildAt(i);
                int visBottom = child.getBottom() + offset;
                if (child.getTop() + offset <= 0 && visBottom >= 0) {
                    ?? savedState = new SavedState(superState);
                    savedState.firstVisibleChildIndex = i;
                    savedState.firstVisibileChildAtMinimumHeight = visBottom == ViewCompat.getMinimumHeight(child);
                    savedState.firstVisibileChildPercentageShown = visBottom / child.getHeight();
                    return savedState;
                }
            }
            return superState;
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // android.support.design.widget.CoordinatorLayout.Behavior
        public void onRestoreInstanceState(CoordinatorLayout parent, AppBarLayout appBarLayout, Parcelable parcelable) {
            if (parcelable instanceof SavedState) {
                SavedState ss = (SavedState) parcelable;
                super.onRestoreInstanceState(parent, (CoordinatorLayout) appBarLayout, ss.getSuperState());
                this.mOffsetToChildIndexOnLayout = ss.firstVisibleChildIndex;
                this.mOffsetToChildIndexOnLayoutPerc = ss.firstVisibileChildPercentageShown;
                this.mOffsetToChildIndexOnLayoutIsMinHeight = ss.firstVisibileChildAtMinimumHeight;
                return;
            }
            super.onRestoreInstanceState(parent, (CoordinatorLayout) appBarLayout, parcelable);
            this.mOffsetToChildIndexOnLayout = -1;
        }

        /* loaded from: com.android.support.design.24.0.0.jar:android/support/design/widget/AppBarLayout$Behavior$SavedState.class */
        protected static class SavedState extends AbsSavedState {
            int firstVisibleChildIndex;
            float firstVisibileChildPercentageShown;
            boolean firstVisibileChildAtMinimumHeight;
            public static final Parcelable.Creator<SavedState> CREATOR = ParcelableCompat.newCreator(new ParcelableCompatCreatorCallbacks<SavedState>() { // from class: android.support.design.widget.AppBarLayout.Behavior.SavedState.1
                /* renamed from: createFromParcel, reason: merged with bridge method [inline-methods] */
                public SavedState m8createFromParcel(Parcel source, ClassLoader loader) {
                    return new SavedState(source, loader);
                }

                /* renamed from: newArray, reason: merged with bridge method [inline-methods] */
                public SavedState[] m7newArray(int size) {
                    return new SavedState[size];
                }
            });

            public SavedState(Parcel source, ClassLoader loader) {
                super(source, loader);
                this.firstVisibleChildIndex = source.readInt();
                this.firstVisibileChildPercentageShown = source.readFloat();
                this.firstVisibileChildAtMinimumHeight = source.readByte() != 0;
            }

            public SavedState(Parcelable superState) {
                super(superState);
            }

            public void writeToParcel(Parcel dest, int flags) {
                super.writeToParcel(dest, flags);
                dest.writeInt(this.firstVisibleChildIndex);
                dest.writeFloat(this.firstVisibileChildPercentageShown);
                dest.writeByte((byte) (this.firstVisibileChildAtMinimumHeight ? 1 : 0));
            }
        }
    }

    /* loaded from: com.android.support.design.24.0.0.jar:android/support/design/widget/AppBarLayout$ScrollingViewBehavior.class */
    public static class ScrollingViewBehavior extends HeaderScrollingViewBehavior {
        @Override // android.support.design.widget.HeaderScrollingViewBehavior, android.support.design.widget.CoordinatorLayout.Behavior
        public /* bridge */ /* synthetic */ boolean onMeasureChild(CoordinatorLayout coordinatorLayout, View view, int i, int i2, int i3, int i4) {
            return super.onMeasureChild(coordinatorLayout, view, i, i2, i3, i4);
        }

        @Override // android.support.design.widget.ViewOffsetBehavior
        public /* bridge */ /* synthetic */ int getLeftAndRightOffset() {
            return super.getLeftAndRightOffset();
        }

        @Override // android.support.design.widget.ViewOffsetBehavior
        public /* bridge */ /* synthetic */ int getTopAndBottomOffset() {
            return super.getTopAndBottomOffset();
        }

        @Override // android.support.design.widget.ViewOffsetBehavior
        public /* bridge */ /* synthetic */ boolean setLeftAndRightOffset(int i) {
            return super.setLeftAndRightOffset(i);
        }

        @Override // android.support.design.widget.ViewOffsetBehavior
        public /* bridge */ /* synthetic */ boolean setTopAndBottomOffset(int i) {
            return super.setTopAndBottomOffset(i);
        }

        @Override // android.support.design.widget.ViewOffsetBehavior, android.support.design.widget.CoordinatorLayout.Behavior
        public /* bridge */ /* synthetic */ boolean onLayoutChild(CoordinatorLayout coordinatorLayout, View view, int i) {
            return super.onLayoutChild(coordinatorLayout, view, i);
        }

        public ScrollingViewBehavior() {
        }

        public ScrollingViewBehavior(Context context, AttributeSet attrs) {
            super(context, attrs);
            TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.ScrollingViewBehavior_Layout);
            setOverlayTop(a.getDimensionPixelSize(R.styleable.ScrollingViewBehavior_Layout_behavior_overlapTop, 0));
            a.recycle();
        }

        @Override // android.support.design.widget.CoordinatorLayout.Behavior
        public boolean layoutDependsOn(CoordinatorLayout parent, View child, View dependency) {
            return dependency instanceof AppBarLayout;
        }

        @Override // android.support.design.widget.CoordinatorLayout.Behavior
        public boolean onDependentViewChanged(CoordinatorLayout parent, View child, View dependency) {
            offsetChildAsNeeded(parent, child, dependency);
            return false;
        }

        private void offsetChildAsNeeded(CoordinatorLayout parent, View child, View dependency) {
            CoordinatorLayout.Behavior behavior = ((CoordinatorLayout.LayoutParams) dependency.getLayoutParams()).getBehavior();
            if (behavior instanceof Behavior) {
                Behavior ablBehavior = (Behavior) behavior;
                ablBehavior.getTopBottomOffsetForScrollingSibling();
                ViewCompat.offsetTopAndBottom(child, (((dependency.getBottom() - child.getTop()) + ablBehavior.mOffsetDelta) + getVerticalLayoutGap()) - getOverlapPixelsForOffset(dependency));
            }
        }

        @Override // android.support.design.widget.HeaderScrollingViewBehavior
        float getOverlapRatioForOffset(View header) {
            int availScrollRange;
            if (header instanceof AppBarLayout) {
                AppBarLayout abl = (AppBarLayout) header;
                int totalScrollRange = abl.getTotalScrollRange();
                int preScrollDown = abl.getDownNestedPreScrollRange();
                int offset = getAppBarLayoutOffset(abl);
                if ((preScrollDown == 0 || totalScrollRange + offset > preScrollDown) && (availScrollRange = totalScrollRange - preScrollDown) != 0) {
                    return 1.0f + (offset / availScrollRange);
                }
                return 0.0f;
            }
            return 0.0f;
        }

        private static int getAppBarLayoutOffset(AppBarLayout abl) {
            CoordinatorLayout.Behavior behavior = ((CoordinatorLayout.LayoutParams) abl.getLayoutParams()).getBehavior();
            if (behavior instanceof Behavior) {
                return ((Behavior) behavior).getTopBottomOffsetForScrollingSibling();
            }
            return 0;
        }

        @Override // android.support.design.widget.HeaderScrollingViewBehavior
        View findFirstDependency(List<View> views) {
            int z = views.size();
            for (int i = 0; i < z; i++) {
                View view = views.get(i);
                if (view instanceof AppBarLayout) {
                    return view;
                }
            }
            return null;
        }

        @Override // android.support.design.widget.HeaderScrollingViewBehavior
        int getScrollRange(View v) {
            if (v instanceof AppBarLayout) {
                return ((AppBarLayout) v).getTotalScrollRange();
            }
            return super.getScrollRange(v);
        }
    }
}
