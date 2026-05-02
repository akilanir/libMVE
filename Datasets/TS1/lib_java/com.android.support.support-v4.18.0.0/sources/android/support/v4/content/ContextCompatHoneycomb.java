package android.support.v4.content;

import android.content.Context;
import android.content.Intent;

/* loaded from: support-v4-18.0.0.jar:android/support/v4/content/ContextCompatHoneycomb.class */
class ContextCompatHoneycomb {
    ContextCompatHoneycomb() {
    }

    static void startActivities(Context context, Intent[] intents) {
        context.startActivities(intents);
    }
}
