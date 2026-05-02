package com.bumptech.glide.manager;

import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/manager/ActivityFragmentLifecycle.class */
class ActivityFragmentLifecycle implements Lifecycle {
    private final Set<LifecycleListener> lifecycleListeners = Collections.synchronizedSet(Collections.newSetFromMap(new WeakHashMap()));
    private boolean isStarted;
    private boolean isDestroyed;

    ActivityFragmentLifecycle() {
    }

    @Override // com.bumptech.glide.manager.Lifecycle
    public void addListener(LifecycleListener listener) {
        this.lifecycleListeners.add(listener);
        if (this.isDestroyed) {
            listener.onDestroy();
        } else if (this.isStarted) {
            listener.onStart();
        } else {
            listener.onStop();
        }
    }

    void onStart() {
        this.isStarted = true;
        for (LifecycleListener lifecycleListener : this.lifecycleListeners) {
            lifecycleListener.onStart();
        }
    }

    void onStop() {
        this.isStarted = false;
        for (LifecycleListener lifecycleListener : this.lifecycleListeners) {
            lifecycleListener.onStop();
        }
    }

    void onDestroy() {
        this.isDestroyed = true;
        for (LifecycleListener lifecycleListener : this.lifecycleListeners) {
            lifecycleListener.onDestroy();
        }
    }
}
