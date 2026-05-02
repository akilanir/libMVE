package com.facebook.stetho.inspector.elements.android;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Application;
import android.os.Build;
import android.os.Bundle;
import android.os.Looper;
import com.facebook.stetho.common.Util;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;
import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;
import javax.annotation.concurrent.NotThreadSafe;

@NotThreadSafe
/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/elements/android/ActivityTracker.class */
public final class ActivityTracker {
    private static final ActivityTracker sInstance = new ActivityTracker();

    @GuardedBy("Looper.getMainLooper()")
    private final ArrayList<Activity> mActivities = new ArrayList<>();
    private final List<Activity> mActivitiesUnmodifiable = Collections.unmodifiableList(this.mActivities);
    private final List<Listener> mListeners = new CopyOnWriteArrayList();

    @Nullable
    private AutomaticTracker mAutomaticTracker;

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/elements/android/ActivityTracker$Listener.class */
    public interface Listener {
        void onActivityAdded(Activity activity);

        void onActivityRemoved(Activity activity);
    }

    public static ActivityTracker get() {
        return sInstance;
    }

    public void registerListener(Listener listener) {
        this.mListeners.add(listener);
    }

    public void unregisterListener(Listener listener) {
        this.mListeners.remove(listener);
    }

    public boolean beginTrackingIfPossible(Application application) {
        AutomaticTracker automaticTracker;
        if (this.mAutomaticTracker == null && (automaticTracker = AutomaticTracker.newInstanceIfPossible(application, this)) != null) {
            automaticTracker.register();
            this.mAutomaticTracker = automaticTracker;
            return true;
        }
        return false;
    }

    public boolean endTracking() {
        if (this.mAutomaticTracker != null) {
            this.mAutomaticTracker.unregister();
            this.mAutomaticTracker = null;
            return true;
        }
        return false;
    }

    public void add(Activity activity) {
        Util.throwIfNull(activity);
        Util.throwIfNot(Looper.myLooper() == Looper.getMainLooper());
        this.mActivities.add(activity);
        for (Listener listener : this.mListeners) {
            listener.onActivityAdded(activity);
        }
    }

    public void remove(Activity activity) {
        Util.throwIfNull(activity);
        Util.throwIfNot(Looper.myLooper() == Looper.getMainLooper());
        if (this.mActivities.remove(activity)) {
            for (Listener listener : this.mListeners) {
                listener.onActivityRemoved(activity);
            }
        }
    }

    public List<Activity> getActivitiesView() {
        return this.mActivitiesUnmodifiable;
    }

    public Activity tryGetTopActivity() {
        if (this.mActivitiesUnmodifiable.isEmpty()) {
            return null;
        }
        return this.mActivitiesUnmodifiable.get(this.mActivitiesUnmodifiable.size() - 1);
    }

    /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/elements/android/ActivityTracker$AutomaticTracker.class */
    private static abstract class AutomaticTracker {
        public abstract void register();

        public abstract void unregister();

        private AutomaticTracker() {
        }

        @Nullable
        public static AutomaticTracker newInstanceIfPossible(Application application, ActivityTracker tracker) {
            if (Build.VERSION.SDK_INT >= 14) {
                return new AutomaticTrackerICSAndBeyond(application, tracker);
            }
            return null;
        }

        @TargetApi(AndroidDocumentConstants.MIN_API_LEVEL)
        /* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/elements/android/ActivityTracker$AutomaticTracker$AutomaticTrackerICSAndBeyond.class */
        private static class AutomaticTrackerICSAndBeyond extends AutomaticTracker {
            private final Application mApplication;
            private final ActivityTracker mTracker;
            private final Application.ActivityLifecycleCallbacks mLifecycleCallbacks;

            public AutomaticTrackerICSAndBeyond(Application application, ActivityTracker tracker) {
                super();
                this.mLifecycleCallbacks = new Application.ActivityLifecycleCallbacks() { // from class: com.facebook.stetho.inspector.elements.android.ActivityTracker.AutomaticTracker.AutomaticTrackerICSAndBeyond.1
                    @Override // android.app.Application.ActivityLifecycleCallbacks
                    public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
                        AutomaticTrackerICSAndBeyond.this.mTracker.add(activity);
                    }

                    @Override // android.app.Application.ActivityLifecycleCallbacks
                    public void onActivityStarted(Activity activity) {
                    }

                    @Override // android.app.Application.ActivityLifecycleCallbacks
                    public void onActivityResumed(Activity activity) {
                    }

                    @Override // android.app.Application.ActivityLifecycleCallbacks
                    public void onActivityPaused(Activity activity) {
                    }

                    @Override // android.app.Application.ActivityLifecycleCallbacks
                    public void onActivityStopped(Activity activity) {
                    }

                    @Override // android.app.Application.ActivityLifecycleCallbacks
                    public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
                    }

                    @Override // android.app.Application.ActivityLifecycleCallbacks
                    public void onActivityDestroyed(Activity activity) {
                        AutomaticTrackerICSAndBeyond.this.mTracker.remove(activity);
                    }
                };
                this.mApplication = application;
                this.mTracker = tracker;
            }

            @Override // com.facebook.stetho.inspector.elements.android.ActivityTracker.AutomaticTracker
            public void register() {
                this.mApplication.registerActivityLifecycleCallbacks(this.mLifecycleCallbacks);
            }

            @Override // com.facebook.stetho.inspector.elements.android.ActivityTracker.AutomaticTracker
            public void unregister() {
                this.mApplication.unregisterActivityLifecycleCallbacks(this.mLifecycleCallbacks);
            }
        }
    }
}
