package com.octo.android.robospice.persistence.memory;

import android.graphics.Bitmap;
import com.octo.android.robospice.persistence.ObjectPersister;

/* loaded from: robospice-cache-1.4.14.jar:com/octo/android/robospice/persistence/memory/LruCacheBitmapObjectPersister.class */
public class LruCacheBitmapObjectPersister extends LruCacheObjectPersister<Bitmap> {
    public LruCacheBitmapObjectPersister(int lruCacheSize) {
        super(Bitmap.class, new BitmapLruCache(lruCacheSize));
    }

    public LruCacheBitmapObjectPersister(ObjectPersister<Bitmap> decoratedPersister, int lruCacheSize) {
        super(decoratedPersister, new BitmapLruCache(lruCacheSize));
    }
}
