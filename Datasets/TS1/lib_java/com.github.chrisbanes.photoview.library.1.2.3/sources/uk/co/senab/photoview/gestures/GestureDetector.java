package uk.co.senab.photoview.gestures;

import android.view.MotionEvent;

/* loaded from: com.github.chrisbanes.photoview.library.1.2.3.jar:uk/co/senab/photoview/gestures/GestureDetector.class */
public interface GestureDetector {
    boolean onTouchEvent(MotionEvent motionEvent);

    boolean isScaling();

    void setOnGestureListener(OnGestureListener onGestureListener);
}
