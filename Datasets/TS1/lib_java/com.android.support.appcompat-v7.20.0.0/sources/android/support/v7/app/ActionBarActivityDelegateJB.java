package android.support.v7.app;

import android.content.Context;
import android.support.v7.internal.view.ActionModeWrapper;
import android.support.v7.internal.view.ActionModeWrapperJB;
import android.support.v7.view.ActionMode;

/* loaded from: com.android.support.appcompat-v7.20.0.0.jar:android/support/v7/app/ActionBarActivityDelegateJB.class */
class ActionBarActivityDelegateJB extends ActionBarActivityDelegateICS {
    ActionBarActivityDelegateJB(ActionBarActivity activity) {
        super(activity);
    }

    @Override // android.support.v7.app.ActionBarActivityDelegateICS, android.support.v7.app.ActionBarActivityDelegate
    public ActionBar createSupportActionBar() {
        return new ActionBarImplJB(this.mActivity, this.mActivity);
    }

    @Override // android.support.v7.app.ActionBarActivityDelegateICS
    ActionModeWrapper.CallbackWrapper createActionModeCallbackWrapper(Context context, ActionMode.Callback callback) {
        return new ActionModeWrapperJB.CallbackWrapper(context, callback);
    }

    @Override // android.support.v7.app.ActionBarActivityDelegateICS
    ActionModeWrapper createActionModeWrapper(Context context, android.view.ActionMode frameworkMode) {
        return new ActionModeWrapperJB(context, frameworkMode);
    }
}
