package android.support.v4.widget;

import android.os.Build;
import android.view.View;

/* loaded from: com.android.support.support-v4.23.3.0.jar:android/support/v4/widget/PopupMenuCompat.class */
public final class PopupMenuCompat {
    static final PopupMenuImpl IMPL;

    /* loaded from: com.android.support.support-v4.23.3.0.jar:android/support/v4/widget/PopupMenuCompat$PopupMenuImpl.class */
    interface PopupMenuImpl {
        View.OnTouchListener getDragToOpenListener(Object obj);
    }

    /* loaded from: com.android.support.support-v4.23.3.0.jar:android/support/v4/widget/PopupMenuCompat$BasePopupMenuImpl.class */
    static class BasePopupMenuImpl implements PopupMenuImpl {
        BasePopupMenuImpl() {
        }

        @Override // android.support.v4.widget.PopupMenuCompat.PopupMenuImpl
        public View.OnTouchListener getDragToOpenListener(Object popupMenu) {
            return null;
        }
    }

    /* loaded from: com.android.support.support-v4.23.3.0.jar:android/support/v4/widget/PopupMenuCompat$KitKatPopupMenuImpl.class */
    static class KitKatPopupMenuImpl extends BasePopupMenuImpl {
        KitKatPopupMenuImpl() {
        }

        @Override // android.support.v4.widget.PopupMenuCompat.BasePopupMenuImpl, android.support.v4.widget.PopupMenuCompat.PopupMenuImpl
        public View.OnTouchListener getDragToOpenListener(Object popupMenu) {
            return PopupMenuCompatKitKat.getDragToOpenListener(popupMenu);
        }
    }

    static {
        int version = Build.VERSION.SDK_INT;
        if (version >= 19) {
            IMPL = new KitKatPopupMenuImpl();
        } else {
            IMPL = new BasePopupMenuImpl();
        }
    }

    private PopupMenuCompat() {
    }

    public static View.OnTouchListener getDragToOpenListener(Object popupMenu) {
        return IMPL.getDragToOpenListener(popupMenu);
    }
}
