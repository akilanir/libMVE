package android.support.design.widget;

import android.view.View;
import android.view.ViewOutlineProvider;

/* loaded from: com.android.support.design.23.3.0.jar:android/support/design/widget/ViewUtilsLollipop.class */
class ViewUtilsLollipop {
    ViewUtilsLollipop() {
    }

    static void setBoundsViewOutlineProvider(View view) {
        view.setOutlineProvider(ViewOutlineProvider.BOUNDS);
    }
}
