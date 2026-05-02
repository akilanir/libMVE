package android.support.v4.app;

/* loaded from: internal_impl-23.4.0.jar:android/support/v4/app/BaseFragmentActivityEclair.class */
abstract class BaseFragmentActivityEclair extends BaseFragmentActivityDonut {
    BaseFragmentActivityEclair() {
    }

    @Override // android.support.v4.app.BaseFragmentActivityDonut
    void onBackPressedNotHandled() {
        super.onBackPressed();
    }
}
