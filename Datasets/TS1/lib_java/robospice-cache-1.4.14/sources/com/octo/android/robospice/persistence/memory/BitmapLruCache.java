package com.octo.android.robospice.persistence.memory;

import android.annotation.TargetApi;
import android.graphics.Bitmap;
import android.os.Build;

/* loaded from: robospice-cache-1.4.14.jar:com/octo/android/robospice/persistence/memory/BitmapLruCache.class */
public class BitmapLruCache extends LruCache<Object, CacheItem<Bitmap>> {
    public BitmapLruCache(int maxSize) {
        super(maxSize);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.octo.android.robospice.persistence.memory.LruCache
    @TargetApi(12)
    public int sizeOf(Object key, CacheItem<Bitmap> value) {
        Bitmap data = value.getData();
        if (Build.VERSION.SDK_INT < 12) {
            return data.getRowBytes() * data.getHeight();
        }
        return data.getByteCount();
    }
}
