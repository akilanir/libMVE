package com.viewpagerindicator;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.v4.view.MotionEventCompat;
import android.support.v4.view.ViewConfigurationCompat;
import android.support.v4.view.ViewPager;
import android.util.AttributeSet;
import android.util.FloatMath;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;

/* loaded from: com.inkapplications.viewpageindicator.library.2.4.3.jar:com/viewpagerindicator/LinePageIndicator.class */
public class LinePageIndicator extends View implements PageIndicator {
    private static final int INVALID_POINTER = -1;
    private final Paint mPaintUnselected;
    private final Paint mPaintSelected;
    private ViewPager mViewPager;
    private ViewPager.OnPageChangeListener mListener;
    private int mCurrentPage;
    private boolean mCentered;
    private float mLineWidth;
    private float mGapWidth;
    private int mTouchSlop;
    private float mLastMotionX;
    private int mActivePointerId;
    private boolean mIsDragging;

    public LinePageIndicator(Context context) {
        this(context, null);
    }

    public LinePageIndicator(Context context, AttributeSet attrs) {
        this(context, attrs, R.attr.vpiLinePageIndicatorStyle);
    }

    public LinePageIndicator(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mPaintUnselected = new Paint(1);
        this.mPaintSelected = new Paint(1);
        this.mLastMotionX = -1.0f;
        this.mActivePointerId = INVALID_POINTER;
        if (isInEditMode()) {
            return;
        }
        Resources res = getResources();
        int defaultSelectedColor = res.getColor(R.color.default_line_indicator_selected_color);
        int defaultUnselectedColor = res.getColor(R.color.default_line_indicator_unselected_color);
        float defaultLineWidth = res.getDimension(R.dimen.default_line_indicator_line_width);
        float defaultGapWidth = res.getDimension(R.dimen.default_line_indicator_gap_width);
        float defaultStrokeWidth = res.getDimension(R.dimen.default_line_indicator_stroke_width);
        boolean defaultCentered = res.getBoolean(R.bool.default_line_indicator_centered);
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.LinePageIndicator, defStyle, 0);
        this.mCentered = a.getBoolean(1, defaultCentered);
        this.mLineWidth = a.getDimension(5, defaultLineWidth);
        this.mGapWidth = a.getDimension(6, defaultGapWidth);
        setStrokeWidth(a.getDimension(3, defaultStrokeWidth));
        this.mPaintUnselected.setColor(a.getColor(4, defaultUnselectedColor));
        this.mPaintSelected.setColor(a.getColor(2, defaultSelectedColor));
        Drawable background = a.getDrawable(0);
        if (background != null) {
            setBackgroundDrawable(background);
        }
        a.recycle();
        ViewConfiguration configuration = ViewConfiguration.get(context);
        this.mTouchSlop = ViewConfigurationCompat.getScaledPagingTouchSlop(configuration);
    }

    public void setCentered(boolean centered) {
        this.mCentered = centered;
        invalidate();
    }

    public boolean isCentered() {
        return this.mCentered;
    }

    public void setUnselectedColor(int unselectedColor) {
        this.mPaintUnselected.setColor(unselectedColor);
        invalidate();
    }

    public int getUnselectedColor() {
        return this.mPaintUnselected.getColor();
    }

    public void setSelectedColor(int selectedColor) {
        this.mPaintSelected.setColor(selectedColor);
        invalidate();
    }

    public int getSelectedColor() {
        return this.mPaintSelected.getColor();
    }

    public void setLineWidth(float lineWidth) {
        this.mLineWidth = lineWidth;
        invalidate();
    }

    public float getLineWidth() {
        return this.mLineWidth;
    }

    public void setStrokeWidth(float lineHeight) {
        this.mPaintSelected.setStrokeWidth(lineHeight);
        this.mPaintUnselected.setStrokeWidth(lineHeight);
        invalidate();
    }

    public float getStrokeWidth() {
        return this.mPaintSelected.getStrokeWidth();
    }

    public void setGapWidth(float gapWidth) {
        this.mGapWidth = gapWidth;
        invalidate();
    }

    public float getGapWidth() {
        return this.mGapWidth;
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        int count;
        super.onDraw(canvas);
        if (this.mViewPager == null || (count = this.mViewPager.getAdapter().getCount()) == 0) {
            return;
        }
        if (this.mCurrentPage >= count) {
            setCurrentItem(count - 1);
            return;
        }
        float lineWidthAndGap = this.mLineWidth + this.mGapWidth;
        float indicatorWidth = (count * lineWidthAndGap) - this.mGapWidth;
        float paddingTop = getPaddingTop();
        float paddingLeft = getPaddingLeft();
        float paddingRight = getPaddingRight();
        float verticalOffset = paddingTop + (((getHeight() - paddingTop) - getPaddingBottom()) / 2.0f);
        float horizontalOffset = paddingLeft;
        if (this.mCentered) {
            horizontalOffset += (((getWidth() - paddingLeft) - paddingRight) / 2.0f) - (indicatorWidth / 2.0f);
        }
        int i = 0;
        while (i < count) {
            float dx1 = horizontalOffset + (i * lineWidthAndGap);
            float dx2 = dx1 + this.mLineWidth;
            canvas.drawLine(dx1, verticalOffset, dx2, verticalOffset, i == this.mCurrentPage ? this.mPaintSelected : this.mPaintUnselected);
            i++;
        }
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent ev) {
        if (super.onTouchEvent(ev)) {
            return true;
        }
        if (this.mViewPager == null || this.mViewPager.getAdapter().getCount() == 0) {
            return false;
        }
        int action = ev.getAction() & 255;
        switch (action) {
            case BuildConfig.DEBUG /* 0 */:
                this.mActivePointerId = MotionEventCompat.getPointerId(ev, 0);
                this.mLastMotionX = ev.getX();
                break;
            case 1:
            case 3:
                if (!this.mIsDragging) {
                    int count = this.mViewPager.getAdapter().getCount();
                    int width = getWidth();
                    float halfWidth = width / 2.0f;
                    float sixthWidth = width / 6.0f;
                    if (this.mCurrentPage > 0 && ev.getX() < halfWidth - sixthWidth) {
                        if (action != 3) {
                            this.mViewPager.setCurrentItem(this.mCurrentPage - 1);
                            break;
                        }
                    } else if (this.mCurrentPage < count - 1 && ev.getX() > halfWidth + sixthWidth) {
                        if (action != 3) {
                            this.mViewPager.setCurrentItem(this.mCurrentPage + 1);
                            break;
                        }
                    }
                }
                this.mIsDragging = false;
                this.mActivePointerId = INVALID_POINTER;
                if (this.mViewPager.isFakeDragging()) {
                    this.mViewPager.endFakeDrag();
                    break;
                }
                break;
            case 2:
                int activePointerIndex = MotionEventCompat.findPointerIndex(ev, this.mActivePointerId);
                float x = MotionEventCompat.getX(ev, activePointerIndex);
                float deltaX = x - this.mLastMotionX;
                if (!this.mIsDragging && Math.abs(deltaX) > this.mTouchSlop) {
                    this.mIsDragging = true;
                }
                if (this.mIsDragging) {
                    this.mLastMotionX = x;
                    if (this.mViewPager.isFakeDragging() || this.mViewPager.beginFakeDrag()) {
                        this.mViewPager.fakeDragBy(deltaX);
                        break;
                    }
                }
                break;
            case 5:
                int index = MotionEventCompat.getActionIndex(ev);
                this.mLastMotionX = MotionEventCompat.getX(ev, index);
                this.mActivePointerId = MotionEventCompat.getPointerId(ev, index);
                break;
            case 6:
                int pointerIndex = MotionEventCompat.getActionIndex(ev);
                int pointerId = MotionEventCompat.getPointerId(ev, pointerIndex);
                if (pointerId == this.mActivePointerId) {
                    int newPointerIndex = pointerIndex == 0 ? 1 : 0;
                    this.mActivePointerId = MotionEventCompat.getPointerId(ev, newPointerIndex);
                }
                this.mLastMotionX = MotionEventCompat.getX(ev, MotionEventCompat.findPointerIndex(ev, this.mActivePointerId));
                break;
        }
        return true;
    }

    @Override // com.viewpagerindicator.PageIndicator
    public void setViewPager(ViewPager viewPager) {
        if (this.mViewPager == viewPager) {
            return;
        }
        if (this.mViewPager != null) {
            this.mViewPager.setOnPageChangeListener((ViewPager.OnPageChangeListener) null);
        }
        if (viewPager.getAdapter() == null) {
            throw new IllegalStateException("ViewPager does not have adapter instance.");
        }
        this.mViewPager = viewPager;
        this.mViewPager.setOnPageChangeListener(this);
        invalidate();
    }

    @Override // com.viewpagerindicator.PageIndicator
    public void setViewPager(ViewPager view, int initialPosition) {
        setViewPager(view);
        setCurrentItem(initialPosition);
    }

    @Override // com.viewpagerindicator.PageIndicator
    public void setCurrentItem(int item) {
        if (this.mViewPager == null) {
            throw new IllegalStateException("ViewPager has not been bound.");
        }
        this.mViewPager.setCurrentItem(item);
        this.mCurrentPage = item;
        invalidate();
    }

    @Override // com.viewpagerindicator.PageIndicator
    public void notifyDataSetChanged() {
        invalidate();
    }

    public void onPageScrollStateChanged(int state) {
        if (this.mListener != null) {
            this.mListener.onPageScrollStateChanged(state);
        }
    }

    public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
        if (this.mListener != null) {
            this.mListener.onPageScrolled(position, positionOffset, positionOffsetPixels);
        }
    }

    public void onPageSelected(int position) {
        this.mCurrentPage = position;
        invalidate();
        if (this.mListener != null) {
            this.mListener.onPageSelected(position);
        }
    }

    @Override // com.viewpagerindicator.PageIndicator
    public void setOnPageChangeListener(ViewPager.OnPageChangeListener listener) {
        this.mListener = listener;
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        setMeasuredDimension(measureWidth(widthMeasureSpec), measureHeight(heightMeasureSpec));
    }

    private int measureWidth(int measureSpec) {
        float result;
        int specMode = View.MeasureSpec.getMode(measureSpec);
        int specSize = View.MeasureSpec.getSize(measureSpec);
        if (specMode == 1073741824 || this.mViewPager == null) {
            result = specSize;
        } else {
            int count = this.mViewPager.getAdapter().getCount();
            result = getPaddingLeft() + getPaddingRight() + (count * this.mLineWidth) + ((count - 1) * this.mGapWidth);
            if (specMode == Integer.MIN_VALUE) {
                result = Math.min(result, specSize);
            }
        }
        return (int) FloatMath.ceil(result);
    }

    private int measureHeight(int measureSpec) {
        float result;
        int specMode = View.MeasureSpec.getMode(measureSpec);
        int specSize = View.MeasureSpec.getSize(measureSpec);
        if (specMode == 1073741824) {
            result = specSize;
        } else {
            result = this.mPaintSelected.getStrokeWidth() + getPaddingTop() + getPaddingBottom();
            if (specMode == Integer.MIN_VALUE) {
                result = Math.min(result, specSize);
            }
        }
        return (int) FloatMath.ceil(result);
    }

    @Override // android.view.View
    public void onRestoreInstanceState(Parcelable state) {
        SavedState savedState = (SavedState) state;
        super.onRestoreInstanceState(savedState.getSuperState());
        this.mCurrentPage = savedState.currentPage;
        requestLayout();
    }

    @Override // android.view.View
    public Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        SavedState savedState = new SavedState(superState);
        savedState.currentPage = this.mCurrentPage;
        return savedState;
    }

    /* loaded from: com.inkapplications.viewpageindicator.library.2.4.3.jar:com/viewpagerindicator/LinePageIndicator$SavedState.class */
    static class SavedState extends View.BaseSavedState {
        int currentPage;
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: com.viewpagerindicator.LinePageIndicator.SavedState.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public SavedState createFromParcel(Parcel in) {
                return new SavedState(in);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public SavedState[] newArray(int size) {
                return new SavedState[size];
            }
        };

        public SavedState(Parcelable superState) {
            super(superState);
        }

        private SavedState(Parcel in) {
            super(in);
            this.currentPage = in.readInt();
        }

        @Override // android.view.View.BaseSavedState, android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel dest, int flags) {
            super.writeToParcel(dest, flags);
            dest.writeInt(this.currentPage);
        }
    }
}
