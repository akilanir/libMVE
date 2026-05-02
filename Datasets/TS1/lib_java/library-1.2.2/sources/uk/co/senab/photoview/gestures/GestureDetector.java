package uk.co.senab.photoview.gestures;

import android.view.MotionEvent;

/* loaded from: library-1.2.2.jar:uk/co/senab/photoview/gestures/GestureDetector.class */
public interface GestureDetector {
    boolean onTouchEvent(MotionEvent motionEvent);

    boolean isScaling();

    void setOnGestureListener(OnGestureListener onGestureListener);
}
