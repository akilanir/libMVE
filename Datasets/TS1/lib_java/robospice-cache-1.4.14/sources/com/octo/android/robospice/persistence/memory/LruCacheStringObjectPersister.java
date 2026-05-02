package com.octo.android.robospice.persistence.memory;

import com.octo.android.robospice.persistence.ObjectPersister;

/* loaded from: robospice-cache-1.4.14.jar:com/octo/android/robospice/persistence/memory/LruCacheStringObjectPersister.class */
public final class LruCacheStringObjectPersister extends LruCacheObjectPersister<String> {
    public LruCacheStringObjectPersister(int lruCacheSize) {
        super(String.class, new StringLruCache(lruCacheSize));
    }

    public LruCacheStringObjectPersister(ObjectPersister<String> decoratedPersister, int lruCacheSize) {
        super(decoratedPersister, new StringLruCache(lruCacheSize));
    }
}
