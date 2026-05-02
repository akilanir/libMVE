package com.github.mikephil.charting.listener;

import android.annotation.SuppressLint;
import android.graphics.Matrix;
import android.graphics.PointF;
import android.util.Log;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.animation.AnimationUtils;
import com.github.mikephil.charting.BuildConfig;
import com.github.mikephil.charting.charts.BarLineChartBase;
import com.github.mikephil.charting.charts.HorizontalBarChart;
import com.github.mikephil.charting.data.BarLineScatterCandleBubbleData;
import com.github.mikephil.charting.data.Entry;
import com.github.mikephil.charting.highlight.Highlight;
import com.github.mikephil.charting.interfaces.datasets.IBarLineScatterCandleBubbleDataSet;
import com.github.mikephil.charting.interfaces.datasets.IDataSet;
import com.github.mikephil.charting.listener.ChartTouchListener;
import com.github.mikephil.charting.utils.Utils;
import com.github.mikephil.charting.utils.ViewPortHandler;

/* loaded from: MPAndroidChart-v2.2.5.jar:com/github/mikephil/charting/listener/BarLineChartTouchListener.class */
public class BarLineChartTouchListener extends ChartTouchListener<BarLineChartBase<? extends BarLineScatterCandleBubbleData<? extends IBarLineScatterCandleBubbleDataSet<? extends Entry>>>> {
    private Matrix mMatrix;
    private Matrix mSavedMatrix;
    private PointF mTouchStartPoint;
    private PointF mTouchPointCenter;
    private float mSavedXDist;
    private float mSavedYDist;
    private float mSavedDist;
    private IDataSet mClosestDataSetToTouch;
    private VelocityTracker mVelocityTracker;
    private long mDecelerationLastTime;
    private PointF mDecelerationCurrentPoint;
    private PointF mDecelerationVelocity;
    private float mDragTriggerDist;
    private float mMinScalePointerDistance;

    public BarLineChartTouchListener(BarLineChartBase<? extends BarLineScatterCandleBubbleData<? extends IBarLineScatterCandleBubbleDataSet<? extends Entry>>> chart, Matrix touchMatrix) {
        super(chart);
        this.mMatrix = new Matrix();
        this.mSavedMatrix = new Matrix();
        this.mTouchStartPoint = new PointF();
        this.mTouchPointCenter = new PointF();
        this.mSavedXDist = 1.0f;
        this.mSavedYDist = 1.0f;
        this.mSavedDist = 1.0f;
        this.mDecelerationLastTime = 0L;
        this.mDecelerationCurrentPoint = new PointF();
        this.mDecelerationVelocity = new PointF();
        this.mMatrix = touchMatrix;
        this.mDragTriggerDist = Utils.convertDpToPixel(3.0f);
        this.mMinScalePointerDistance = Utils.convertDpToPixel(3.5f);
    }

