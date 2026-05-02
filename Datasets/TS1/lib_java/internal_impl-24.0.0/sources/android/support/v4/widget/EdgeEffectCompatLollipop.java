package android.support.v4.widget;

import android.widget.EdgeEffect;

/* loaded from: internal_impl-24.0.0.jar:android/support/v4/widget/EdgeEffectCompatLollipop.class */
class EdgeEffectCompatLollipop {
    EdgeEffectCompatLollipop() {
    }

    public static boolean onPull(Object edgeEffect, float deltaDistance, float displacement) {
        ((EdgeEffect) edgeEffect).onPull(deltaDistance, displacement);
        return true;
    }
}
