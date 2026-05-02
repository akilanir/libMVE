package org.piwik.sdk;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Application;
import android.os.Bundle;
import android.text.TextUtils;
import java.lang.Thread;
import java.util.ArrayList;
import java.util.List;

/* loaded from: org.piwik.sdk.piwik-sdk.0.0.3.jar:org/piwik/sdk/QuickTrack.class */
public class QuickTrack {
    public static Thread.UncaughtExceptionHandler trackUncaughtExceptions(Tracker tracker) {
        if (Thread.getDefaultUncaughtExceptionHandler() instanceof PiwikExceptionHandler) {
            throw new RuntimeException("Trying to wrap an existing PiwikExceptionHandler.");
        }
        Thread.UncaughtExceptionHandler handler = new PiwikExceptionHandler(tracker);
        Thread.setDefaultUncaughtExceptionHandler(handler);
        return handler;
    }

    @TargetApi(14)
    public static Application.ActivityLifecycleCallbacks bindToApp(Application app, final Tracker tracker) {
        Application.ActivityLifecycleCallbacks callback = new Application.ActivityLifecycleCallbacks() { // from class: org.piwik.sdk.QuickTrack.1
            @Override // android.app.Application.ActivityLifecycleCallbacks
            public void onActivityCreated(Activity activity, Bundle bundle) {
            }

            @Override // android.app.Application.ActivityLifecycleCallbacks
            public void onActivityStarted(Activity activity) {
            }

            @Override // android.app.Application.ActivityLifecycleCallbacks
            public void onActivityResumed(Activity activity) {
                QuickTrack.track(tracker, activity);
            }

            @Override // android.app.Application.ActivityLifecycleCallbacks
            public void onActivityPaused(Activity activity) {
            }

            @Override // android.app.Application.ActivityLifecycleCallbacks
            public void onActivityStopped(Activity activity) {
                if (activity != null && activity.isTaskRoot()) {
                    tracker.dispatch();
                }
            }

            @Override // android.app.Application.ActivityLifecycleCallbacks
            public void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
            }

            @Override // android.app.Application.ActivityLifecycleCallbacks
            public void onActivityDestroyed(Activity activity) {
            }
        };
        app.registerActivityLifecycleCallbacks(callback);
        return callback;
    }

    public static void track(PiwikApplication piwikApplication, Activity activity) {
        track(piwikApplication.getTracker(), activity);
    }

    public static void track(Tracker tracker, Activity activity) {
        if (activity != null) {
            String breadcrumbs = getBreadcrumbs(activity);
            tracker.trackScreenView(breadcrumbsToPath(breadcrumbs), breadcrumbs);
        }
    }

    private static String getBreadcrumbs(Activity activity) {
        ArrayList<String> breadcrumbs = new ArrayList<>();
        for (Activity currentActivity = activity; currentActivity != null; currentActivity = currentActivity.getParent()) {
            breadcrumbs.add(currentActivity.getTitle().toString());
        }
        return joinSlash(breadcrumbs);
    }

    private static String joinSlash(List<String> sequence) {
        if (sequence != null && sequence.size() > 0) {
            return TextUtils.join("/", sequence);
        }
        return BuildConfig.FLAVOR;
    }

    private static String breadcrumbsToPath(String breadcrumbs) {
        return breadcrumbs.replaceAll("\\s", BuildConfig.FLAVOR);
    }
}
