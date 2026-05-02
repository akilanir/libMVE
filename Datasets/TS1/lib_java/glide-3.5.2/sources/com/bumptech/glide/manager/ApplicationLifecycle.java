package com.bumptech.glide.manager;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/manager/ApplicationLifecycle.class */
class ApplicationLifecycle implements Lifecycle {
    ApplicationLifecycle() {
    }

    @Override // com.bumptech.glide.manager.Lifecycle
    public void addListener(LifecycleListener listener) {
        listener.onStart();
    }
}
