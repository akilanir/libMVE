package org.metalev.multitouch.controller;

import android.util.Log;
import android.view.MotionEvent;
import java.lang.reflect.Method;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/metalev/multitouch/controller/MultiTouchController.class */
public class MultiTouchController<T> {
    private static final long EVENT_SETTLE_TIME_INTERVAL = 20;
    private static final float MAX_MULTITOUCH_POS_JUMP_SIZE = 30.0f;
    private static final float MAX_MULTITOUCH_DIM_JUMP_SIZE = 40.0f;
    private static final float MIN_MULTITOUCH_SEPARATION = 30.0f;
    public static final int MAX_TOUCH_POINTS = 20;
    public static final boolean DEBUG = false;
    MultiTouchObjectCanvas<T> objectCanvas;
    private PointInfo mCurrPt;
    private PointInfo mPrevPt;
    private float mCurrPtX;
    private float mCurrPtY;
    private float mCurrPtDiam;
    private float mCurrPtWidth;
    private float mCurrPtHeight;
    private float mCurrPtAng;
    private boolean handleSingleTouchEvents;
    private T selectedObject;
    private PositionAndScale mCurrXform;
    private long mSettleStartTime;
    private long mSettleEndTime;
    private float startPosX;
    private float startPosY;
    private float startScaleOverPinchDiam;
    private float startAngleMinusPinchAngle;
    private float startScaleXOverPinchWidth;
    private float startScaleYOverPinchHeight;
    private static final int MODE_NOTHING = 0;
    private static final int MODE_DRAG = 1;
    private static final int MODE_PINCH = 2;
    private int mMode;
    public static final boolean multiTouchSupported;
    private static Method m_getPointerCount;
    private static Method m_getPointerId;
    private static Method m_getPressure;
    private static Method m_getHistoricalX;
    private static Method m_getHistoricalY;
    private static Method m_getHistoricalPressure;
    private static Method m_getX;
    private static Method m_getY;
    private static int ACTION_POINTER_UP;
    private static int ACTION_POINTER_INDEX_SHIFT;
    private static final float[] xVals;
    private static final float[] yVals;
    private static final float[] pressureVals;
    private static final int[] pointerIds;

    /* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/metalev/multitouch/controller/MultiTouchController$MultiTouchObjectCanvas.class */
    public interface MultiTouchObjectCanvas<T> {
        T getDraggableObjectAtPoint(PointInfo pointInfo);

        void getPositionAndScale(T t, PositionAndScale positionAndScale);

        boolean setPositionAndScale(T t, PositionAndScale positionAndScale, PointInfo pointInfo);

        void selectObject(T t, PointInfo pointInfo);
    }

    private void extractCurrPtInfo() {
        this.mCurrPtX = this.mCurrPt.getX();
        this.mCurrPtY = this.mCurrPt.getY();
        this.mCurrPtDiam = Math.max(21.3f, !this.mCurrXform.updateScale ? 0.0f : this.mCurrPt.getMultiTouchDiameter());
        this.mCurrPtWidth = Math.max(30.0f, !this.mCurrXform.updateScaleXY ? 0.0f : this.mCurrPt.getMultiTouchWidth());
        this.mCurrPtHeight = Math.max(30.0f, !this.mCurrXform.updateScaleXY ? 0.0f : this.mCurrPt.getMultiTouchHeight());
        this.mCurrPtAng = !this.mCurrXform.updateAngle ? 0.0f : this.mCurrPt.getMultiTouchAngle();
    }

    public MultiTouchController(MultiTouchObjectCanvas<T> objectCanvas) {
        this(objectCanvas, true);
    }

    public MultiTouchController(MultiTouchObjectCanvas<T> objectCanvas, boolean handleSingleTouchEvents) {
        this.selectedObject = null;
        this.mCurrXform = new PositionAndScale();
        this.mMode = 0;
        this.mCurrPt = new PointInfo();
        this.mPrevPt = new PointInfo();
        this.handleSingleTouchEvents = handleSingleTouchEvents;
        this.objectCanvas = objectCanvas;
    }

    protected void setHandleSingleTouchEvents(boolean handleSingleTouchEvents) {
        this.handleSingleTouchEvents = handleSingleTouchEvents;
    }

    protected boolean getHandleSingleTouchEvents() {
        return this.handleSingleTouchEvents;
    }

