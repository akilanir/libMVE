package org.acra.jraf.android.util.activitylifecyclecallbackscompat;

import android.app.Activity;
import android.app.Application;
import android.os.Bundle;

/* loaded from: acra-4.6.2.jar:org/acra/jraf/android/util/activitylifecyclecallbackscompat/ActivityLifecycleCallbacksWrapper.class */
class ActivityLifecycleCallbacksWrapper implements Application.ActivityLifecycleCallbacks {
    private ActivityLifecycleCallbacksCompat mCallback;

    public ActivityLifecycleCallbacksWrapper(ActivityLifecycleCallbacksCompat callback) {
        this.mCallback = callback;
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
        this.mCallback.onActivityCreated(activity, savedInstanceState);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityStarted(Activity activity) {
        this.mCallback.onActivityStarted(activity);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityResumed(Activity activity) {
        this.mCallback.onActivityResumed(activity);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityPaused(Activity activity) {
        this.mCallback.onActivityPaused(activity);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityStopped(Activity activity) {
        this.mCallback.onActivityStopped(activity);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
        this.mCallback.onActivitySaveInstanceState(activity, outState);
    }

    @Override // android.app.Application.ActivityLifecycleCallbacks
    public void onActivityDestroyed(Activity activity) {
        this.mCallback.onActivityDestroyed(activity);
    }

    public boolean equals(Object object) {
        if (!(object instanceof ActivityLifecycleCallbacksWrapper)) {
            return false;
        }
        ActivityLifecycleCallbacksWrapper that = (ActivityLifecycleCallbacksWrapper) object;
        return null == this.mCallback ? null == that.mCallback : this.mCallback.equals(that.mCallback);
    }

    public int hashCode() {
        if (null != this.mCallback) {
            return this.mCallback.hashCode();
        }
        return 0;
    }
}
