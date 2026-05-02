package android.support.v4.view;

import android.view.ViewGroup;

/* loaded from: internal_impl-22.2.1.jar:android/support/v4/view/ViewGroupCompatHC.class */
class ViewGroupCompatHC {
    private ViewGroupCompatHC() {
    }

    public static void setMotionEventSplittingEnabled(ViewGroup group, boolean split) {
        group.setMotionEventSplittingEnabled(split);
    }
}
