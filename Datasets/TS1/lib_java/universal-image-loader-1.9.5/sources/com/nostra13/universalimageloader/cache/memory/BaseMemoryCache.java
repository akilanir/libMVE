package com.nostra13.universalimageloader.cache.memory;

import android.graphics.Bitmap;
import java.lang.ref.Reference;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;

/* loaded from: universal-image-loader-1.9.5.jar:com/nostra13/universalimageloader/cache/memory/BaseMemoryCache.class */
public abstract class BaseMemoryCache implements MemoryCache {
    private final Map<String, Reference<Bitmap>> softMap = Collections.synchronizedMap(new HashMap());

    protected abstract Reference<Bitmap> createReference(Bitmap bitmap);

    @Override // com.nostra13.universalimageloader.cache.memory.MemoryCache
    public Bitmap get(String key) {
        Bitmap result = null;
        Reference<Bitmap> reference = this.softMap.get(key);
        if (reference != null) {
            result = reference.get();
        }
        return result;
    }

    @Override // com.nostra13.universalimageloader.cache.memory.MemoryCache
    public boolean put(String key, Bitmap value) {
        this.softMap.put(key, createReference(value));
        return true;
    }

    @Override // com.nostra13.universalimageloader.cache.memory.MemoryCache
    public Bitmap remove(String key) {
        Reference<Bitmap> bmpRef = this.softMap.remove(key);
        if (bmpRef == null) {
            return null;
        }
        return bmpRef.get();
    }

    @Override // com.nostra13.universalimageloader.cache.memory.MemoryCache
    public Collection<String> keys() {
        HashSet hashSet;
        synchronized (this.softMap) {
            hashSet = new HashSet(this.softMap.keySet());
        }
        return hashSet;
    }

    @Override // com.nostra13.universalimageloader.cache.memory.MemoryCache
    public void clear() {
        this.softMap.clear();
    }
}
