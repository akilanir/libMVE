package com.jjoe64.graphview;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.RectF;
import android.support.v4.view.ViewCompat;
import android.support.v4.widget.EdgeEffectCompat;
import android.util.Log;
import android.view.GestureDetector;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.widget.OverScroller;
import com.jjoe64.graphview.series.DataPointInterface;
import com.jjoe64.graphview.series.Series;
import java.util.Iterator;
import java.util.List;

/* loaded from: com.jjoe64.graphview.4.0.1.jar:com/jjoe64/graphview/Viewport.class */
public class Viewport {
    private final GraphView mGraphView;
    protected boolean mScalingActive;
    protected float mScalingBeginWidth;
    protected float mScalingBeginLeft;
    private boolean mIsScrollable;
    private boolean mIsScalable;
    protected GestureDetector mGestureDetector;
    protected ScaleGestureDetector mScaleGestureDetector;
    protected OverScroller mScroller;
    private EdgeEffectCompat mEdgeEffectTop;
    private EdgeEffectCompat mEdgeEffectBottom;
    private EdgeEffectCompat mEdgeEffectLeft;
    private EdgeEffectCompat mEdgeEffectRight;
    private boolean mEdgeEffectTopActive;
    private boolean mEdgeEffectBottomActive;
    private boolean mEdgeEffectLeftActive;
    private boolean mEdgeEffectRightActive;
    private boolean mXAxisBoundsManual;
    private boolean mYAxisBoundsManual;
    private final ScaleGestureDetector.OnScaleGestureListener mScaleGestureListener = new ScaleGestureDetector.OnScaleGestureListener() { // from class: com.jjoe64.graphview.Viewport.1
        @Override // android.view.ScaleGestureDetector.OnScaleGestureListener
        public boolean onScale(ScaleGestureDetector detector) {
            float viewportWidth = Viewport.this.mCurrentViewport.width();
            float center = Viewport.this.mCurrentViewport.left + (viewportWidth / 2.0f);
            float viewportWidth2 = viewportWidth / detector.getScaleFactor();
            Viewport.this.mCurrentViewport.left = center - (viewportWidth2 / 2.0f);
            Viewport.this.mCurrentViewport.right = Viewport.this.mCurrentViewport.left + viewportWidth2;
            float minX = (float) Viewport.this.getMinX(true);
            if (Viewport.this.mCurrentViewport.left < minX) {
                Viewport.this.mCurrentViewport.left = minX;
                Viewport.this.mCurrentViewport.right = Viewport.this.mCurrentViewport.left + viewportWidth2;
            }
            float maxX = (float) Viewport.this.getMaxX(true);
            if (viewportWidth2 == 0.0f) {
                Viewport.this.mCurrentViewport.right = maxX;
            }
            double overlap = (Viewport.this.mCurrentViewport.left + viewportWidth2) - maxX;
            if (overlap > 0.0d) {
                if (Viewport.this.mCurrentViewport.left - overlap > minX) {
                    Viewport.this.mCurrentViewport.left = (float) (r0.left - overlap);
                    Viewport.this.mCurrentViewport.right = Viewport.this.mCurrentViewport.left + viewportWidth2;
                } else {
                    Viewport.this.mCurrentViewport.left = minX;
                    Viewport.this.mCurrentViewport.right = maxX;
                }
            }
            Viewport.this.mGraphView.onDataChanged(true, false);
            ViewCompat.postInvalidateOnAnimation(Viewport.this.mGraphView);
            return true;
        }

        @Override // android.view.ScaleGestureDetector.OnScaleGestureListener
        public boolean onScaleBegin(ScaleGestureDetector detector) {
            if (Viewport.this.mIsScalable) {
                Viewport.this.mScalingBeginWidth = Viewport.this.mCurrentViewport.width();
                Viewport.this.mScalingBeginLeft = Viewport.this.mCurrentViewport.left;
                Viewport.this.mScalingActive = true;
                return true;
            }
            return false;
        }

        @Override // android.view.ScaleGestureDetector.OnScaleGestureListener
        public void onScaleEnd(ScaleGestureDetector detector) {
            Viewport.this.mScalingActive = false;
            Viewport.this.mXAxisBoundsStatus = AxisBoundsStatus.READJUST_AFTER_SCALE;
            Viewport.this.mScrollingReferenceX = Float.NaN;
            Viewport.this.mGraphView.onDataChanged(true, false);
            ViewCompat.postInvalidateOnAnimation(Viewport.this.mGraphView);
        }
    };
    private final GestureDetector.SimpleOnGestureListener mGestureListener = new GestureDetector.SimpleOnGestureListener() { // from class: com.jjoe64.graphview.Viewport.2
        @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
        public boolean onDown(MotionEvent e) {
            if (!Viewport.this.mIsScrollable || Viewport.this.mScalingActive) {
                return false;
            }
            Viewport.this.releaseEdgeEffects();
            Viewport.this.mScrollerStartViewport.set(Viewport.this.mCurrentViewport);
            Viewport.this.mScroller.forceFinished(true);
            ViewCompat.postInvalidateOnAnimation(Viewport.this.mGraphView);
            return true;
        }

        @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
        public boolean onScroll(MotionEvent e1, MotionEvent e2, float distanceX, float distanceY) {
            if (!Viewport.this.mIsScrollable || Viewport.this.mScalingActive) {
                return false;
            }
            if (Float.isNaN(Viewport.this.mScrollingReferenceX)) {
                Viewport.this.mScrollingReferenceX = Viewport.this.mCurrentViewport.left;
            }
            float viewportOffsetX = (distanceX * Viewport.this.mCurrentViewport.width()) / Viewport.this.mGraphView.getGraphContentWidth();
            float viewportOffsetY = ((-distanceY) * Viewport.this.mCurrentViewport.height()) / Viewport.this.mGraphView.getGraphContentHeight();
            int completeWidth = (int) ((Viewport.this.mCompleteRange.width() / Viewport.this.mCurrentViewport.width()) * Viewport.this.mGraphView.getGraphContentWidth());
            int completeHeight = (int) ((Viewport.this.mCompleteRange.height() / Viewport.this.mCurrentViewport.height()) * Viewport.this.mGraphView.getGraphContentHeight());
            int scrolledX = (int) ((completeWidth * ((Viewport.this.mCurrentViewport.left + viewportOffsetX) - Viewport.this.mCompleteRange.left)) / Viewport.this.mCompleteRange.width());
            int scrolledY = (int) ((completeHeight * ((Viewport.this.mCompleteRange.bottom - Viewport.this.mCurrentViewport.bottom) - viewportOffsetY)) / Viewport.this.mCompleteRange.height());
            boolean canScrollX = Viewport.this.mCurrentViewport.left > Viewport.this.mCompleteRange.left || Viewport.this.mCurrentViewport.right < Viewport.this.mCompleteRange.right;
            boolean canScrollY = Viewport.this.mCurrentViewport.bottom > Viewport.this.mCompleteRange.bottom || Viewport.this.mCurrentViewport.top < Viewport.this.mCompleteRange.top;
            if (canScrollX) {
                if (viewportOffsetX < 0.0f) {
                    float tooMuch = (Viewport.this.mCurrentViewport.left + viewportOffsetX) - Viewport.this.mCompleteRange.left;
                    if (tooMuch < 0.0f) {
                        viewportOffsetX -= tooMuch;
                    }
                } else {
                    float tooMuch2 = (Viewport.this.mCurrentViewport.right + viewportOffsetX) - Viewport.this.mCompleteRange.right;
                    if (tooMuch2 > 0.0f) {
                        viewportOffsetX -= tooMuch2;
                    }
                }
                Viewport.this.mCurrentViewport.left += viewportOffsetX;
                Viewport.this.mCurrentViewport.right += viewportOffsetX;
            }
            if (canScrollY) {
            }
            if (canScrollX && scrolledX < 0) {
                Viewport.this.mEdgeEffectLeft.onPull(scrolledX / Viewport.this.mGraphView.getGraphContentWidth());
                Viewport.this.mEdgeEffectLeftActive = true;
            }
            if (canScrollY && scrolledY < 0) {
                Viewport.this.mEdgeEffectBottom.onPull(scrolledY / Viewport.this.mGraphView.getGraphContentHeight());
                Viewport.this.mEdgeEffectBottomActive = true;
            }
            if (canScrollX && scrolledX > completeWidth - Viewport.this.mGraphView.getGraphContentWidth()) {
                Viewport.this.mEdgeEffectRight.onPull(((scrolledX - completeWidth) + Viewport.this.mGraphView.getGraphContentWidth()) / Viewport.this.mGraphView.getGraphContentWidth());
                Viewport.this.mEdgeEffectRightActive = true;
            }
            Viewport.this.mGraphView.onDataChanged(true, false);
            ViewCompat.postInvalidateOnAnimation(Viewport.this.mGraphView);
            return true;
        }

        @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
        public boolean onFling(MotionEvent e1, MotionEvent e2, float velocityX, float velocityY) {
            return true;
        }
    };
    protected RectF mCurrentViewport = new RectF();
    protected RectF mCompleteRange = new RectF();
    private RectF mScrollerStartViewport = new RectF();
    protected float mScrollingReferenceX = Float.NaN;
    private AxisBoundsStatus mXAxisBoundsStatus = AxisBoundsStatus.INITIAL;
    private AxisBoundsStatus mYAxisBoundsStatus = AxisBoundsStatus.INITIAL;
    private int mBackgroundColor = 0;
    private Paint mPaint = new Paint();