    static {
        ACTION_POINTER_UP = 6;
        ACTION_POINTER_INDEX_SHIFT = 8;
        boolean succeeded = false;
        try {
            m_getPointerCount = MotionEvent.class.getMethod("getPointerCount", new Class[0]);
            m_getPointerId = MotionEvent.class.getMethod("getPointerId", Integer.TYPE);
            m_getPressure = MotionEvent.class.getMethod("getPressure", Integer.TYPE);
            m_getHistoricalX = MotionEvent.class.getMethod("getHistoricalX", Integer.TYPE, Integer.TYPE);
            m_getHistoricalY = MotionEvent.class.getMethod("getHistoricalY", Integer.TYPE, Integer.TYPE);
            m_getHistoricalPressure = MotionEvent.class.getMethod("getHistoricalPressure", Integer.TYPE, Integer.TYPE);
            m_getX = MotionEvent.class.getMethod("getX", Integer.TYPE);
            m_getY = MotionEvent.class.getMethod("getY", Integer.TYPE);
            succeeded = true;
        } catch (Exception e) {
            Log.e("MultiTouchController", "static initializer failed", e);
        }
        multiTouchSupported = succeeded;
        if (multiTouchSupported) {
            try {
                ACTION_POINTER_UP = MotionEvent.class.getField("ACTION_POINTER_UP").getInt(null);
                ACTION_POINTER_INDEX_SHIFT = MotionEvent.class.getField("ACTION_POINTER_INDEX_SHIFT").getInt(null);
            } catch (Exception e2) {
            }
        }
        xVals = new float[20];
        yVals = new float[20];
        pressureVals = new float[20];
        pointerIds = new int[20];
    }

    public boolean onTouchEvent(MotionEvent event) {
        try {
            int pointerCount = multiTouchSupported ? ((Integer) m_getPointerCount.invoke(event, new Object[0])).intValue() : 1;
            if (this.mMode == 0 && !this.handleSingleTouchEvents && pointerCount == 1) {
                return false;
            }
            int action = event.getAction();
            int histLen = event.getHistorySize() / pointerCount;
            int histIdx = 0;
            while (histIdx <= histLen) {
                boolean processingHist = histIdx < histLen;
                if (!multiTouchSupported || pointerCount == 1) {
                    xVals[0] = processingHist ? event.getHistoricalX(histIdx) : event.getX();
                    yVals[0] = processingHist ? event.getHistoricalY(histIdx) : event.getY();
                    pressureVals[0] = processingHist ? event.getHistoricalPressure(histIdx) : event.getPressure();
                } else {
                    int numPointers = Math.min(pointerCount, 20);
                    for (int ptrIdx = 0; ptrIdx < numPointers; ptrIdx++) {
                        int ptrId = ((Integer) m_getPointerId.invoke(event, Integer.valueOf(ptrIdx))).intValue();
                        pointerIds[ptrIdx] = ptrId;
                        xVals[ptrIdx] = ((Float) (processingHist ? m_getHistoricalX.invoke(event, Integer.valueOf(ptrIdx), Integer.valueOf(histIdx)) : m_getX.invoke(event, Integer.valueOf(ptrIdx)))).floatValue();
                        yVals[ptrIdx] = ((Float) (processingHist ? m_getHistoricalY.invoke(event, Integer.valueOf(ptrIdx), Integer.valueOf(histIdx)) : m_getY.invoke(event, Integer.valueOf(ptrIdx)))).floatValue();
                        pressureVals[ptrIdx] = ((Float) (processingHist ? m_getHistoricalPressure.invoke(event, Integer.valueOf(ptrIdx), Integer.valueOf(histIdx)) : m_getPressure.invoke(event, Integer.valueOf(ptrIdx)))).floatValue();
                    }
                }
                decodeTouchEvent(pointerCount, xVals, yVals, pressureVals, pointerIds, processingHist ? 2 : action, processingHist ? true : (action == 1 || (action & ((1 << ACTION_POINTER_INDEX_SHIFT) - 1)) == ACTION_POINTER_UP || action == 3) ? false : true, processingHist ? event.getHistoricalEventTime(histIdx) : event.getEventTime());
                histIdx++;
            }
            return true;
        } catch (Exception e) {
            Log.e("MultiTouchController", "onTouchEvent() failed", e);
            return false;
        }
    }

    private void decodeTouchEvent(int pointerCount, float[] x, float[] y, float[] pressure, int[] pointerIds2, int action, boolean down, long eventTime) {
        PointInfo tmp = this.mPrevPt;
        this.mPrevPt = this.mCurrPt;
        this.mCurrPt = tmp;
        this.mCurrPt.set(pointerCount, x, y, pressure, pointerIds2, action, down, eventTime);
        multiTouchController();
    }

