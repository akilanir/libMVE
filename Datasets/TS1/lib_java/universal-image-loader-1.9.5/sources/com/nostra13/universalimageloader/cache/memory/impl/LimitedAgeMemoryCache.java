package com.nostra13.universalimageloader.cache.memory.impl;

import android.graphics.Bitmap;
import com.nostra13.universalimageloader.cache.memory.MemoryCache;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/* loaded from: universal-image-loader-1.9.5.jar:com/nostra13/universalimageloader/cache/memory/impl/LimitedAgeMemoryCache.class */
public class LimitedAgeMemoryCache implements MemoryCache {
    private final MemoryCache cache;
    private final long maxAge;
    private final Map<String, Long> loadingDates = Collections.synchronizedMap(new HashMap());

    public LimitedAgeMemoryCache(MemoryCache cache, long maxAge) {
        this.cache = cache;
        this.maxAge = maxAge * 1000;
    }

    @Override // com.nostra13.universalimageloader.cache.memory.MemoryCache
    public boolean put(String key, Bitmap value) {
        boolean putSuccesfully = this.cache.put(key, value);
        if (putSuccesfully) {
            this.loadingDates.put(key, Long.valueOf(System.currentTimeMillis()));
        }
        return putSuccesfully;
    }

    @Override // com.nostra13.universalimageloader.cache.memory.MemoryCache
    public Bitmap get(String key) {
        Long loadingDate = this.loadingDates.get(key);
        if (loadingDate != null && System.currentTimeMillis() - loadingDate.longValue() > this.maxAge) {
            this.cache.remove(key);
            this.loadingDates.remove(key);
        }
        return this.cache.get(key);
    }

    @Override // com.nostra13.universalimageloader.cache.memory.MemoryCache
    public Bitmap remove(String key) {
        this.loadingDates.remove(key);
        return this.cache.remove(key);
    }

    @Override // com.nostra13.universalimageloader.cache.memory.MemoryCache
    public Collection<String> keys() {
        return this.cache.keys();
    }

    @Override // com.nostra13.universalimageloader.cache.memory.MemoryCache
    public void clear() {
        this.cache.clear();
        this.loadingDates.clear();
    }
}
