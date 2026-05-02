package com.actionbarsherlock.internal.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.actionbarsherlock.R;
import com.actionbarsherlock.internal.nineoldandroids.widget.NineFrameLayout;
import com.actionbarsherlock.view.Menu;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/widget/ActionBarContainer.class */
public class ActionBarContainer extends NineFrameLayout {
    private boolean mIsTransitioning;
    private View mTabContainer;
    private ActionBarView mActionBarView;
    private Drawable mBackground;
    private Drawable mStackedBackground;
    private Drawable mSplitBackground;
    private boolean mIsSplit;
    private boolean mIsStacked;

    public ActionBarContainer(Context context) {
        this(context, null);
    }

    public ActionBarContainer(Context context, AttributeSet attrs) {
        super(context, attrs);
        setBackgroundDrawable(null);
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.SherlockActionBar);
        this.mBackground = a.getDrawable(0);
        this.mStackedBackground = a.getDrawable(12);
        if ((this.mStackedBackground instanceof ColorDrawable) && Build.VERSION.SDK_INT < 11) {
            this.mStackedBackground = new IcsColorDrawable((ColorDrawable) this.mStackedBackground);
        }
        if (getId() == R.id.abs__split_action_bar) {
            this.mIsSplit = true;
            this.mSplitBackground = a.getDrawable(1);
        }
        a.recycle();
        setWillNotDraw(this.mIsSplit ? this.mSplitBackground == null : this.mBackground == null && this.mStackedBackground == null);
    }

    @Override // android.view.View
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mActionBarView = (ActionBarView) findViewById(R.id.abs__action_bar);
    }

    public void setPrimaryBackground(Drawable bg) {
        this.mBackground = bg;
        invalidate();
    }

    public void setStackedBackground(Drawable bg) {
        this.mStackedBackground = bg;
        invalidate();
    }

    public void setSplitBackground(Drawable bg) {
        this.mSplitBackground = bg;
        invalidate();
    }

    public void setTransitioning(boolean isTransitioning) {
        this.mIsTransitioning = isTransitioning;
        setDescendantFocusability(isTransitioning ? 393216 : Menu.CATEGORY_ALTERNATIVE);
    }

    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent ev) {
        return this.mIsTransitioning || super.onInterceptTouchEvent(ev);
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent ev) {
        super.onTouchEvent(ev);
        return true;
    }

    @Override // android.view.View
    public boolean onHoverEvent(MotionEvent ev) {
        super.onHoverEvent(ev);
        return true;
    }

    public void setTabContainer(ScrollingTabContainerView tabView) {
        if (this.mTabContainer != null) {
            removeView(this.mTabContainer);
        }
        this.mTabContainer = tabView;
        if (tabView != null) {
            addView(tabView);
            ViewGroup.LayoutParams lp = tabView.getLayoutParams();
            lp.width = -1;
            lp.height = -2;
            tabView.setAllowCollapse(false);
        }
    }

    public View getTabContainer() {
        return this.mTabContainer;
    }

    @Override // android.view.View
    public void onDraw(Canvas canvas) {
        if (getWidth() == 0 || getHeight() == 0) {
            return;
        }
        if (this.mIsSplit) {
            if (this.mSplitBackground != null) {
                this.mSplitBackground.draw(canvas);
            }
        } else {
            if (this.mBackground != null) {
                this.mBackground.draw(canvas);
            }
            if (this.mStackedBackground != null && this.mIsStacked) {
                this.mStackedBackground.draw(canvas);
            }
        }
    }

    @Override // android.widget.FrameLayout, android.view.View
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
        if (this.mActionBarView == null) {
            return;
        }
        FrameLayout.LayoutParams lp = (FrameLayout.LayoutParams) this.mActionBarView.getLayoutParams();
        int actionBarViewHeight = this.mActionBarView.isCollapsed() ? 0 : this.mActionBarView.getMeasuredHeight() + lp.topMargin + lp.bottomMargin;
        if (this.mTabContainer != null && this.mTabContainer.getVisibility() != 8) {
            int mode = View.MeasureSpec.getMode(heightMeasureSpec);
            if (mode == Integer.MIN_VALUE) {
                int maxHeight = View.MeasureSpec.getSize(heightMeasureSpec);
                setMeasuredDimension(getMeasuredWidth(), Math.min(actionBarViewHeight + this.mTabContainer.getMeasuredHeight(), maxHeight));
            }
        }
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    public void onLayout(boolean changed, int l, int t, int r, int b) {
        super.onLayout(changed, l, t, r, b);
        boolean hasTabs = (this.mTabContainer == null || this.mTabContainer.getVisibility() == 8) ? false : true;
        if (this.mTabContainer != null && this.mTabContainer.getVisibility() != 8) {
            int containerHeight = getMeasuredHeight();
            int tabHeight = this.mTabContainer.getMeasuredHeight();
            if ((this.mActionBarView.getDisplayOptions() & 2) == 0) {
                int count = getChildCount();
                for (int i = 0; i < count; i++) {
                    View child = getChildAt(i);
                    if (child != this.mTabContainer && !this.mActionBarView.isCollapsed()) {
                        child.offsetTopAndBottom(tabHeight);
                    }
                }
                this.mTabContainer.layout(l, 0, r, tabHeight);
            } else {
                this.mTabContainer.layout(l, containerHeight - tabHeight, r, containerHeight);
            }
        }
        boolean needsInvalidate = false;
        if (this.mIsSplit) {
            if (this.mSplitBackground != null) {
                this.mSplitBackground.setBounds(0, 0, getMeasuredWidth(), getMeasuredHeight());
                needsInvalidate = true;
            }
        } else {
            if (this.mBackground != null) {
                this.mBackground.setBounds(this.mActionBarView.getLeft(), this.mActionBarView.getTop(), this.mActionBarView.getRight(), this.mActionBarView.getBottom());
                needsInvalidate = true;
            }
            boolean z = hasTabs && this.mStackedBackground != null;
            this.mIsStacked = z;
            if (z) {
                this.mStackedBackground.setBounds(this.mTabContainer.getLeft(), this.mTabContainer.getTop(), this.mTabContainer.getRight(), this.mTabContainer.getBottom());
                needsInvalidate = true;
            }
        }
        if (needsInvalidate) {
            invalidate();
        }
    }
}
