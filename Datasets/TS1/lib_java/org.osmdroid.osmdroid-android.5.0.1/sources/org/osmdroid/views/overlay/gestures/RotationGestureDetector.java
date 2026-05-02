package org.osmdroid.views.overlay.gestures;

import android.view.MotionEvent;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/views/overlay/gestures/RotationGestureDetector.class */
public class RotationGestureDetector {
    protected float mRotation;
    private RotationListener mListener;

    /* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/views/overlay/gestures/RotationGestureDetector$RotationListener.class */
    public interface RotationListener {
        void onRotate(float f);
    }

    public RotationGestureDetector(RotationListener listener) {
        this.mListener = listener;
    }

    private static float rotation(MotionEvent event) {
        double delta_x = event.getX(0) - event.getX(1);
        double delta_y = event.getY(0) - event.getY(1);
        double radians = Math.atan2(delta_y, delta_x);
        return (float) Math.toDegrees(radians);
    }

    public void onTouch(MotionEvent e) {
        if (e.getPointerCount() != 2) {
            return;
        }
        if (e.getActionMasked() == 5) {
            this.mRotation = rotation(e);
        }
        float rotation = rotation(e);
        float delta = rotation - this.mRotation;
        this.mRotation += delta;
        this.mListener.onRotate(delta);
    }
}
