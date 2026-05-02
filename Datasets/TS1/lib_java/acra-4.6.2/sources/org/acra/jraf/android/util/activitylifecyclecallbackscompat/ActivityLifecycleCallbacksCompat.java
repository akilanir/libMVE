package org.acra.jraf.android.util.activitylifecyclecallbackscompat;

import android.app.Activity;
import android.os.Bundle;

/* loaded from: acra-4.6.2.jar:org/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksCompat.class */
public interface ActivityLifecycleCallbacksCompat {
    void onActivityCreated(Activity activity, Bundle bundle);

    void onActivityStarted(Activity activity);

    void onActivityResumed(Activity activity);

    void onActivityPaused(Activity activity);

    void onActivityStopped(Activity activity);

    void onActivitySaveInstanceState(Activity activity, Bundle bundle);

    void onActivityDestroyed(Activity activity);
}
