package android.support.v4.widget;

import android.view.View;
import android.widget.PopupWindow;

/* loaded from: internal_impl-21.0.2.jar:android/support/v4/widget/PopupWindowCompatKitKat.class */
class PopupWindowCompatKitKat {
    PopupWindowCompatKitKat() {
    }

    public static void showAsDropDown(PopupWindow popup, View anchor, int xoff, int yoff, int gravity) {
        popup.showAsDropDown(anchor, xoff, yoff, gravity);
    }
}
