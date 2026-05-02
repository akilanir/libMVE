package android.support.v7.internal.widget;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.support.v7.appcompat.R;
import android.support.v7.view.ActionMode;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;

/* loaded from: com.android.support.appcompat-v7.20.0.0.jar:android/support/v7/internal/widget/ActionBarContainer.class */
public class ActionBarContainer extends FrameLayout {
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
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.ActionBar);
        this.mBackground = a.getDrawable(10);
        this.mStackedBackground = a.getDrawable(11);
        if (getId() == R.id.split_action_bar) {
            this.mIsSplit = true;
            this.mSplitBackground = a.getDrawable(12);
        }
        a.recycle();
        setWillNotDraw(this.mIsSplit ? this.mSplitBackground == null : this.mBackground == null && this.mStackedBackground == null);
    }

    @Override // android.view.View
    public void onFinishInflate() {
        super.onFinishInflate();
        this.mActionBarView = (ActionBarView) findViewById(R.id.action_bar);
    }

    public void setPrimaryBackground(Drawable bg) {
        if (this.mBackground != null) {
            this.mBackground.setCallback(null);
            unscheduleDrawable(this.mBackground);
        }
        this.mBackground = bg;
        if (bg != null) {
            bg.setCallback(this);
            if (this.mActionBarView != null) {
                this.mBackground.setBounds(this.mActionBarView.getLeft(), this.mActionBarView.getTop(), this.mActionBarView.getRight(), this.mActionBarView.getBottom());
            }
        }
        setWillNotDraw(this.mIsSplit ? this.mSplitBackground == null : this.mBackground == null && this.mStackedBackground == null);
        invalidate();
    }

    public void setStackedBackground(Drawable bg) {
        if (this.mStackedBackground != null) {
            this.mStackedBackground.setCallback(null);
            unscheduleDrawable(this.mStackedBackground);
        }
        this.mStackedBackground = bg;
        if (bg != null) {
            bg.setCallback(this);
            if (this.mIsStacked && this.mStackedBackground != null) {
                this.mStackedBackground.setBounds(this.mTabContainer.getLeft(), this.mTabContainer.getTop(), this.mTabContainer.getRight(), this.mTabContainer.getBottom());
            }
        }
        setWillNotDraw(this.mIsSplit ? this.mSplitBackground == null : this.mBackground == null && this.mStackedBackground == null);
        invalidate();
    }

    public void setSplitBackground(Drawable bg) {
        if (this.mSplitBackground != null) {
            this.mSplitBackground.setCallback(null);
            unscheduleDrawable(this.mSplitBackground);
        }
        this.mSplitBackground = bg;
        if (bg != null) {
            bg.setCallback(this);
            if (this.mIsSplit && this.mSplitBackground != null) {
                this.mSplitBackground.setBounds(0, 0, getMeasuredWidth(), getMeasuredHeight());
            }
        }
        setWillNotDraw(this.mIsSplit ? this.mSplitBackground == null : this.mBackground == null && this.mStackedBackground == null);
        invalidate();
    }

    @Override // android.view.View
    public void setVisibility(int visibility) {
        super.setVisibility(visibility);
        boolean isVisible = visibility == 0;
        if (this.mBackground != null) {
            this.mBackground.setVisible(isVisible, false);
        }
        if (this.mStackedBackground != null) {
            this.mStackedBackground.setVisible(isVisible, false);
        }
        if (this.mSplitBackground != null) {
            this.mSplitBackground.setVisible(isVisible, false);
        }
    }

    @Override // android.view.View
    protected boolean verifyDrawable(Drawable who) {
        return (who == this.mBackground && !this.mIsSplit) || (who == this.mStackedBackground && this.mIsStacked) || ((who == this.mSplitBackground && this.mIsSplit) || super.verifyDrawable(who));
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void drawableStateChanged() {
        super.drawableStateChanged();
        if (this.mBackground != null && this.mBackground.isStateful()) {
            this.mBackground.setState(getDrawableState());
        }
        if (this.mStackedBackground != null && this.mStackedBackground.isStateful()) {
            this.mStackedBackground.setState(getDrawableState());
        }
        if (this.mSplitBackground != null && this.mSplitBackground.isStateful()) {
            this.mSplitBackground.setState(getDrawableState());
        }
    }

    public void setTransitioning(boolean isTransitioning) {
        this.mIsTransitioning = isTransitioning;
        setDescendantFocusability(isTransitioning ? 393216 : 262144);
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
                drawBackgroundDrawable(this.mSplitBackground, canvas);
            }
        } else {
            if (this.mBackground != null) {
                drawBackgroundDrawable(this.mBackground, canvas);
            }
            if (this.mStackedBackground != null && this.mIsStacked) {
                drawBackgroundDrawable(this.mStackedBackground, canvas);
            }
        }
    }

    public ActionMode startActionModeForChild(View child, ActionMode.Callback callback) {
        return null;
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

    private void drawBackgroundDrawable(Drawable d, Canvas canvas) {
        Rect bounds = d.getBounds();
        if ((d instanceof ColorDrawable) && !bounds.isEmpty() && Build.VERSION.SDK_INT < 11) {
            canvas.save();
            canvas.clipRect(bounds);
            d.draw(canvas);
            canvas.restore();
            return;
        }
        d.draw(canvas);
    }
}
