package com.yalantis.ucrop.view.widget;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.support.annotation.ColorInt;
import android.support.v4.content.ContextCompat;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import com.yalantis.ucrop.R;

/* loaded from: com.yalantis.ucrop.1.5.0.jar:com/yalantis/ucrop/view/widget/HorizontalProgressWheelView.class */
public class HorizontalProgressWheelView extends View {
    private final Rect mCanvasClipBounds;
    private ScrollingListener mScrollingListener;
    private float mLastTouchedPosition;
    private Paint mProgressLinePaint;
    private int mProgressLineWidth;
    private int mProgressLineHeight;
    private int mProgressLineMargin;
    private boolean mScrollStarted;
    private float mTotalScrollDistance;
    private int mMiddleLineColor;

    /* loaded from: com.yalantis.ucrop.1.5.0.jar:com/yalantis/ucrop/view/widget/HorizontalProgressWheelView$ScrollingListener.class */
    public interface ScrollingListener {
        void onScrollStart();

        void onScroll(float f, float f2);

        void onScrollEnd();
    }

    public HorizontalProgressWheelView(Context context) {
        this(context, null);
    }

    public HorizontalProgressWheelView(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public HorizontalProgressWheelView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mCanvasClipBounds = new Rect();
        init();
    }

    @TargetApi(21)
    public HorizontalProgressWheelView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mCanvasClipBounds = new Rect();
    }

    public void setScrollingListener(ScrollingListener scrollingListener) {
        this.mScrollingListener = scrollingListener;
    }

    public void setMiddleLineColor(@ColorInt int middleLineColor) {
        this.mMiddleLineColor = middleLineColor;
        invalidate();
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        switch (event.getAction()) {
            case 0:
                this.mLastTouchedPosition = event.getX();
                break;
            case 1:
                if (this.mScrollingListener != null) {
                    this.mScrollStarted = false;
                    this.mScrollingListener.onScrollEnd();
                    break;
                }
                break;
            case 2:
                float distance = event.getX() - this.mLastTouchedPosition;
                if (distance != 0.0f) {
                    if (!this.mScrollStarted) {
                        this.mScrollStarted = true;
                        if (this.mScrollingListener != null) {
                            this.mScrollingListener.onScrollStart();
                        }
                    }
                    onScrollEvent(event, distance);
                    break;
                }
                break;
        }
        return true;
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        canvas.getClipBounds(this.mCanvasClipBounds);
        int linesCount = this.mCanvasClipBounds.width() / (this.mProgressLineWidth + this.mProgressLineMargin);
        float deltaX = this.mTotalScrollDistance % (this.mProgressLineMargin + this.mProgressLineWidth);
        this.mProgressLinePaint.setColor(getResources().getColor(R.color.ucrop_color_progress_wheel_line));
        for (int i = 0; i < linesCount; i++) {
            if (i < linesCount / 4) {
                this.mProgressLinePaint.setAlpha((int) (255.0f * (i / (linesCount / 4))));
            } else if (i > (linesCount * 3) / 4) {
                this.mProgressLinePaint.setAlpha((int) (255.0f * ((linesCount - i) / (linesCount / 4))));
            } else {
                this.mProgressLinePaint.setAlpha(255);
            }
            canvas.drawLine((-deltaX) + this.mCanvasClipBounds.left + (i * (this.mProgressLineWidth + this.mProgressLineMargin)), this.mCanvasClipBounds.centerY() - (this.mProgressLineHeight / 4.0f), (-deltaX) + this.mCanvasClipBounds.left + (i * (this.mProgressLineWidth + this.mProgressLineMargin)), this.mCanvasClipBounds.centerY() + (this.mProgressLineHeight / 4.0f), this.mProgressLinePaint);
        }
        this.mProgressLinePaint.setColor(this.mMiddleLineColor);
        canvas.drawLine(this.mCanvasClipBounds.centerX(), this.mCanvasClipBounds.centerY() - (this.mProgressLineHeight / 2.0f), this.mCanvasClipBounds.centerX(), this.mCanvasClipBounds.centerY() + (this.mProgressLineHeight / 2.0f), this.mProgressLinePaint);
    }

    private void onScrollEvent(MotionEvent event, float distance) {
        this.mTotalScrollDistance -= distance;
        postInvalidate();
        this.mLastTouchedPosition = event.getX();
        if (this.mScrollingListener != null) {
            this.mScrollingListener.onScroll(-distance, this.mTotalScrollDistance);
        }
    }

    private void init() {
        this.mMiddleLineColor = ContextCompat.getColor(getContext(), R.color.ucrop_color_progress_wheel_line);
        this.mProgressLineWidth = getContext().getResources().getDimensionPixelSize(R.dimen.ucrop_width_horizontal_wheel_progress_line);
        this.mProgressLineHeight = getContext().getResources().getDimensionPixelSize(R.dimen.ucrop_height_horizontal_wheel_progress_line);
        this.mProgressLineMargin = getContext().getResources().getDimensionPixelSize(R.dimen.ucrop_margin_horizontal_wheel_progress_line);
        this.mProgressLinePaint = new Paint(1);
        this.mProgressLinePaint.setStyle(Paint.Style.STROKE);
        this.mProgressLinePaint.setStrokeWidth(this.mProgressLineWidth);
    }
}
