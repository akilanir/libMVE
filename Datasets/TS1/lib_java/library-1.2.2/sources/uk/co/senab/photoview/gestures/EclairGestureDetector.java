package uk.co.senab.photoview.gestures;

import android.annotation.TargetApi;
import android.content.Context;
import android.view.MotionEvent;
import uk.co.senab.photoview.Compat;

@TargetApi(5)
/* loaded from: library-1.2.2.jar:uk/co/senab/photoview/gestures/EclairGestureDetector.class */
public class EclairGestureDetector extends CupcakeGestureDetector {
    private static final int INVALID_POINTER_ID = -1;
    private int mActivePointerId;
    private int mActivePointerIndex;

    public EclairGestureDetector(Context context) {
        super(context);
        this.mActivePointerId = INVALID_POINTER_ID;
        this.mActivePointerIndex = 0;
    }

    @Override // uk.co.senab.photoview.gestures.CupcakeGestureDetector
    float getActiveX(MotionEvent ev) {
        try {
            return ev.getX(this.mActivePointerIndex);
        } catch (Exception e) {
            return ev.getX();
        }
    }

    @Override // uk.co.senab.photoview.gestures.CupcakeGestureDetector
    float getActiveY(MotionEvent ev) {
        try {
            return ev.getY(this.mActivePointerIndex);
        } catch (Exception e) {
            return ev.getY();
        }
    }

    @Override // uk.co.senab.photoview.gestures.CupcakeGestureDetector, uk.co.senab.photoview.gestures.GestureDetector
    public boolean onTouchEvent(MotionEvent ev) {
        int action = ev.getAction();
        switch (action & 255) {
            case 0:
                this.mActivePointerId = ev.getPointerId(0);
                break;
            case 1:
            case 3:
                this.mActivePointerId = INVALID_POINTER_ID;
                break;
            case 6:
                int pointerIndex = Compat.getPointerIndex(ev.getAction());
                int pointerId = ev.getPointerId(pointerIndex);
                if (pointerId == this.mActivePointerId) {
                    int newPointerIndex = pointerIndex == 0 ? 1 : 0;
                    this.mActivePointerId = ev.getPointerId(newPointerIndex);
                    this.mLastTouchX = ev.getX(newPointerIndex);
                    this.mLastTouchY = ev.getY(newPointerIndex);
                    break;
                }
                break;
        }
        this.mActivePointerIndex = ev.findPointerIndex(this.mActivePointerId != INVALID_POINTER_ID ? this.mActivePointerId : 0);
        return super.onTouchEvent(ev);
    }
}