    private void anchorAtThisPositionAndScale() {
        if (this.selectedObject == null) {
            return;
        }
        this.objectCanvas.getPositionAndScale(this.selectedObject, this.mCurrXform);
        float f = (this.mCurrXform.updateScale && this.mCurrXform.scale != 0.0f) ? this.mCurrXform.scale : 1.0f;
        float currScaleInv = 1.0f / f;
        extractCurrPtInfo();
        this.startPosX = (this.mCurrPtX - this.mCurrXform.xOff) * currScaleInv;
        this.startPosY = (this.mCurrPtY - this.mCurrXform.yOff) * currScaleInv;
        this.startScaleOverPinchDiam = this.mCurrXform.scale / this.mCurrPtDiam;
        this.startScaleXOverPinchWidth = this.mCurrXform.scaleX / this.mCurrPtWidth;
        this.startScaleYOverPinchHeight = this.mCurrXform.scaleY / this.mCurrPtHeight;
        this.startAngleMinusPinchAngle = this.mCurrXform.angle - this.mCurrPtAng;
    }

    private void performDragOrPinch() {
        if (this.selectedObject == null) {
            return;
        }
        float f = (this.mCurrXform.updateScale && this.mCurrXform.scale != 0.0f) ? this.mCurrXform.scale : 1.0f;
        float currScale = f;
        extractCurrPtInfo();
        float newPosX = this.mCurrPtX - (this.startPosX * currScale);
        float newPosY = this.mCurrPtY - (this.startPosY * currScale);
        float newScale = this.startScaleOverPinchDiam * this.mCurrPtDiam;
        float newScaleX = this.startScaleXOverPinchWidth * this.mCurrPtWidth;
        float newScaleY = this.startScaleYOverPinchHeight * this.mCurrPtHeight;
        float newAngle = this.startAngleMinusPinchAngle + this.mCurrPtAng;
        this.mCurrXform.set(newPosX, newPosY, newScale, newScaleX, newScaleY, newAngle);
        boolean success = this.objectCanvas.setPositionAndScale(this.selectedObject, this.mCurrXform, this.mCurrPt);
        if (!success) {
        }
    }

    public boolean isPinching() {
        return this.mMode == 2;
    }

    private void multiTouchController() {
        switch (this.mMode) {
            case 0:
                if (this.mCurrPt.isDown()) {
                    this.selectedObject = this.objectCanvas.getDraggableObjectAtPoint(this.mCurrPt);
                    if (this.selectedObject != null) {
                        this.mMode = 1;
                        this.objectCanvas.selectObject(this.selectedObject, this.mCurrPt);
                        anchorAtThisPositionAndScale();
                        long eventTime = this.mCurrPt.getEventTime();
                        this.mSettleEndTime = eventTime;
                        this.mSettleStartTime = eventTime;
                        break;
                    }
                }
                break;
            case 1:
                if (!this.mCurrPt.isDown()) {
                    this.mMode = 0;
                    MultiTouchObjectCanvas<T> multiTouchObjectCanvas = this.objectCanvas;
                    this.selectedObject = null;
                    multiTouchObjectCanvas.selectObject(null, this.mCurrPt);
                    break;
                } else if (!this.mCurrPt.isMultiTouch()) {
                    if (this.mCurrPt.getEventTime() < this.mSettleEndTime) {
                        anchorAtThisPositionAndScale();
                        break;
                    } else {
                        performDragOrPinch();
                        break;
                    }
                } else {
                    this.mMode = 2;
                    anchorAtThisPositionAndScale();
                    this.mSettleStartTime = this.mCurrPt.getEventTime();
                    this.mSettleEndTime = this.mSettleStartTime + EVENT_SETTLE_TIME_INTERVAL;
                    break;
                }
            case 2:
                if (!this.mCurrPt.isMultiTouch() || !this.mCurrPt.isDown()) {
                    if (!this.mCurrPt.isDown()) {
                        this.mMode = 0;
                        MultiTouchObjectCanvas<T> multiTouchObjectCanvas2 = this.objectCanvas;
                        this.selectedObject = null;
                        multiTouchObjectCanvas2.selectObject(null, this.mCurrPt);
                        break;
                    } else {
                        this.mMode = 1;
                        anchorAtThisPositionAndScale();
                        this.mSettleStartTime = this.mCurrPt.getEventTime();
                        this.mSettleEndTime = this.mSettleStartTime + EVENT_SETTLE_TIME_INTERVAL;
                        break;
                    }
                } else if (Math.abs(this.mCurrPt.getX() - this.mPrevPt.getX()) <= 30.0f && Math.abs(this.mCurrPt.getY() - this.mPrevPt.getY()) <= 30.0f && Math.abs(this.mCurrPt.getMultiTouchWidth() - this.mPrevPt.getMultiTouchWidth()) * 0.5f <= MAX_MULTITOUCH_DIM_JUMP_SIZE && Math.abs(this.mCurrPt.getMultiTouchHeight() - this.mPrevPt.getMultiTouchHeight()) * 0.5f <= MAX_MULTITOUCH_DIM_JUMP_SIZE) {
                    if (this.mCurrPt.eventTime < this.mSettleEndTime) {
                        anchorAtThisPositionAndScale();
                        break;
                    } else {
                        performDragOrPinch();
                        break;
                    }
                } else {
                    anchorAtThisPositionAndScale();
                    this.mSettleStartTime = this.mCurrPt.getEventTime();
                    this.mSettleEndTime = this.mSettleStartTime + EVENT_SETTLE_TIME_INTERVAL;
                    break;
                }
                break;
        }
    }

