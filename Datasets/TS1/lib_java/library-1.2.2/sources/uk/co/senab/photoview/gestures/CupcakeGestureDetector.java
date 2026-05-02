package uk.co.senab.photoview.gestures;

import android.content.Context;
import android.util.FloatMath;
import android.util.Log;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.ViewConfiguration;

/* loaded from: library-1.2.2.jar:uk/co/senab/photoview/gestures/CupcakeGestureDetector.class */
public class CupcakeGestureDetector implements GestureDetector {
    protected OnGestureListener mListener;
    private static final String LOG_TAG = "CupcakeGestureDetector";
    float mLastTouchX;
    float mLastTouchY;
    final float mTouchSlop;
    final float mMinimumVelocity;
    private VelocityTracker mVelocityTracker;
    private boolean mIsDragging;

    @Override // uk.co.senab.photoview.gestures.GestureDetector
    public void setOnGestureListener(OnGestureListener listener) {
        this.mListener = listener;
    }

    public CupcakeGestureDetector(Context context) {
        ViewConfiguration configuration = ViewConfiguration.get(context);
        this.mMinimumVelocity = configuration.getScaledMinimumFlingVelocity();
        this.mTouchSlop = configuration.getScaledTouchSlop();
    }

    float getActiveX(MotionEvent ev) {
        return ev.getX();
    }

    float getActiveY(MotionEvent ev) {
        return ev.getY();
    }

    @Override // uk.co.senab.photoview.gestures.GestureDetector
    public boolean isScaling() {
        return false;
    }

    @Override // uk.co.senab.photoview.gestures.GestureDetector
    public boolean onTouchEvent(MotionEvent ev) {
        switch (ev.getAction()) {
            case 0:
                this.mVelocityTracker = VelocityTracker.obtain();
                if (null != this.mVelocityTracker) {
                    this.mVelocityTracker.addMovement(ev);
                } else {
                    Log.i(LOG_TAG, "Velocity tracker is null");
                }
                this.mLastTouchX = getActiveX(ev);
                this.mLastTouchY = getActiveY(ev);
                this.mIsDragging = false;
                break;
            case 1:
                if (this.mIsDragging && null != this.mVelocityTracker) {
                    this.mLastTouchX = getActiveX(ev);
                    this.mLastTouchY = getActiveY(ev);
                    this.mVelocityTracker.addMovement(ev);
                    this.mVelocityTracker.computeCurrentVelocity(1000);
                    float vX = this.mVelocityTracker.getXVelocity();
                    float vY = this.mVelocityTracker.getYVelocity();
                    if (Math.max(Math.abs(vX), Math.abs(vY)) >= this.mMinimumVelocity) {
                        this.mListener.onFling(this.mLastTouchX, this.mLastTouchY, -vX, -vY);
                    }
                }
                if (null != this.mVelocityTracker) {
                    this.mVelocityTracker.recycle();
                    this.mVelocityTracker = null;
                    break;
                }
                break;
            case 2:
                float x = getActiveX(ev);
                float y = getActiveY(ev);
                float dx = x - this.mLastTouchX;
                float dy = y - this.mLastTouchY;
                if (!this.mIsDragging) {
                    this.mIsDragging = FloatMath.sqrt((dx * dx) + (dy * dy)) >= this.mTouchSlop;
                }
                if (this.mIsDragging) {
                    this.mListener.onDrag(dx, dy);
                    this.mLastTouchX = x;
                    this.mLastTouchY = y;
                    if (null != this.mVelocityTracker) {
                        this.mVelocityTracker.addMovement(ev);
                        break;
                    }
                }
                break;
            case 3:
                if (null != this.mVelocityTracker) {
                    this.mVelocityTracker.recycle();
                    this.mVelocityTracker = null;
                    break;
                }
                break;
        }
        return true;
    }
}
