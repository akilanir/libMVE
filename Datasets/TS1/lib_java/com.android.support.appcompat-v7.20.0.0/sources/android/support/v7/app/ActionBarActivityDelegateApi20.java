package android.support.v7.app;

import android.support.v7.app.ActionBarActivityDelegateICS;
import android.view.Window;

/* loaded from: com.android.support.appcompat-v7.20.0.0.jar:android/support/v7/app/ActionBarActivityDelegateApi20.class */
class ActionBarActivityDelegateApi20 extends ActionBarActivityDelegateJBMR2 {
    ActionBarActivityDelegateApi20(ActionBarActivity activity) {
        super(activity);
    }

    @Override // android.support.v7.app.ActionBarActivityDelegateICS
    Window.Callback createWindowCallbackWrapper(Window.Callback cb) {
        return new WindowCallbackWrapperApi20(cb);
    }

    /* loaded from: com.android.support.appcompat-v7.20.0.0.jar:android/support/v7/app/ActionBarActivityDelegateApi20$WindowCallbackWrapperApi20.class */
    class WindowCallbackWrapperApi20 extends ActionBarActivityDelegateICS.WindowCallbackWrapper {
        WindowCallbackWrapperApi20(Window.Callback wrapped) {
            super(wrapped);
        }
    }
}
