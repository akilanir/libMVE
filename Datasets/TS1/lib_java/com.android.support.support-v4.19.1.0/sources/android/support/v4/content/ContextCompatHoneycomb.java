package android.support.v4.content;

import android.content.Context;
import android.content.Intent;
import java.io.File;

/* loaded from: support-v4-19.1.0.jar:android/support/v4/content/ContextCompatHoneycomb.class */
class ContextCompatHoneycomb {
    ContextCompatHoneycomb() {
    }

    static void startActivities(Context context, Intent[] intents) {
        context.startActivities(intents);
    }

    public static File getObbDir(Context context) {
        return context.getObbDir();
    }
}
