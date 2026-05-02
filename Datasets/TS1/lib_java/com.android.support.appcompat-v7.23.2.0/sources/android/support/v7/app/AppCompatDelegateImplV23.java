package android.support.v7.app;

import android.content.Context;
import android.support.v7.app.AppCompatDelegateImplV14;
import android.view.ActionMode;
import android.view.Window;

/* loaded from: com.android.support.appcompat-v7.23.2.0.jar:android/support/v7/app/AppCompatDelegateImplV23.class */
class AppCompatDelegateImplV23 extends AppCompatDelegateImplV14 {
    AppCompatDelegateImplV23(Context context, Window window, AppCompatCallback callback) {
        super(context, window, callback);
    }

    @Override // android.support.v7.app.AppCompatDelegateImplV14, android.support.v7.app.AppCompatDelegateImplBase
    Window.Callback wrapWindowCallback(Window.Callback callback) {
        return new AppCompatWindowCallbackV23(callback);
    }

    /* loaded from: com.android.support.appcompat-v7.23.2.0.jar:android/support/v7/app/AppCompatDelegateImplV23$AppCompatWindowCallbackV23.class */
    class AppCompatWindowCallbackV23 extends AppCompatDelegateImplV14.AppCompatWindowCallbackV14 {
        AppCompatWindowCallbackV23(Window.Callback callback) {
            super(callback);
        }

        @Override // android.support.v7.view.WindowCallbackWrapper, android.view.Window.Callback
        public ActionMode onWindowStartingActionMode(ActionMode.Callback callback, int type) {
            if (AppCompatDelegateImplV23.this.isHandleNativeActionModesEnabled()) {
                switch (type) {
                    case 0:
                        return startAsSupportActionMode(callback);
                }
            }
            return super.onWindowStartingActionMode(callback, type);
        }

        @Override // android.support.v7.app.AppCompatDelegateImplV14.AppCompatWindowCallbackV14, android.support.v7.view.WindowCallbackWrapper, android.view.Window.Callback
        public ActionMode onWindowStartingActionMode(ActionMode.Callback callback) {
            return null;
        }
    }
}
