package com.octo.android.robospice.persistence.memory;

import android.annotation.TargetApi;

/* loaded from: robospice-cache-1.4.14.jar:com/octo/android/robospice/persistence/memory/StringLruCache.class */
public class StringLruCache extends LruCache<Object, CacheItem<String>> {
    public StringLruCache(int maxSize) {
        super(maxSize);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.octo.android.robospice.persistence.memory.LruCache
    @TargetApi(12)
    public int sizeOf(Object key, CacheItem<String> value) {
        String data = value.getData();
        return data.length();
    }
}
