package uk.co.senab.photoview.gestures;

import android.view.MotionEvent;

/* loaded from: com.github.chrisbanes.PhotoView.1.2.6.jar:uk/co/senab/photoview/gestures/GestureDetector.class */
public interface GestureDetector {
    boolean onTouchEvent(MotionEvent motionEvent);

    boolean isScaling();

    boolean isDragging();

    void setOnGestureListener(OnGestureListener onGestureListener);
}
