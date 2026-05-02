package android.support.v4.widget;

import android.os.Build;
import android.view.View;

/* loaded from: com.android.support.support-v4.21.0.3.jar:android/support/v4/widget/ListPopupWindowCompat.class */
public class ListPopupWindowCompat {
    static final ListPopupWindowImpl IMPL;

    /* loaded from: com.android.support.support-v4.21.0.3.jar:android/support/v4/widget/ListPopupWindowCompat$ListPopupWindowImpl.class */
    interface ListPopupWindowImpl {
        View.OnTouchListener createDragToOpenListener(Object obj, View view);
    }

    /* loaded from: com.android.support.support-v4.21.0.3.jar:android/support/v4/widget/ListPopupWindowCompat$BaseListPopupWindowImpl.class */
    static class BaseListPopupWindowImpl implements ListPopupWindowImpl {
        BaseListPopupWindowImpl() {
        }

        @Override // android.support.v4.widget.ListPopupWindowCompat.ListPopupWindowImpl
        public View.OnTouchListener createDragToOpenListener(Object listPopupWindow, View src) {
            return null;
        }
    }

    /* loaded from: com.android.support.support-v4.21.0.3.jar:android/support/v4/widget/ListPopupWindowCompat$KitKatListPopupWindowImpl.class */
    static class KitKatListPopupWindowImpl extends BaseListPopupWindowImpl {
        KitKatListPopupWindowImpl() {
        }

        @Override // android.support.v4.widget.ListPopupWindowCompat.BaseListPopupWindowImpl, android.support.v4.widget.ListPopupWindowCompat.ListPopupWindowImpl
        public View.OnTouchListener createDragToOpenListener(Object listPopupWindow, View src) {
            return ListPopupWindowCompatKitKat.createDragToOpenListener(listPopupWindow, src);
        }
    }

    static {
        int version = Build.VERSION.SDK_INT;
        if (version >= 19) {
            IMPL = new KitKatListPopupWindowImpl();
        } else {
            IMPL = new BaseListPopupWindowImpl();
        }
    }

    private ListPopupWindowCompat() {
    }

    public static View.OnTouchListener createDragToOpenListener(Object listPopupWindow, View src) {
        return IMPL.createDragToOpenListener(listPopupWindow, src);
    }
}