    @Override // android.view.View.OnTouchListener
    @SuppressLint({"ClickableViewAccessibility"})
    public boolean onTouch(View v, MotionEvent event) {
        if (this.mVelocityTracker == null) {
            this.mVelocityTracker = VelocityTracker.obtain();
        }
        this.mVelocityTracker.addMovement(event);
        if (event.getActionMasked() == 3 && this.mVelocityTracker != null) {
            this.mVelocityTracker.recycle();
            this.mVelocityTracker = null;
        }
        if (this.mTouchMode == 0) {
            this.mGestureDetector.onTouchEvent(event);
        }
        if (!((BarLineChartBase) this.mChart).isDragEnabled() && !((BarLineChartBase) this.mChart).isScaleXEnabled() && !((BarLineChartBase) this.mChart).isScaleYEnabled()) {
            return true;
        }
        switch (event.getAction() & 255) {
            case BuildConfig.DEBUG /* 0 */:
                startAction(event);
                stopDeceleration();
                saveTouchStart(event);
                break;
            case BuildConfig.VERSION_CODE /* 1 */:
                VelocityTracker velocityTracker = this.mVelocityTracker;
                int pointerId = event.getPointerId(0);
                velocityTracker.computeCurrentVelocity(1000, Utils.getMaximumFlingVelocity());
                float velocityY = velocityTracker.getYVelocity(pointerId);
                float velocityX = velocityTracker.getXVelocity(pointerId);
                if ((Math.abs(velocityX) > Utils.getMinimumFlingVelocity() || Math.abs(velocityY) > Utils.getMinimumFlingVelocity()) && this.mTouchMode == 1 && ((BarLineChartBase) this.mChart).isDragDecelerationEnabled()) {
                    stopDeceleration();
                    this.mDecelerationLastTime = AnimationUtils.currentAnimationTimeMillis();
                    this.mDecelerationCurrentPoint = new PointF(event.getX(), event.getY());
                    this.mDecelerationVelocity = new PointF(velocityX, velocityY);
                    Utils.postInvalidateOnAnimation(this.mChart);
                }
                if (this.mTouchMode == 2 || this.mTouchMode == 3 || this.mTouchMode == 4 || this.mTouchMode == 5) {
                    ((BarLineChartBase) this.mChart).calculateOffsets();
                    ((BarLineChartBase) this.mChart).postInvalidate();
                }
                this.mTouchMode = 0;
                ((BarLineChartBase) this.mChart).enableScroll();
                if (this.mVelocityTracker != null) {
                    this.mVelocityTracker.recycle();
                    this.mVelocityTracker = null;
                }
                endAction(event);
                break;
            case 2:
                if (this.mTouchMode == 1) {
                    ((BarLineChartBase) this.mChart).disableScroll();
                    performDrag(event);
                    break;
                } else if (this.mTouchMode == 2 || this.mTouchMode == 3 || this.mTouchMode == 4) {
                    ((BarLineChartBase) this.mChart).disableScroll();
                    if (((BarLineChartBase) this.mChart).isScaleXEnabled() || ((BarLineChartBase) this.mChart).isScaleYEnabled()) {
                        performZoom(event);
                        break;
                    }
                } else if (this.mTouchMode == 0 && Math.abs(distance(event.getX(), this.mTouchStartPoint.x, event.getY(), this.mTouchStartPoint.y)) > this.mDragTriggerDist) {
                    if (((BarLineChartBase) this.mChart).hasNoDragOffset()) {
                        if (!((BarLineChartBase) this.mChart).isFullyZoomedOut() && ((BarLineChartBase) this.mChart).isDragEnabled()) {
                            this.mTouchMode = 1;
                            break;
                        } else {
                            this.mLastGesture = ChartTouchListener.ChartGesture.DRAG;
                            if (((BarLineChartBase) this.mChart).isHighlightPerDragEnabled()) {
                                performHighlightDrag(event);
                                break;
                            }
                        }
                    } else if (((BarLineChartBase) this.mChart).isDragEnabled()) {
                        this.mLastGesture = ChartTouchListener.ChartGesture.DRAG;
                        this.mTouchMode = 1;
                        break;
                    }
                }
                break;
            case 3:
                this.mTouchMode = 0;
                endAction(event);
                break;
            case 5:
                if (event.getPointerCount() >= 2) {
                    ((BarLineChartBase) this.mChart).disableScroll();
                    saveTouchStart(event);
                    this.mSavedXDist = getXDist(event);
                    this.mSavedYDist = getYDist(event);
                    this.mSavedDist = spacing(event);
                    if (this.mSavedDist > 10.0f) {
                        if (((BarLineChartBase) this.mChart).isPinchZoomEnabled()) {
                            this.mTouchMode = 4;
                        } else if (this.mSavedXDist > this.mSavedYDist) {
                            this.mTouchMode = 2;
                        } else {
                            this.mTouchMode = 3;
                        }
                    }
                    midPoint(this.mTouchPointCenter, event);
                    break;
                }
                break;
            case 6:
                Utils.velocityTrackerPointerUpCleanUpIfNecessary(event, this.mVelocityTracker);
                this.mTouchMode = 5;
                break;
        }
        this.mMatrix = ((BarLineChartBase) this.mChart).getViewPortHandler().refresh(this.mMatrix, this.mChart, true);
        return true;
    }

    private void saveTouchStart(MotionEvent event) {
        this.mSavedMatrix.set(this.mMatrix);
        this.mTouchStartPoint.set(event.getX(), event.getY());
        this.mClosestDataSetToTouch = ((BarLineChartBase) this.mChart).getDataSetByTouchPoint(event.getX(), event.getY());
    }

    private void performDrag(MotionEvent event) {
        float dX;
        float dY;
        this.mLastGesture = ChartTouchListener.ChartGesture.DRAG;
        this.mMatrix.set(this.mSavedMatrix);
        OnChartGestureListener l = ((BarLineChartBase) this.mChart).getOnChartGestureListener();
        if (((BarLineChartBase) this.mChart).isAnyAxisInverted() && this.mClosestDataSetToTouch != null && ((BarLineChartBase) this.mChart).getAxis(this.mClosestDataSetToTouch.getAxisDependency()).isInverted()) {
            if (this.mChart instanceof HorizontalBarChart) {
                dX = -(event.getX() - this.mTouchStartPoint.x);
                dY = event.getY() - this.mTouchStartPoint.y;
            } else {
                dX = event.getX() - this.mTouchStartPoint.x;
                dY = -(event.getY() - this.mTouchStartPoint.y);
            }
        } else {
            dX = event.getX() - this.mTouchStartPoint.x;
            dY = event.getY() - this.mTouchStartPoint.y;
        }
        this.mMatrix.postTranslate(dX, dY);
        if (l != null) {
            l.onChartTranslate(event, dX, dY);
        }
    }

