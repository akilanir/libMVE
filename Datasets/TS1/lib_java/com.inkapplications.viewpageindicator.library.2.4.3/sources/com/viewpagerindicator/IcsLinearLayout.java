package com.viewpagerindicator;

import android.R;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.widget.LinearLayout;

/* loaded from: com.inkapplications.viewpageindicator.library.2.4.3.jar:com/viewpagerindicator/IcsLinearLayout.class */
class IcsLinearLayout extends LinearLayout {
    private static final int[] LL = {R.attr.divider, R.attr.showDividers, R.attr.dividerPadding};
    private static final int LL_DIVIDER = 0;
    private static final int LL_SHOW_DIVIDER = 1;
    private static final int LL_DIVIDER_PADDING = 2;
    private Drawable mDivider;
    private int mDividerWidth;
    private int mDividerHeight;
    private int mShowDividers;
    private int mDividerPadding;

    public IcsLinearLayout(Context context, int themeAttr) {
        super(context);
        TypedArray a = context.obtainStyledAttributes(null, LL, themeAttr, 0);
        setDividerDrawable(a.getDrawable(0));
        this.mDividerPadding = a.getDimensionPixelSize(LL_DIVIDER_PADDING, 0);
        this.mShowDividers = a.getInteger(LL_SHOW_DIVIDER, 0);
        a.recycle();
    }

    @Override // android.widget.LinearLayout
    public void setDividerDrawable(Drawable divider) {
        if (divider == this.mDivider) {
            return;
        }
        this.mDivider = divider;
        if (divider != null) {
            this.mDividerWidth = divider.getIntrinsicWidth();
            this.mDividerHeight = divider.getIntrinsicHeight();
        } else {
            this.mDividerWidth = 0;
            this.mDividerHeight = 0;
        }
        setWillNotDraw(divider == null);
        requestLayout();
    }

    @Override // android.view.ViewGroup
    protected void measureChildWithMargins(View child, int parentWidthMeasureSpec, int widthUsed, int parentHeightMeasureSpec, int heightUsed) {
        int index = indexOfChild(child);
        int orientation = getOrientation();
        LinearLayout.LayoutParams params = (LinearLayout.LayoutParams) child.getLayoutParams();
        if (hasDividerBeforeChildAt(index)) {
            if (orientation == LL_SHOW_DIVIDER) {
                params.topMargin = this.mDividerHeight;
            } else {
                params.leftMargin = this.mDividerWidth;
            }
        }
        int count = getChildCount();
        if (index == count - LL_SHOW_DIVIDER && hasDividerBeforeChildAt(count)) {
            if (orientation == LL_SHOW_DIVIDER) {
                params.bottomMargin = this.mDividerHeight;
            } else {
                params.rightMargin = this.mDividerWidth;
            }
        }
        super.measureChildWithMargins(child, parentWidthMeasureSpec, widthUsed, parentHeightMeasureSpec, heightUsed);
    }

    @Override // android.widget.LinearLayout, android.view.View
    protected void onDraw(Canvas canvas) {
        if (this.mDivider != null) {
            if (getOrientation() == LL_SHOW_DIVIDER) {
                drawDividersVertical(canvas);
            } else {
                drawDividersHorizontal(canvas);
            }
        }
        super.onDraw(canvas);
    }

    private void drawDividersVertical(Canvas canvas) {
        int bottom;
        int count = getChildCount();
        for (int i = 0; i < count; i += LL_SHOW_DIVIDER) {
            View child = getChildAt(i);
            if (child != null && child.getVisibility() != 8 && hasDividerBeforeChildAt(i)) {
                LinearLayout.LayoutParams lp = (LinearLayout.LayoutParams) child.getLayoutParams();
                int top = child.getTop() - lp.topMargin;
                drawHorizontalDivider(canvas, top);
            }
        }
        if (hasDividerBeforeChildAt(count)) {
            View child2 = getChildAt(count - LL_SHOW_DIVIDER);
            if (child2 == null) {
                bottom = (getHeight() - getPaddingBottom()) - this.mDividerHeight;
            } else {
                bottom = child2.getBottom();
            }
            drawHorizontalDivider(canvas, bottom);
        }
    }

    private void drawDividersHorizontal(Canvas canvas) {
        int right;
        int count = getChildCount();
        for (int i = 0; i < count; i += LL_SHOW_DIVIDER) {
            View child = getChildAt(i);
            if (child != null && child.getVisibility() != 8 && hasDividerBeforeChildAt(i)) {
                LinearLayout.LayoutParams lp = (LinearLayout.LayoutParams) child.getLayoutParams();
                int left = child.getLeft() - lp.leftMargin;
                drawVerticalDivider(canvas, left);
            }
        }
        if (hasDividerBeforeChildAt(count)) {
            View child2 = getChildAt(count - LL_SHOW_DIVIDER);
            if (child2 == null) {
                right = (getWidth() - getPaddingRight()) - this.mDividerWidth;
            } else {
                right = child2.getRight();
            }
            drawVerticalDivider(canvas, right);
        }
    }

    private void drawHorizontalDivider(Canvas canvas, int top) {
        this.mDivider.setBounds(getPaddingLeft() + this.mDividerPadding, top, (getWidth() - getPaddingRight()) - this.mDividerPadding, top + this.mDividerHeight);
        this.mDivider.draw(canvas);
    }

    private void drawVerticalDivider(Canvas canvas, int left) {
        this.mDivider.setBounds(left, getPaddingTop() + this.mDividerPadding, left + this.mDividerWidth, (getHeight() - getPaddingBottom()) - this.mDividerPadding);
        this.mDivider.draw(canvas);
    }

    private boolean hasDividerBeforeChildAt(int childIndex) {
        if (childIndex != 0 && childIndex != getChildCount() && (this.mShowDividers & LL_DIVIDER_PADDING) != 0) {
            boolean hasVisibleViewBefore = false;
            int i = childIndex - LL_SHOW_DIVIDER;
            while (true) {
                if (i < 0) {
                    break;
                }
                if (getChildAt(i).getVisibility() == 8) {
                    i--;
                } else {
                    hasVisibleViewBefore = LL_SHOW_DIVIDER;
                    break;
                }
            }
            return hasVisibleViewBefore;
        }
        return false;
    }
}
