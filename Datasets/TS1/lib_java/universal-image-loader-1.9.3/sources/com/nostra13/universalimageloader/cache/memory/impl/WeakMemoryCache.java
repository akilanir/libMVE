package com.nostra13.universalimageloader.cache.memory.impl;

import android.graphics.Bitmap;
import com.nostra13.universalimageloader.cache.memory.BaseMemoryCache;
import java.lang.ref.Reference;
import java.lang.ref.WeakReference;

/* loaded from: universal-image-loader-1.9.3.jar:com/nostra13/universalimageloader/cache/memory/impl/WeakMemoryCache.class */
public class WeakMemoryCache extends BaseMemoryCache {
    @Override // com.nostra13.universalimageloader.cache.memory.BaseMemoryCache
    protected Reference<Bitmap> createReference(Bitmap value) {
        return new WeakReference(value);
    }
}
