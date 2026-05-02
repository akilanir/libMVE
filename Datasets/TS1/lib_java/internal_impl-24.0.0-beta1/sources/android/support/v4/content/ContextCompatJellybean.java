package android.support.v4.content;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;

/* loaded from: internal_impl-24.0.0-beta1.jar:android/support/v4/content/ContextCompatJellybean.class */
class ContextCompatJellybean {
    ContextCompatJellybean() {
    }

    public static void startActivities(Context context, Intent[] intents, Bundle options) {
        context.startActivities(intents, options);
    }
}