    public int getMode() {
        return this.mMode;
    }

    /* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/metalev/multitouch/controller/MultiTouchController$PointInfo.class */
    public static class PointInfo {
        private int numPoints;
        private float[] xs = new float[20];
        private float[] ys = new float[20];
        private float[] pressures = new float[20];
        private int[] pointerIds = new int[20];
        private float xMid;
        private float yMid;
        private float pressureMid;
        private float dx;
        private float dy;
        private float diameter;
        private float diameterSq;
        private float angle;
        private boolean isDown;
        private boolean isMultiTouch;
        private boolean diameterSqIsCalculated;
        private boolean diameterIsCalculated;
        private boolean angleIsCalculated;
        private int action;
        private long eventTime;

        /* JADX INFO: Access modifiers changed from: private */
        public void set(int numPoints, float[] x, float[] y, float[] pressure, int[] pointerIds, int action, boolean isDown, long eventTime) {
            this.eventTime = eventTime;
            this.action = action;
            this.numPoints = numPoints;
            for (int i = 0; i < numPoints; i++) {
                this.xs[i] = x[i];
                this.ys[i] = y[i];
                this.pressures[i] = pressure[i];
                this.pointerIds[i] = pointerIds[i];
            }
            this.isDown = isDown;
            this.isMultiTouch = numPoints >= 2;
            if (this.isMultiTouch) {
                this.xMid = (x[0] + x[1]) * 0.5f;
                this.yMid = (y[0] + y[1]) * 0.5f;
                this.pressureMid = (pressure[0] + pressure[1]) * 0.5f;
                this.dx = Math.abs(x[1] - x[0]);
                this.dy = Math.abs(y[1] - y[0]);
            } else {
                this.xMid = x[0];
                this.yMid = y[0];
                this.pressureMid = pressure[0];
                this.dy = 0.0f;
                this.dx = 0.0f;
            }
            this.angleIsCalculated = false;
            this.diameterIsCalculated = false;
            this.diameterSqIsCalculated = false;
        }

        public void set(PointInfo other) {
            this.numPoints = other.numPoints;
            for (int i = 0; i < this.numPoints; i++) {
                this.xs[i] = other.xs[i];
                this.ys[i] = other.ys[i];
                this.pressures[i] = other.pressures[i];
                this.pointerIds[i] = other.pointerIds[i];
            }
            this.xMid = other.xMid;
            this.yMid = other.yMid;
            this.pressureMid = other.pressureMid;
            this.dx = other.dx;
            this.dy = other.dy;
            this.diameter = other.diameter;
            this.diameterSq = other.diameterSq;
            this.angle = other.angle;
            this.isDown = other.isDown;
            this.action = other.action;
            this.isMultiTouch = other.isMultiTouch;
            this.diameterIsCalculated = other.diameterIsCalculated;
            this.diameterSqIsCalculated = other.diameterSqIsCalculated;
            this.angleIsCalculated = other.angleIsCalculated;
            this.eventTime = other.eventTime;
        }

        public boolean isMultiTouch() {
            return this.isMultiTouch;
        }

        public float getMultiTouchWidth() {
            if (this.isMultiTouch) {
                return this.dx;
            }
            return 0.0f;
        }