    /* loaded from: com.jjoe64.graphview.4.0.1.jar:com/jjoe64/graphview/Viewport$AxisBoundsStatus.class */
    public enum AxisBoundsStatus {
        INITIAL,
        AUTO_ADJUSTED,
        READJUST_AFTER_SCALE,
        FIX
    }

    Viewport(GraphView graphView) {
        this.mScroller = new OverScroller(graphView.getContext());
        this.mEdgeEffectTop = new EdgeEffectCompat(graphView.getContext());
        this.mEdgeEffectBottom = new EdgeEffectCompat(graphView.getContext());
        this.mEdgeEffectLeft = new EdgeEffectCompat(graphView.getContext());
        this.mEdgeEffectRight = new EdgeEffectCompat(graphView.getContext());
        this.mGestureDetector = new GestureDetector(graphView.getContext(), this.mGestureListener);
        this.mScaleGestureDetector = new ScaleGestureDetector(graphView.getContext(), this.mScaleGestureListener);
        this.mGraphView = graphView;
    }

    public boolean onTouchEvent(MotionEvent event) {
        boolean b = this.mScaleGestureDetector.onTouchEvent(event);
        return b | this.mGestureDetector.onTouchEvent(event);
    }

    public void setXAxisBoundsStatus(AxisBoundsStatus s) {
        this.mXAxisBoundsStatus = s;
    }

