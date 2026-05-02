package com.bumptech.glide.load.engine.cache;

import com.bumptech.glide.load.Key;
import com.bumptech.glide.load.engine.cache.DiskCache;
import java.io.File;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/engine/cache/DiskCacheAdapter.class */
public class DiskCacheAdapter implements DiskCache {
    @Override // com.bumptech.glide.load.engine.cache.DiskCache
    public File get(Key key) {
        return null;
    }

    @Override // com.bumptech.glide.load.engine.cache.DiskCache
    public void put(Key key, DiskCache.Writer writer) {
    }

    @Override // com.bumptech.glide.load.engine.cache.DiskCache
    public void delete(Key key) {
    }
}