        public float getMultiTouchHeight() {
            if (this.isMultiTouch) {
                return this.dy;
            }
            return 0.0f;
        }

        private int julery_isqrt(int val) {
            int i;
            int g = 0;
            int b = 32768;
            int bshft = 15;
            do {
                int i2 = bshft;
                bshft--;
                int temp = ((g << 1) + b) << i2;
                if (val >= temp) {
                    g += b;
                    val -= temp;
                }
                i = b >> 1;
                b = i;
            } while (i > 0);
            return g;
        }

        public float getMultiTouchDiameterSq() {
            if (!this.diameterSqIsCalculated) {
                this.diameterSq = this.isMultiTouch ? (this.dx * this.dx) + (this.dy * this.dy) : 0.0f;
                this.diameterSqIsCalculated = true;
            }
            return this.diameterSq;
        }

        public float getMultiTouchDiameter() {
            if (!this.diameterIsCalculated) {
                if (!this.isMultiTouch) {
                    this.diameter = 0.0f;
                } else {
                    float diamSq = getMultiTouchDiameterSq();
                    this.diameter = diamSq == 0.0f ? 0.0f : julery_isqrt((int) (256.0f * diamSq)) / 16.0f;
                    if (this.diameter < this.dx) {
                        this.diameter = this.dx;
                    }
                    if (this.diameter < this.dy) {
                        this.diameter = this.dy;
                    }
                }
                this.diameterIsCalculated = true;
            }
            return this.diameter;
        }

        public float getMultiTouchAngle() {
            if (!this.angleIsCalculated) {
                if (!this.isMultiTouch) {
                    this.angle = 0.0f;
                } else {
                    this.angle = (float) Math.atan2(this.ys[1] - this.ys[0], this.xs[1] - this.xs[0]);
                }
                this.angleIsCalculated = true;
            }
            return this.angle;
        }

        public int getNumTouchPoints() {
            return this.numPoints;
        }

        public float getX() {
            return this.xMid;
        }

        public float[] getXs() {
            return this.xs;
        }

        public float getY() {
            return this.yMid;
        }

        public float[] getYs() {
            return this.ys;
        }

        public int[] getPointerIds() {
            return this.pointerIds;
        }

        public float getPressure() {
            return this.pressureMid;
        }

        public float[] getPressures() {
            return this.pressures;
        }

        public boolean isDown() {
            return this.isDown;
        }

        public int getAction() {
            return this.action;
        }

        public long getEventTime() {
            return this.eventTime;
        }
    }

    /* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/metalev/multitouch/controller/MultiTouchController$PositionAndScale.class */
    public static class PositionAndScale {
        private float xOff;
        private float yOff;
        private float scale;
        private float scaleX;
        private float scaleY;
        private float angle;
        private boolean updateScale;
        private boolean updateScaleXY;
        private boolean updateAngle;

        public void set(float xOff, float yOff, boolean updateScale, float scale, boolean updateScaleXY, float scaleX, float scaleY, boolean updateAngle, float angle) {
            this.xOff = xOff;
            this.yOff = yOff;
            this.updateScale = updateScale;
            this.scale = scale == 0.0f ? 1.0f : scale;
            this.updateScaleXY = updateScaleXY;
            this.scaleX = scaleX == 0.0f ? 1.0f : scaleX;
            this.scaleY = scaleY == 0.0f ? 1.0f : scaleY;
            this.updateAngle = updateAngle;
            this.angle = angle;
        }

        protected void set(float xOff, float yOff, float scale, float scaleX, float scaleY, float angle) {
            this.xOff = xOff;
            this.yOff = yOff;
            this.scale = scale == 0.0f ? 1.0f : scale;
            this.scaleX = scaleX == 0.0f ? 1.0f : scaleX;
            this.scaleY = scaleY == 0.0f ? 1.0f : scaleY;
            this.angle = angle;
        }

        public float getXOff() {
            return this.xOff;
        }

        public float getYOff() {
            return this.yOff;
        }

        public float getScale() {
            if (this.updateScale) {
                return this.scale;
            }
            return 1.0f;
        }

        public float getScaleX() {
            if (this.updateScaleXY) {
                return this.scaleX;
            }
            return 1.0f;
        }

        public float getScaleY() {
            if (this.updateScaleXY) {
                return this.scaleY;
            }
            return 1.0f;
        }

        public float getAngle() {
            if (this.updateAngle) {
                return this.angle;
            }
            return 0.0f;
        }
    }
}
