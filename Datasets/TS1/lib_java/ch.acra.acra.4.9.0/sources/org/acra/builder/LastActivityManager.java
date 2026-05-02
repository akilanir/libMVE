package org.acra.builder;

import android.app.Activity;
import android.app.Application;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.lang.ref.WeakReference;
import org.acra.ACRA;
import org.acra.dialog.BaseCrashReportDialog;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/builder/LastActivityManager.class */
public final class LastActivityManager {

    @NonNull
    private WeakReference<Activity> lastActivityCreated = new WeakReference<>(null);

    public LastActivityManager(@NonNull Application application) {
        if (Build.VERSION.SDK_INT >= 14) {
            application.registerActivityLifecycleCallbacks(new Application.ActivityLifecycleCallbacks() { // from class: org.acra.builder.LastActivityManager.1
                @Override // android.app.Application.ActivityLifecycleCallbacks
                public void onActivityCreated(@NonNull Activity activity, Bundle savedInstanceState) {
                    if (ACRA.DEV_LOGGING) {
                        ACRA.log.d(ACRA.LOG_TAG, "onActivityCreated " + activity.getClass());
                    }
                    if (!(activity instanceof BaseCrashReportDialog)) {
                        LastActivityManager.this.lastActivityCreated = new WeakReference(activity);
                    }
                }

                @Override // android.app.Application.ActivityLifecycleCallbacks
                public void onActivityStarted(@NonNull Activity activity) {
                    if (ACRA.DEV_LOGGING) {
                        ACRA.log.d(ACRA.LOG_TAG, "onActivityStarted " + activity.getClass());
                    }
                }

                @Override // android.app.Application.ActivityLifecycleCallbacks
                public void onActivityResumed(@NonNull Activity activity) {
                    if (ACRA.DEV_LOGGING) {
                        ACRA.log.d(ACRA.LOG_TAG, "onActivityResumed " + activity.getClass());
                    }
                }

                @Override // android.app.Application.ActivityLifecycleCallbacks
                public void onActivityPaused(@NonNull Activity activity) {
                    if (ACRA.DEV_LOGGING) {
                        ACRA.log.d(ACRA.LOG_TAG, "onActivityPaused " + activity.getClass());
                    }
                }

                @Override // android.app.Application.ActivityLifecycleCallbacks
                public void onActivityStopped(@NonNull Activity activity) {
                    if (ACRA.DEV_LOGGING) {
                        ACRA.log.d(ACRA.LOG_TAG, "onActivityStopped " + activity.getClass());
                    }
                }

                @Override // android.app.Application.ActivityLifecycleCallbacks
                public void onActivitySaveInstanceState(@NonNull Activity activity, Bundle outState) {
                    if (ACRA.DEV_LOGGING) {
                        ACRA.log.d(ACRA.LOG_TAG, "onActivitySaveInstanceState " + activity.getClass());
                    }
                }

                @Override // android.app.Application.ActivityLifecycleCallbacks
                public void onActivityDestroyed(@NonNull Activity activity) {
                    if (ACRA.DEV_LOGGING) {
                        ACRA.log.d(ACRA.LOG_TAG, "onActivityDestroyed " + activity.getClass());
                    }
                }
            });
        }
    }

    @Nullable
    public Activity getLastActivity() {
        return this.lastActivityCreated.get();
    }

    public void clearLastActivity() {
        this.lastActivityCreated.clear();
    }
}
