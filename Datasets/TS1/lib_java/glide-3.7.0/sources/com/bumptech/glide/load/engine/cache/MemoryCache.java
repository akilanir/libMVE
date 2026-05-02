package com.bumptech.glide.load.engine.cache;

import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.engine.Resource;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/engine/cache/MemoryCache.class */
public interface MemoryCache {

    /* loaded from: glide-3.7.0.jar:com/bumptech/glide/load/engine/cache/MemoryCache$ResourceRemovedListener.class */
    public interface ResourceRemovedListener {
        void onResourceRemoved(Resource<?> resource);
    }

    int getCurrentSize();

    int getMaxSize();

    void setSizeMultiplier(float f);

    Resource<?> remove(Key key);

    Resource<?> put(Key key, Resource<?> resource);

    void setResourceRemovedListener(ResourceRemovedListener resourceRemovedListener);

    void clearMemory();

    void trimMemory(int i);
}
