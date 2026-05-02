package android.support.v4.view;

import android.view.View;

/* loaded from: internal_impl-23.1.1.jar:android/support/v4/view/ViewCompatMarshmallow.class */
class ViewCompatMarshmallow {
    ViewCompatMarshmallow() {
    }

    public static void setScrollIndicators(View view, int indicators) {
        view.setScrollIndicators(indicators);
    }

    public static void setScrollIndicators(View view, int indicators, int mask) {
        view.setScrollIndicators(indicators, mask);
    }

    public static int getScrollIndicators(View view) {
        return view.getScrollIndicators();
    }
}