    private void performZoom(MotionEvent event) {
        if (event.getPointerCount() >= 2) {
            OnChartGestureListener l = ((BarLineChartBase) this.mChart).getOnChartGestureListener();
            float totalDist = spacing(event);
            if (totalDist > this.mMinScalePointerDistance) {
                PointF t = getTrans(this.mTouchPointCenter.x, this.mTouchPointCenter.y);
                ViewPortHandler h = ((BarLineChartBase) this.mChart).getViewPortHandler();
                if (this.mTouchMode == 4) {
                    this.mLastGesture = ChartTouchListener.ChartGesture.PINCH_ZOOM;
                    float scale = totalDist / this.mSavedDist;
                    boolean isZoomingOut = scale < 1.0f;
                    boolean canZoomMoreX = isZoomingOut ? h.canZoomOutMoreX() : h.canZoomInMoreX();
                    boolean canZoomMoreY = isZoomingOut ? h.canZoomOutMoreY() : h.canZoomInMoreY();
                    float scaleX = ((BarLineChartBase) this.mChart).isScaleXEnabled() ? scale : 1.0f;
                    float scaleY = ((BarLineChartBase) this.mChart).isScaleYEnabled() ? scale : 1.0f;
                    if (canZoomMoreY || canZoomMoreX) {
                        this.mMatrix.set(this.mSavedMatrix);
                        this.mMatrix.postScale(scaleX, scaleY, t.x, t.y);
                        if (l != null) {
                            l.onChartScale(event, scaleX, scaleY);
                            return;
                        }
                        return;
                    }
                    return;
                }
                if (this.mTouchMode == 2 && ((BarLineChartBase) this.mChart).isScaleXEnabled()) {
                    this.mLastGesture = ChartTouchListener.ChartGesture.X_ZOOM;
                    float xDist = getXDist(event);
                    float scaleX2 = xDist / this.mSavedXDist;
                    boolean isZoomingOut2 = scaleX2 < 1.0f;
                    boolean canZoomMoreX2 = isZoomingOut2 ? h.canZoomOutMoreX() : h.canZoomInMoreX();
                    if (canZoomMoreX2) {
                        this.mMatrix.set(this.mSavedMatrix);
                        this.mMatrix.postScale(scaleX2, 1.0f, t.x, t.y);
                        if (l != null) {
                            l.onChartScale(event, scaleX2, 1.0f);
                            return;
                        }
                        return;
                    }
                    return;
                }
                if (this.mTouchMode == 3 && ((BarLineChartBase) this.mChart).isScaleYEnabled()) {
                    this.mLastGesture = ChartTouchListener.ChartGesture.Y_ZOOM;
                    float yDist = getYDist(event);
                    float scaleY2 = yDist / this.mSavedYDist;
                    boolean isZoomingOut3 = scaleY2 < 1.0f;
                    boolean canZoomMoreY2 = isZoomingOut3 ? h.canZoomOutMoreY() : h.canZoomInMoreY();
                    if (canZoomMoreY2) {
                        this.mMatrix.set(this.mSavedMatrix);
                        this.mMatrix.postScale(1.0f, scaleY2, t.x, t.y);
                        if (l != null) {
                            l.onChartScale(event, 1.0f, scaleY2);
                        }
                    }
                }
            }
        }
    }

    private void performHighlightDrag(MotionEvent e) {
        Highlight h = ((BarLineChartBase) this.mChart).getHighlightByTouchPoint(e.getX(), e.getY());
        if (h != null && !h.equalTo(this.mLastHighlighted)) {
            this.mLastHighlighted = h;
            ((BarLineChartBase) this.mChart).highlightValue(h, true);
        }
    }

    private static void midPoint(PointF point, MotionEvent event) {
        float x = event.getX(0) + event.getX(1);
        float y = event.getY(0) + event.getY(1);
        point.set(x / 2.0f, y / 2.0f);
    }

    private static float spacing(MotionEvent event) {
        float x = event.getX(0) - event.getX(1);
        float y = event.getY(0) - event.getY(1);
        return (float) Math.sqrt((x * x) + (y * y));
    }

    private static float getXDist(MotionEvent e) {
        float x = Math.abs(e.getX(0) - e.getX(1));
        return x;
    }

    private static float getYDist(MotionEvent e) {
        float y = Math.abs(e.getY(0) - e.getY(1));
        return y;
    }

