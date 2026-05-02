package com.bumptech.glide.manager;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/manager/ConnectivityMonitor.class */
public interface ConnectivityMonitor extends LifecycleListener {

    /* loaded from: glide-3.7.0.jar:com/bumptech/glide/manager/ConnectivityMonitor$ConnectivityListener.class */
    public interface ConnectivityListener {
        void onConnectivityChanged(boolean z);
    }
}
