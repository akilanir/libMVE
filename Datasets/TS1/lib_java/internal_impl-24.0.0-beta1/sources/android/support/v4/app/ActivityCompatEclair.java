package android.support.v4.app;

import android.app.Activity;
import android.content.Intent;
import android.content.IntentSender;

/* loaded from: internal_impl-24.0.0-beta1.jar:android/support/v4/app/ActivityCompatEclair.class */
class ActivityCompatEclair {
    ActivityCompatEclair() {
    }

    public static void startIntentSenderForResult(Activity activity, IntentSender intent, int requestCode, Intent fillInIntent, int flagsMask, int flagsValues, int extraFlags) throws IntentSender.SendIntentException {
        activity.startIntentSenderForResult(intent, requestCode, fillInIntent, flagsMask, flagsValues, extraFlags);
    }
}