    public PointF getTrans(float x, float y) {
        float yTrans;
        ViewPortHandler vph = ((BarLineChartBase) this.mChart).getViewPortHandler();
        float xTrans = x - vph.offsetLeft();
        if (((BarLineChartBase) this.mChart).isAnyAxisInverted() && this.mClosestDataSetToTouch != null && ((BarLineChartBase) this.mChart).isInverted(this.mClosestDataSetToTouch.getAxisDependency())) {
            yTrans = -(y - vph.offsetTop());
        } else {
            yTrans = -((((BarLineChartBase) this.mChart).getMeasuredHeight() - y) - vph.offsetBottom());
        }
        return new PointF(xTrans, yTrans);
    }

    public Matrix getMatrix() {
        return this.mMatrix;
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnDoubleTapListener
    public boolean onDoubleTap(MotionEvent e) {
        this.mLastGesture = ChartTouchListener.ChartGesture.DOUBLE_TAP;
        OnChartGestureListener l = ((BarLineChartBase) this.mChart).getOnChartGestureListener();
        if (l != null) {
            l.onChartDoubleTapped(e);
        }
        if (((BarLineChartBase) this.mChart).isDoubleTapToZoomEnabled()) {
            PointF trans = getTrans(e.getX(), e.getY());
            ((BarLineChartBase) this.mChart).zoom(((BarLineChartBase) this.mChart).isScaleXEnabled() ? 1.4f : 1.0f, ((BarLineChartBase) this.mChart).isScaleYEnabled() ? 1.4f : 1.0f, trans.x, trans.y);
            if (((BarLineChartBase) this.mChart).isLogEnabled()) {
                Log.i("BarlineChartTouch", "Double-Tap, Zooming In, x: " + trans.x + ", y: " + trans.y);
            }
        }
        return super.onDoubleTap(e);
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
    public void onLongPress(MotionEvent e) {
        this.mLastGesture = ChartTouchListener.ChartGesture.LONG_PRESS;
        OnChartGestureListener l = ((BarLineChartBase) this.mChart).getOnChartGestureListener();
        if (l != null) {
            l.onChartLongPressed(e);
        }
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
    public boolean onSingleTapUp(MotionEvent e) {
        this.mLastGesture = ChartTouchListener.ChartGesture.SINGLE_TAP;
        OnChartGestureListener l = ((BarLineChartBase) this.mChart).getOnChartGestureListener();
        if (l != null) {
            l.onChartSingleTapped(e);
        }
        if (!((BarLineChartBase) this.mChart).isHighlightPerTapEnabled()) {
            return false;
        }
        Highlight h = ((BarLineChartBase) this.mChart).getHighlightByTouchPoint(e.getX(), e.getY());
        performHighlight(h, e);
        return super.onSingleTapUp(e);
    }

    @Override // android.view.GestureDetector.SimpleOnGestureListener, android.view.GestureDetector.OnGestureListener
    public boolean onFling(MotionEvent e1, MotionEvent e2, float velocityX, float velocityY) {
        this.mLastGesture = ChartTouchListener.ChartGesture.FLING;
        OnChartGestureListener l = ((BarLineChartBase) this.mChart).getOnChartGestureListener();
        if (l != null) {
            l.onChartFling(e1, e2, velocityX, velocityY);
        }
        return super.onFling(e1, e2, velocityX, velocityY);
    }

    public void stopDeceleration() {
        this.mDecelerationVelocity = new PointF(0.0f, 0.0f);
    }

    public void computeScroll() {
        if (this.mDecelerationVelocity.x == 0.0f && this.mDecelerationVelocity.y == 0.0f) {
            return;
        }
        long currentTime = AnimationUtils.currentAnimationTimeMillis();
        this.mDecelerationVelocity.x *= ((BarLineChartBase) this.mChart).getDragDecelerationFrictionCoef();
        this.mDecelerationVelocity.y *= ((BarLineChartBase) this.mChart).getDragDecelerationFrictionCoef();
        float timeInterval = (currentTime - this.mDecelerationLastTime) / 1000.0f;
        float distanceX = this.mDecelerationVelocity.x * timeInterval;
        float distanceY = this.mDecelerationVelocity.y * timeInterval;
        this.mDecelerationCurrentPoint.x += distanceX;
        this.mDecelerationCurrentPoint.y += distanceY;
        MotionEvent event = MotionEvent.obtain(currentTime, currentTime, 2, this.mDecelerationCurrentPoint.x, this.mDecelerationCurrentPoint.y, 0);
        performDrag(event);
        event.recycle();
        this.mMatrix = ((BarLineChartBase) this.mChart).getViewPortHandler().refresh(this.mMatrix, this.mChart, false);
        this.mDecelerationLastTime = currentTime;
        if (Math.abs(this.mDecelerationVelocity.x) >= 0.01d || Math.abs(this.mDecelerationVelocity.y) >= 0.01d) {
            Utils.postInvalidateOnAnimation(this.mChart);
            return;
        }
        ((BarLineChartBase) this.mChart).calculateOffsets();
        ((BarLineChartBase) this.mChart).postInvalidate();
        stopDeceleration();
    }
}
