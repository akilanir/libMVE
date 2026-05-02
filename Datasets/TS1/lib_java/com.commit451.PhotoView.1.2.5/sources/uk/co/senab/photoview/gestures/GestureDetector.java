package uk.co.senab.photoview.gestures;

import android.view.MotionEvent;

/* loaded from: com.commit451.PhotoView.1.2.5.jar:uk/co/senab/photoview/gestures/GestureDetector.class */
public interface GestureDetector {
    boolean onTouchEvent(MotionEvent motionEvent);

    boolean isScaling();

    boolean isDragging();

    void setOnGestureListener(OnGestureListener onGestureListener);
}
