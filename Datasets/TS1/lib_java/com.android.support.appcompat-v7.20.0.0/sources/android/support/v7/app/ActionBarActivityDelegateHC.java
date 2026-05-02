package android.support.v7.app;

/* loaded from: com.android.support.appcompat-v7.20.0.0.jar:android/support/v7/app/ActionBarActivityDelegateHC.class */
class ActionBarActivityDelegateHC extends ActionBarActivityDelegateBase {
    ActionBarActivityDelegateHC(ActionBarActivity activity) {
        super(activity);
    }

    @Override // android.support.v7.app.ActionBarActivityDelegateBase, android.support.v7.app.ActionBarActivityDelegate
    public ActionBar createSupportActionBar() {
        ensureSubDecor();
        return new ActionBarImplHC(this.mActivity, this.mActivity);
    }
}
