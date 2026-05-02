package org.dmfs.android.view;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.support.v4.view.PagerAdapter;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewConfiguration;

/* loaded from: drawablepagertabstrip.jar:org/dmfs/android/view/DrawablePagerTabStrip.class */
public class DrawablePagerTabStrip extends DrawablePagerTitleStrip {
    private static final String TAG = "PagerTabStrip";
    private static final int INDICATOR_HEIGHT = 3;
    private static final int MIN_PADDING_BOTTOM = 6;
    private static final int TAB_PADDING = 0;
    private static final int TAB_SPACING = 0;
    private static final int MIN_TEXT_SPACING = 0;
    private static final int FULL_UNDERLINE_HEIGHT = 1;
    private static final int MIN_STRIP_HEIGHT = 32;
    private int mIndicatorColor;
    private int mIndicatorHeight;
    private int mMinPaddingBottom;
    private int mMinTextSpacing;
    private int mMinStripHeight;
    private int mTabPadding;
    private final Paint mTabPaint;
    private final Rect mTempRect;
    private int mTabAlpha;
    private boolean mDrawFullUnderline;
    private boolean mDrawFullUnderlineSet;
    private int mFullUnderlineHeight;
    private boolean mIgnoreTap;
    private float mInitialMotionX;
    private float mInitialMotionY;
    private int mTouchSlop;

    public DrawablePagerTabStrip(Context context) {
        this(context, null);
    }

    public DrawablePagerTabStrip(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mTabPaint = new Paint();
        this.mTempRect = new Rect();
        this.mTabAlpha = 255;
        this.mDrawFullUnderline = false;
        this.mDrawFullUnderlineSet = false;
        this.mIndicatorColor = 0;
        this.mTabPaint.setColor(this.mIndicatorColor);
        float density = context.getResources().getDisplayMetrics().density;
        this.mIndicatorHeight = (int) ((3.0f * density) + 0.5f);
        this.mMinPaddingBottom = (int) ((6.0f * density) + 0.5f);
        this.mMinTextSpacing = (int) (0.0f * density);
        this.mTabPadding = (int) ((0.0f * density) + 0.5f);
        this.mFullUnderlineHeight = (int) ((1.0f * density) + 0.5f);
        this.mMinStripHeight = (int) ((32.0f * density) + 0.5f);
        this.mTouchSlop = ViewConfiguration.get(context).getScaledTouchSlop();
        setPadding(getPaddingLeft(), getPaddingTop(), getPaddingRight(), getPaddingBottom());
        setTextSpacing(getTextSpacing());
        setWillNotDraw(false);
        if (getBackground() == null) {
            this.mDrawFullUnderline = true;
        }
    }

    public void setTabIndicatorColor(int color) {
        this.mIndicatorColor = color;
        this.mTabPaint.setColor(this.mIndicatorColor);
        invalidate();
    }

    public void setTabIndicatorColorResource(int resId) {
        setTabIndicatorColor(getContext().getResources().getColor(resId));
    }

    public int getTabIndicatorColor() {
        return this.mIndicatorColor;
    }

    @Override // android.view.View
    public void setPadding(int left, int top, int right, int bottom) {
        if (bottom < this.mMinPaddingBottom) {
            bottom = this.mMinPaddingBottom;
        }
        super.setPadding(left, top, right, bottom);
    }

    @Override // org.dmfs.android.view.DrawablePagerTitleStrip
    public void setTextSpacing(int textSpacing) {
        if (textSpacing < this.mMinTextSpacing) {
            textSpacing = this.mMinTextSpacing;
        }
        super.setTextSpacing(textSpacing);
    }

    @Override // android.view.View
    public void setBackgroundDrawable(Drawable d) {
        super.setBackgroundDrawable(d);
        if (!this.mDrawFullUnderlineSet) {
            this.mDrawFullUnderline = d == null;
        }
    }

    @Override // android.view.View
    public void setBackgroundColor(int color) {
        super.setBackgroundColor(color);
        if (!this.mDrawFullUnderlineSet) {
            this.mDrawFullUnderline = (color & (-16777216)) == 0;
        }
    }

    @Override // android.view.View
    public void setBackgroundResource(int resId) {
        super.setBackgroundResource(resId);
        if (!this.mDrawFullUnderlineSet) {
            this.mDrawFullUnderline = resId == 0;
        }
    }

    public void setDrawFullUnderline(boolean drawFull) {
        this.mDrawFullUnderline = drawFull;
        this.mDrawFullUnderlineSet = true;
        invalidate();
    }

    public boolean getDrawFullUnderline() {
        return this.mDrawFullUnderline;
    }

    @Override // org.dmfs.android.view.DrawablePagerTitleStrip
    int getMinHeight() {
        return Math.max(super.getMinHeight(), this.mMinStripHeight);
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        int height = getHeight();
        int left = this.mImageViews[this.mImageViews.length / 2].getLeft() - this.mTabPadding;
        int right = this.mImageViews[this.mImageViews.length / 2].getRight() + this.mTabPadding;
        int top = height - this.mIndicatorHeight;
        this.mTabPaint.setColor((this.mTabAlpha << 24) | (this.mIndicatorColor & 16777215));
        canvas.drawRect(left, top, right, height, this.mTabPaint);
    }

    @Override // org.dmfs.android.view.DrawablePagerTitleStrip
    void updateAdapter(PagerAdapter oldAdapter, PagerAdapter newAdapter) {
        super.updateAdapter(oldAdapter, newAdapter);
        if (this.mImageViews != null) {
            int l = this.mImageViews.length;
            for (int i = 0; i < l; i++) {
                if (i != l / 2) {
                    final int x = i - (l / 2);
                    this.mImageViews[i].setFocusable(true);
                    this.mImageViews[i].setOnClickListener(new View.OnClickListener() { // from class: org.dmfs.android.view.DrawablePagerTabStrip.1
                        @Override // android.view.View.OnClickListener
                        public void onClick(View v) {
                            DrawablePagerTabStrip.this.mPager.setCurrentItem(DrawablePagerTabStrip.this.mPager.getCurrentItem() + x);
                        }
                    });
                }
            }
        }
    }
}