    public void setYAxisBoundsStatus(AxisBoundsStatus s) {
        this.mYAxisBoundsStatus = s;
    }

    public boolean isScrollable() {
        return this.mIsScrollable;
    }

    public void setScrollable(boolean mIsScrollable) {
        this.mIsScrollable = mIsScrollable;
    }

    public AxisBoundsStatus getXAxisBoundsStatus() {
        return this.mXAxisBoundsStatus;
    }

    public AxisBoundsStatus getYAxisBoundsStatus() {
        return this.mYAxisBoundsStatus;
    }

    public void calcCompleteRange() {
        List<Series> series = this.mGraphView.getSeries();
        this.mCompleteRange.set(0.0f, 0.0f, 0.0f, 0.0f);
        if (!series.isEmpty() && !series.get(0).isEmpty()) {
            double d = series.get(0).getLowestValueX();
            for (Series s : series) {
                if (!s.isEmpty() && d > s.getLowestValueX()) {
                    d = s.getLowestValueX();
                }
            }
            this.mCompleteRange.left = (float) d;
            double d2 = series.get(0).getHighestValueX();
            for (Series s2 : series) {
                if (!s2.isEmpty() && d2 < s2.getHighestValueX()) {
                    d2 = s2.getHighestValueX();
                }
            }
            this.mCompleteRange.right = (float) d2;
            double d3 = series.get(0).getLowestValueY();
            for (Series s3 : series) {
                if (!s3.isEmpty() && d3 > s3.getLowestValueY()) {
                    d3 = s3.getLowestValueY();
                }
            }
            this.mCompleteRange.bottom = (float) d3;
            double d4 = series.get(0).getHighestValueY();
            for (Series s4 : series) {
                if (!s4.isEmpty() && d4 < s4.getHighestValueY()) {
                    d4 = s4.getHighestValueY();
                }
            }
            this.mCompleteRange.top = (float) d4;
        }
        if (this.mYAxisBoundsStatus == AxisBoundsStatus.AUTO_ADJUSTED) {
            this.mYAxisBoundsStatus = AxisBoundsStatus.INITIAL;
        }
        if (this.mYAxisBoundsStatus == AxisBoundsStatus.INITIAL) {
            this.mCurrentViewport.top = this.mCompleteRange.top;
            this.mCurrentViewport.bottom = this.mCompleteRange.bottom;
        }
        if (this.mXAxisBoundsStatus == AxisBoundsStatus.AUTO_ADJUSTED) {
            this.mXAxisBoundsStatus = AxisBoundsStatus.INITIAL;
        }
        if (this.mXAxisBoundsStatus == AxisBoundsStatus.INITIAL) {
            this.mCurrentViewport.left = this.mCompleteRange.left;
            this.mCurrentViewport.right = this.mCompleteRange.right;
        } else if (this.mXAxisBoundsManual && !this.mYAxisBoundsManual && this.mCompleteRange.width() != 0.0f) {
            double d5 = Double.MAX_VALUE;
            for (Series s5 : series) {
                Iterator<DataPointInterface> values = s5.getValues(this.mCurrentViewport.left, this.mCurrentViewport.right);
                while (values.hasNext()) {
                    double v = values.next().getY();
                    if (d5 > v) {
                        d5 = v;
                    }
                }
            }
            this.mCurrentViewport.bottom = (float) d5;
            double d6 = Double.MIN_VALUE;
            for (Series s6 : series) {
                Iterator<DataPointInterface> values2 = s6.getValues(this.mCurrentViewport.left, this.mCurrentViewport.right);
                while (values2.hasNext()) {
                    double v2 = values2.next().getY();
                    if (d6 < v2) {
                        d6 = v2;
                    }
                }
            }
            this.mCurrentViewport.top = (float) d6;
        }
        if (this.mCurrentViewport.left == this.mCurrentViewport.right) {
            this.mCurrentViewport.right += 1.0f;
        }
        if (this.mCurrentViewport.top == this.mCurrentViewport.bottom) {
            this.mCurrentViewport.top += 1.0f;
        }
    }

