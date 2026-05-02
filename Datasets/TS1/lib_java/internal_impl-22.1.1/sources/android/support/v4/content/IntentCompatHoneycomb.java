package android.support.v4.content;

import android.content.ComponentName;
import android.content.Intent;

/* loaded from: internal_impl-22.1.1.jar:android/support/v4/content/IntentCompatHoneycomb.class */
class IntentCompatHoneycomb {
    IntentCompatHoneycomb() {
    }

    public static Intent makeMainActivity(ComponentName mainActivity) {
        return Intent.makeMainActivity(mainActivity);
    }

    public static Intent makeRestartActivityTask(ComponentName mainActivity) {
        return Intent.makeRestartActivityTask(mainActivity);
    }
}
