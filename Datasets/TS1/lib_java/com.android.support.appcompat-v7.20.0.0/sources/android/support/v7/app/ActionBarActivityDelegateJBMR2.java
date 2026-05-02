package android.support.v7.app;

/* loaded from: com.android.support.appcompat-v7.20.0.0.jar:android/support/v7/app/ActionBarActivityDelegateJBMR2.class */
class ActionBarActivityDelegateJBMR2 extends ActionBarActivityDelegateJB {
    ActionBarActivityDelegateJBMR2(ActionBarActivity activity) {
        super(activity);
    }

    @Override // android.support.v7.app.ActionBarActivityDelegateJB, android.support.v7.app.ActionBarActivityDelegateICS, android.support.v7.app.ActionBarActivityDelegate
    public ActionBar createSupportActionBar() {
        return new ActionBarImplJBMR2(this.mActivity, this.mActivity);
    }
}
