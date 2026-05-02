package com.actionbarsherlock.internal.widget;

import android.R;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.AttributeSet;
import android.view.View;
import android.widget.LinearLayout;
import com.actionbarsherlock.internal.nineoldandroids.widget.NineLinearLayout;

/* loaded from: com.actionbarsherlock.actionbarsherlock.4.4.0.jar:com/actionbarsherlock/internal/widget/IcsLinearLayout.class */
public class IcsLinearLayout extends NineLinearLayout {
    private static final int[] R_styleable_LinearLayout = {R.attr.divider, R.attr.showDividers, R.attr.dividerPadding};
    private static final int LinearLayout_divider = 0;
    private static final int LinearLayout_showDividers = 1;
    private static final int LinearLayout_dividerPadding = 2;
    public static final int SHOW_DIVIDER_NONE = 0;
    public static final int SHOW_DIVIDER_BEGINNING = 1;
    public static final int SHOW_DIVIDER_MIDDLE = 2;
    public static final int SHOW_DIVIDER_END = 4;
    private Drawable mDivider;
    private int mDividerWidth;
    private int mDividerHeight;
    private int mShowDividers;
    private int mDividerPadding;

    public IcsLinearLayout(Context context, AttributeSet attrs) {
        super(context, attrs);
        TypedArray a = context.obtainStyledAttributes(attrs, R_styleable_LinearLayout);
        setDividerDrawable(a.getDrawable(0));
        this.mShowDividers = a.getInt(1, 0);
        this.mDividerPadding = a.getDimensionPixelSize(2, 0);
        a.recycle();
    }

    @Override // android.widget.LinearLayout
    public void setShowDividers(int showDividers) {
        if (showDividers != this.mShowDividers) {
            requestLayout();
            invalidate();
        }
        this.mShowDividers = showDividers;
    }

    @Override // android.widget.LinearLayout
    public int getShowDividers() {
        return this.mShowDividers;
    }

    @Override // android.widget.LinearLayout
    public void setDividerDrawable(Drawable divider) {
        if (divider == this.mDivider) {
            return;
        }
        if ((divider instanceof ColorDrawable) && Build.VERSION.SDK_INT < 11) {
            divider = new IcsColorDrawable((ColorDrawable) divider);
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

    @Override // android.widget.LinearLayout
    public void setDividerPadding(int padding) {
        this.mDividerPadding = padding;
    }

    @Override // android.widget.LinearLayout
    public int getDividerPadding() {
        return this.mDividerPadding;
    }

    public int getDividerWidth() {
        return this.mDividerWidth;
    }

    @Override // android.view.ViewGroup
    protected void measureChildWithMargins(View child, int parentWidthMeasureSpec, int widthUsed, int parentHeightMeasureSpec, int heightUsed) {
        int index = indexOfChild(child);
        int orientation = getOrientation();
        LinearLayout.LayoutParams params = (LinearLayout.LayoutParams) child.getLayoutParams();
        if (hasDividerBeforeChildAt(index)) {
            if (orientation == 1) {
                params.topMargin = this.mDividerHeight;
            } else {
                params.leftMargin = this.mDividerWidth;
            }
        }
        int count = getChildCount();
        if (index == count - 1 && hasDividerBeforeChildAt(count)) {
            if (orientation == 1) {
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
            if (getOrientation() == 1) {
                drawDividersVertical(canvas);
            } else {
                drawDividersHorizontal(canvas);
            }
        }
        super.onDraw(canvas);
    }

    void drawDividersVertical(Canvas canvas) {
        int bottom;
        int count = getChildCount();
        for (int i = 0; i < count; i++) {
            View child = getChildAt(i);
            if (child != null && child.getVisibility() != 8 && hasDividerBeforeChildAt(i)) {
                LinearLayout.LayoutParams lp = (LinearLayout.LayoutParams) child.getLayoutParams();
                int top = child.getTop() - lp.topMargin;
                drawHorizontalDivider(canvas, top);
            }
        }
        if (hasDividerBeforeChildAt(count)) {
            View child2 = getChildAt(count - 1);
            if (child2 == null) {
                bottom = (getHeight() - getPaddingBottom()) - this.mDividerHeight;
            } else {
                bottom = child2.getBottom();
            }
            drawHorizontalDivider(canvas, bottom);
        }
    }

    void drawDividersHorizontal(Canvas canvas) {
        int right;
        int count = getChildCount();
        for (int i = 0; i < count; i++) {
            View child = getChildAt(i);
            if (child != null && child.getVisibility() != 8 && hasDividerBeforeChildAt(i)) {
                LinearLayout.LayoutParams lp = (LinearLayout.LayoutParams) child.getLayoutParams();
                int left = child.getLeft() - lp.leftMargin;
                drawVerticalDivider(canvas, left);
            }
        }
        if (hasDividerBeforeChildAt(count)) {
            View child2 = getChildAt(count - 1);
            if (child2 == null) {
                right = (getWidth() - getPaddingRight()) - this.mDividerWidth;
            } else {
                right = child2.getRight();
            }
            drawVerticalDivider(canvas, right);
        }
    }

    void drawHorizontalDivider(Canvas canvas, int top) {
        this.mDivider.setBounds(getPaddingLeft() + this.mDividerPadding, top, (getWidth() - getPaddingRight()) - this.mDividerPadding, top + this.mDividerHeight);
        this.mDivider.draw(canvas);
    }

    void drawVerticalDivider(Canvas canvas, int left) {
        this.mDivider.setBounds(left, getPaddingTop() + this.mDividerPadding, left + this.mDividerWidth, (getHeight() - getPaddingBottom()) - this.mDividerPadding);
        this.mDivider.draw(canvas);
    }

    protected boolean hasDividerBeforeChildAt(int childIndex) {
        if (childIndex == 0) {
            return (this.mShowDividers & 1) != 0;
        }
        if (childIndex == getChildCount()) {
            return (this.mShowDividers & 4) != 0;
        }
        if ((this.mShowDividers & 2) != 0) {
            boolean hasVisibleViewBefore = false;
            int i = childIndex - 1;
            while (true) {
                if (i < 0) {
                    break;
                }
                if (getChildAt(i).getVisibility() == 8) {
                    i--;
                } else {
                    hasVisibleViewBefore = true;
                    break;
                }
            }
            return hasVisibleViewBefore;
        }
        return false;
    }
}
