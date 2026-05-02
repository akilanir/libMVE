package android.support.v4.view;

import android.view.PointerIcon;
import android.view.View;

/* loaded from: internal_impl-24.0.0-beta1.jar:android/support/v4/view/ViewCompatApi24.class */
class ViewCompatApi24 {
    ViewCompatApi24() {
    }

    public static void setPointerCapture(View view) {
        view.setPointerCapture();
    }

    public static boolean hasPointerCapture(View view) {
        return view.hasPointerCapture();
    }

    public static void releasePointerCapture(View view) {
        view.releasePointerCapture();
    }

    public static void setPointerIcon(View view, Object pointerIcon) {
        view.setPointerIcon((PointerIcon) pointerIcon);
    }
}
