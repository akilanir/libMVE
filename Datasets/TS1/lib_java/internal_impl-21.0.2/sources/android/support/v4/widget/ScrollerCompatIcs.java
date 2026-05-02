package android.support.v4.widget;

import android.widget.OverScroller;

/* loaded from: internal_impl-21.0.2.jar:android/support/v4/widget/ScrollerCompatIcs.class */
class ScrollerCompatIcs {
    ScrollerCompatIcs() {
    }

    public static float getCurrVelocity(Object scroller) {
        return ((OverScroller) scroller).getCurrVelocity();
    }
}
