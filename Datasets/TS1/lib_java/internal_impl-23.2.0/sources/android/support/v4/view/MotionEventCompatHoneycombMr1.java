package android.support.v4.view;

import android.view.MotionEvent;

/* loaded from: internal_impl-23.2.0.jar:android/support/v4/view/MotionEventCompatHoneycombMr1.class */
class MotionEventCompatHoneycombMr1 {
    MotionEventCompatHoneycombMr1() {
    }

    static float getAxisValue(MotionEvent event, int axis) {
        return event.getAxisValue(axis);
    }

    static float getAxisValue(MotionEvent event, int axis, int pointerIndex) {
        return event.getAxisValue(axis, pointerIndex);
    }
}
