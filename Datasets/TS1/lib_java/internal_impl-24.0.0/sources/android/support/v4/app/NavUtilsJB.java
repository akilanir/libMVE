package android.support.v4.app;

import android.app.Activity;
import android.content.Intent;
import android.content.pm.ActivityInfo;

/* loaded from: internal_impl-24.0.0.jar:android/support/v4/app/NavUtilsJB.class */
class NavUtilsJB {
    NavUtilsJB() {
    }

    public static Intent getParentActivityIntent(Activity activity) {
        return activity.getParentActivityIntent();
    }

    public static boolean shouldUpRecreateTask(Activity activity, Intent targetIntent) {
        return activity.shouldUpRecreateTask(targetIntent);
    }

    public static void navigateUpTo(Activity activity, Intent upIntent) {
        activity.navigateUpTo(upIntent);
    }

    public static String getParentActivityName(ActivityInfo info) {
        return info.parentActivityName;
    }
}
