package android.support.v4.widget;

import android.view.View;
import android.widget.PopupMenu;

/* loaded from: internal_impl-23.4.0.jar:android/support/v4/widget/PopupMenuCompatKitKat.class */
class PopupMenuCompatKitKat {
    PopupMenuCompatKitKat() {
    }

    public static View.OnTouchListener getDragToOpenListener(Object popupMenu) {
        return ((PopupMenu) popupMenu).getDragToOpenListener();
    }
}
