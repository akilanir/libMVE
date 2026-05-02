package android.support.v4.widget;

import android.view.View;
import android.widget.ListPopupWindow;

/* loaded from: support-v4-19.1.0.jar:android/support/v4/widget/ListPopupWindowCompatKitKat.class */
class ListPopupWindowCompatKitKat {
    ListPopupWindowCompatKitKat() {
    }

    public static View.OnTouchListener createDragToOpenListener(Object listPopupWindow, View src) {
        return ((ListPopupWindow) listPopupWindow).createDragToOpenListener(src);
    }
}