    public double getMinX(boolean completeRange) {
        if (completeRange) {
            return this.mCompleteRange.left;
        }
        return this.mCurrentViewport.left;
    }

    public double getMaxX(boolean completeRange) {
        if (completeRange) {
            return this.mCompleteRange.right;
        }
        return this.mCurrentViewport.right;
    }

    public double getMinY(boolean completeRange) {
        if (completeRange) {
            return this.mCompleteRange.bottom;
        }
        return this.mCurrentViewport.bottom;
    }

    public double getMaxY(boolean completeRange) {
        if (completeRange) {
            return this.mCompleteRange.top;
        }
        return this.mCurrentViewport.top;
    }

    public void setMaxY(double y) {
        this.mCurrentViewport.top = (float) y;
    }

    public void setMinY(double y) {
        this.mCurrentViewport.bottom = (float) y;
    }

    public void setMaxX(double x) {
        this.mCurrentViewport.right = (float) x;
    }

    public void setMinX(double x) {
        this.mCurrentViewport.left = (float) x;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void releaseEdgeEffects() {
        this.mEdgeEffectRightActive = false;
        this.mEdgeEffectLeftActive = false;
        this.mEdgeEffectLeft.onRelease();
        this.mEdgeEffectRight.onRelease();
    }

    private void fling(int velocityX, int velocityY) {
        releaseEdgeEffects();
        this.mScrollerStartViewport.set(this.mCurrentViewport);
        int maxX = ((int) ((this.mCurrentViewport.width() / this.mCompleteRange.width()) * this.mGraphView.getGraphContentWidth())) - this.mGraphView.getGraphContentWidth();
        int maxY = ((int) ((this.mCurrentViewport.height() / this.mCompleteRange.height()) * this.mGraphView.getGraphContentHeight())) - this.mGraphView.getGraphContentHeight();
        int startX = ((int) ((this.mCurrentViewport.left - this.mCompleteRange.left) / this.mCompleteRange.width())) * maxX;
        int startY = ((int) ((this.mCurrentViewport.top - this.mCompleteRange.top) / this.mCompleteRange.height())) * maxY;
        this.mScroller.forceFinished(true);
        this.mScroller.fling(startX, startY, velocityX, 0, 0, maxX, 0, maxY, this.mGraphView.getGraphContentWidth() / 2, this.mGraphView.getGraphContentHeight() / 2);
        ViewCompat.postInvalidateOnAnimation(this.mGraphView);
    }

    public void computeScroll() {
    }

    private void drawEdgeEffectsUnclipped(Canvas canvas) {
        boolean needsInvalidate = false;
        if (!this.mEdgeEffectTop.isFinished()) {
            int restoreCount = canvas.save();
            canvas.translate(this.mGraphView.getGraphContentLeft(), this.mGraphView.getGraphContentTop());
            this.mEdgeEffectTop.setSize(this.mGraphView.getGraphContentWidth(), this.mGraphView.getGraphContentHeight());
            if (this.mEdgeEffectTop.draw(canvas)) {
                needsInvalidate = true;
            }
            canvas.restoreToCount(restoreCount);
        }
        if (!this.mEdgeEffectLeft.isFinished()) {
            int restoreCount2 = canvas.save();
            canvas.translate(this.mGraphView.getGraphContentLeft(), this.mGraphView.getGraphContentTop() + this.mGraphView.getGraphContentHeight());
            canvas.rotate(-90.0f, 0.0f, 0.0f);
            this.mEdgeEffectLeft.setSize(this.mGraphView.getGraphContentHeight(), this.mGraphView.getGraphContentWidth());
            if (this.mEdgeEffectLeft.draw(canvas)) {
                needsInvalidate = true;
            }
            canvas.restoreToCount(restoreCount2);
        }
        if (!this.mEdgeEffectRight.isFinished()) {
            int restoreCount3 = canvas.save();
            canvas.translate(this.mGraphView.getGraphContentLeft() + this.mGraphView.getGraphContentWidth(), this.mGraphView.getGraphContentTop());
            canvas.rotate(90.0f, 0.0f, 0.0f);
            this.mEdgeEffectRight.setSize(this.mGraphView.getGraphContentHeight(), this.mGraphView.getGraphContentWidth());
            if (this.mEdgeEffectRight.draw(canvas)) {
                needsInvalidate = true;
            }
            canvas.restoreToCount(restoreCount3);
        }
        if (needsInvalidate) {
            ViewCompat.postInvalidateOnAnimation(this.mGraphView);
        }
    }

    public void drawFirst(Canvas c) {
        if (this.mBackgroundColor != 0) {
            this.mPaint.setColor(this.mBackgroundColor);
            c.drawRect(this.mGraphView.getGraphContentLeft(), this.mGraphView.getGraphContentTop(), this.mGraphView.getGraphContentLeft() + this.mGraphView.getGraphContentWidth(), this.mGraphView.getGraphContentTop() + this.mGraphView.getGraphContentHeight(), this.mPaint);
        }
    }

    public void draw(Canvas c) {
        drawEdgeEffectsUnclipped(c);
    }

    public int getBackgroundColor() {
        return this.mBackgroundColor;
    }

    public void setBackgroundColor(int mBackgroundColor) {
        this.mBackgroundColor = mBackgroundColor;
    }

    public boolean isScalable() {
        return this.mIsScalable;
    }

    public void setScalable(boolean mIsScalable) {
        this.mIsScalable = mIsScalable;
        if (mIsScalable) {
            this.mIsScrollable = true;
            setXAxisBoundsManual(true);
        }
    }

    public boolean isXAxisBoundsManual() {
        return this.mXAxisBoundsManual;
    }

    public void setXAxisBoundsManual(boolean mXAxisBoundsManual) {
        this.mXAxisBoundsManual = mXAxisBoundsManual;
        if (mXAxisBoundsManual) {
            this.mXAxisBoundsStatus = AxisBoundsStatus.FIX;
        }
    }

    public boolean isYAxisBoundsManual() {
        return this.mYAxisBoundsManual;
    }

    public void setYAxisBoundsManual(boolean mYAxisBoundsManual) {
        this.mYAxisBoundsManual = mYAxisBoundsManual;
        if (mYAxisBoundsManual) {
            this.mYAxisBoundsStatus = AxisBoundsStatus.FIX;
        }
    }

    public void scrollToEnd() {
        if (this.mXAxisBoundsManual) {
            float size = this.mCurrentViewport.width();
            this.mCurrentViewport.right = this.mCompleteRange.right;
            this.mCurrentViewport.left = this.mCompleteRange.right - size;
            this.mScrollingReferenceX = Float.NaN;
            this.mGraphView.onDataChanged(true, false);
            return;
        }
        Log.w("GraphView", "scrollToEnd works only with manual x axis bounds");
    }
}
