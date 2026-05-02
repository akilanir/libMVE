package com.bumptech.glide.load.engine;

import android.os.Looper;
import com.bumptech.glide.load.Key;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/engine/EngineResource.class */
class EngineResource<Z> implements Resource<Z> {
    private final Resource<Z> resource;
    private final boolean isCacheable;
    private ResourceListener listener;
    private Key key;
    private int acquired;
    private boolean isRecycled;

    /* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/engine/EngineResource$ResourceListener.class */
    interface ResourceListener {
        void onResourceReleased(Key key, EngineResource<?> engineResource);
    }

    EngineResource(Resource<Z> toWrap, boolean isCacheable) {
        if (toWrap == null) {
            throw new NullPointerException("Wrapped resource must not be null");
        }
        this.resource = toWrap;
        this.isCacheable = isCacheable;
    }

    void setResourceListener(Key key, ResourceListener listener) {
        this.key = key;
        this.listener = listener;
    }

    boolean isCacheable() {
        return this.isCacheable;
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public Z get() {
        return this.resource.get();
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public int getSize() {
        return this.resource.getSize();
    }

    @Override // com.bumptech.glide.load.engine.Resource
    public void recycle() {
        if (this.acquired > 0) {
            throw new IllegalStateException("Cannot recycle a resource while it is still acquired");
        }
        if (this.isRecycled) {
            throw new IllegalStateException("Cannot recycle a resource that has already been recycled");
        }
        this.isRecycled = true;
        this.resource.recycle();
    }

    void acquire() {
        if (this.isRecycled) {
            throw new IllegalStateException("Cannot acquire a recycled resource");
        }
        if (!Looper.getMainLooper().equals(Looper.myLooper())) {
            throw new IllegalThreadStateException("Must call acquire on the main thread");
        }
        this.acquired++;
    }

    void release() {
        if (this.acquired <= 0) {
            throw new IllegalStateException("Cannot release a recycled or not yet acquired resource");
        }
        if (!Looper.getMainLooper().equals(Looper.myLooper())) {
            throw new IllegalThreadStateException("Must call release on the main thread");
        }
        int i = this.acquired - 1;
        this.acquired = i;
        if (i == 0) {
            this.listener.onResourceReleased(this.key, this);
        }
    }
}
