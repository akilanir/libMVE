package android.support.v4.view;

import android.os.Build;
import android.view.ViewConfiguration;

/* loaded from: support-v4-18.0.0.jar:android/support/v4/view/ViewConfigurationCompat.class */
public class ViewConfigurationCompat {
    static final ViewConfigurationVersionImpl IMPL;

    /* loaded from: support-v4-18.0.0.jar:android/support/v4/view/ViewConfigurationCompat$ViewConfigurationVersionImpl.class */
    interface ViewConfigurationVersionImpl {
        int getScaledPagingTouchSlop(ViewConfiguration viewConfiguration);
    }

    /* loaded from: support-v4-18.0.0.jar:android/support/v4/view/ViewConfigurationCompat$BaseViewConfigurationVersionImpl.class */
    static class BaseViewConfigurationVersionImpl implements ViewConfigurationVersionImpl {
        BaseViewConfigurationVersionImpl() {
        }

        @Override // android.support.v4.view.ViewConfigurationCompat.ViewConfigurationVersionImpl
        public int getScaledPagingTouchSlop(ViewConfiguration config) {
            return config.getScaledTouchSlop();
        }
    }

    /* loaded from: support-v4-18.0.0.jar:android/support/v4/view/ViewConfigurationCompat$FroyoViewConfigurationVersionImpl.class */
    static class FroyoViewConfigurationVersionImpl implements ViewConfigurationVersionImpl {
        FroyoViewConfigurationVersionImpl() {
        }

        @Override // android.support.v4.view.ViewConfigurationCompat.ViewConfigurationVersionImpl
        public int getScaledPagingTouchSlop(ViewConfiguration config) {
            return ViewConfigurationCompatFroyo.getScaledPagingTouchSlop(config);
        }
    }

    static {
        if (Build.VERSION.SDK_INT >= 11) {
            IMPL = new FroyoViewConfigurationVersionImpl();
        } else {
            IMPL = new BaseViewConfigurationVersionImpl();
        }
    }

    public static int getScaledPagingTouchSlop(ViewConfiguration config) {
        return IMPL.getScaledPagingTouchSlop(config);
    }
}
