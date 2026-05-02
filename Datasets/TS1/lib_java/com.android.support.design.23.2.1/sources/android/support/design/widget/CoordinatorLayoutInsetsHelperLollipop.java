package android.support.design.widget;

import android.support.v4.view.OnApplyWindowInsetsListener;
import android.support.v4.view.ViewCompat;
import android.view.View;

/* loaded from: com.android.support.design.23.2.1.jar:android/support/design/widget/CoordinatorLayoutInsetsHelperLollipop.class */
class CoordinatorLayoutInsetsHelperLollipop implements CoordinatorLayoutInsetsHelper {
    CoordinatorLayoutInsetsHelperLollipop() {
    }

    @Override // android.support.design.widget.CoordinatorLayoutInsetsHelper
    public void setupForWindowInsets(View view, OnApplyWindowInsetsListener insetsListener) {
        if (ViewCompat.getFitsSystemWindows(view)) {
            ViewCompat.setOnApplyWindowInsetsListener(view, insetsListener);
            view.setSystemUiVisibility(1280);
        }
    }
}
