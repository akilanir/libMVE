package android.support.v4.widget;

import android.view.View;
import android.widget.ListPopupWindow;

/* loaded from: internal_impl-21.0.2.jar:android/support/v4/widget/ListPopupWindowCompatKitKat.class */
class ListPopupWindowCompatKitKat {
    ListPopupWindowCompatKitKat() {
    }

    public static View.OnTouchListener createDragToOpenListener(Object listPopupWindow, View src) {
        return ((ListPopupWindow) listPopupWindow).createDragToOpenListener(src);
    }
}
