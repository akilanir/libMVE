package android.support.v4.app;

import android.content.Intent;
import android.content.IntentSender;
import android.support.annotation.Nullable;

/* loaded from: internal_impl-24.0.0-beta1.jar:android/support/v4/app/BaseFragmentActivityEclair.class */
abstract class BaseFragmentActivityEclair extends BaseFragmentActivityDonut {
    boolean mStartedIntentSenderFromFragment;

    BaseFragmentActivityEclair() {
    }

    @Override // android.app.Activity
    public void startIntentSenderForResult(IntentSender intent, int requestCode, @Nullable Intent fillInIntent, int flagsMask, int flagsValues, int extraFlags) throws IntentSender.SendIntentException {
        if (!this.mStartedIntentSenderFromFragment && requestCode != -1) {
            checkForValidRequestCode(requestCode);
        }
        super.startIntentSenderForResult(intent, requestCode, fillInIntent, flagsMask, flagsValues, extraFlags);
    }

    @Override // android.support.v4.app.BaseFragmentActivityDonut
    void onBackPressedNotHandled() {
        super.onBackPressed();
    }

    static void checkForValidRequestCode(int requestCode) {
        if ((requestCode & (-65536)) != 0) {
            throw new IllegalArgumentException("Can only use lower 16 bits for requestCode");
        }
    }
}
