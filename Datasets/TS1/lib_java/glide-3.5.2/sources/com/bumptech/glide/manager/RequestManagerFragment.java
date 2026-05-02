package com.bumptech.glide.manager;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.Fragment;
import com.bumptech.glide.RequestManager;

@TargetApi(11)
/* loaded from: glide-3.5.2.jar:com/bumptech/glide/manager/RequestManagerFragment.class */
public class RequestManagerFragment extends Fragment {
    private final ActivityFragmentLifecycle lifecycle;
    private RequestManager requestManager;

    public RequestManagerFragment() {
        this(new ActivityFragmentLifecycle());
    }

    @SuppressLint({"ValidFragment"})
    RequestManagerFragment(ActivityFragmentLifecycle lifecycle) {
        this.lifecycle = lifecycle;
    }

    public void setRequestManager(RequestManager requestManager) {
        this.requestManager = requestManager;
    }

    ActivityFragmentLifecycle getLifecycle() {
        return this.lifecycle;
    }

    public RequestManager getRequestManager() {
        return this.requestManager;
    }

    @Override // android.app.Fragment
    public void onStart() {
        super.onStart();
        this.lifecycle.onStart();
    }

    @Override // android.app.Fragment
    public void onStop() {
        super.onStop();
        this.lifecycle.onStop();
    }

    @Override // android.app.Fragment
    public void onDestroy() {
        super.onDestroy();
        this.lifecycle.onDestroy();
    }

    @Override // android.app.Fragment, android.content.ComponentCallbacks2
    public void onTrimMemory(int level) {
        if (this.requestManager != null) {
            this.requestManager.onTrimMemory(level);
        }
    }

    @Override // android.app.Fragment, android.content.ComponentCallbacks
    public void onLowMemory() {
        if (this.requestManager != null) {
            this.requestManager.onLowMemory();
        }
    }
}
