package android.support.v4.widget;

import android.os.Build;
import android.view.View;
import android.widget.PopupWindow;

/* loaded from: com.android.support.support-v4.22.2.0.jar:android/support/v4/widget/PopupWindowCompat.class */
public class PopupWindowCompat {
    static final PopupWindowImpl IMPL;

    /* loaded from: com.android.support.support-v4.22.2.0.jar:android/support/v4/widget/PopupWindowCompat$PopupWindowImpl.class */
    interface PopupWindowImpl {
        void showAsDropDown(PopupWindow popupWindow, View view, int i, int i2, int i3);
    }

    /* loaded from: com.android.support.support-v4.22.2.0.jar:android/support/v4/widget/PopupWindowCompat$BasePopupWindowImpl.class */
    static class BasePopupWindowImpl implements PopupWindowImpl {
        BasePopupWindowImpl() {
        }

        @Override // android.support.v4.widget.PopupWindowCompat.PopupWindowImpl
        public void showAsDropDown(PopupWindow popup, View anchor, int xoff, int yoff, int gravity) {
            popup.showAsDropDown(anchor, xoff, yoff);
        }
    }

    /* loaded from: com.android.support.support-v4.22.2.0.jar:android/support/v4/widget/PopupWindowCompat$KitKatPopupWindowImpl.class */
    static class KitKatPopupWindowImpl extends BasePopupWindowImpl {
        KitKatPopupWindowImpl() {
        }

        @Override // android.support.v4.widget.PopupWindowCompat.BasePopupWindowImpl, android.support.v4.widget.PopupWindowCompat.PopupWindowImpl
        public void showAsDropDown(PopupWindow popup, View anchor, int xoff, int yoff, int gravity) {
            PopupWindowCompatKitKat.showAsDropDown(popup, anchor, xoff, yoff, gravity);
        }
    }

    static {
        int version = Build.VERSION.SDK_INT;
        if (version >= 19) {
            IMPL = new KitKatPopupWindowImpl();
        } else {
            IMPL = new BasePopupWindowImpl();
        }
    }

    private PopupWindowCompat() {
    }

    public static void showAsDropDown(PopupWindow popup, View anchor, int xoff, int yoff, int gravity) {
        IMPL.showAsDropDown(popup, anchor, xoff, yoff, gravity);
    }
}
