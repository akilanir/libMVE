package android.support.v4.widget;

import android.widget.OverScroller;

/* loaded from: internal_impl-22.1.1.jar:android/support/v4/widget/ScrollerCompatIcs.class */
class ScrollerCompatIcs {
    ScrollerCompatIcs() {
    }

    public static float getCurrVelocity(Object scroller) {
        return ((OverScroller) scroller).getCurrVelocity();
    }
}
