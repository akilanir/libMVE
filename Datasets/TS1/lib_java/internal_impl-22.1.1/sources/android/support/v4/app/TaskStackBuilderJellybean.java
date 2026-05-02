package android.support.v4.app;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;

/* loaded from: internal_impl-22.1.1.jar:android/support/v4/app/TaskStackBuilderJellybean.class */
class TaskStackBuilderJellybean {
    TaskStackBuilderJellybean() {
    }

    public static PendingIntent getActivitiesPendingIntent(Context context, int requestCode, Intent[] intents, int flags, Bundle options) {
        return PendingIntent.getActivities(context, requestCode, intents, flags, options);
    }
}
