package com.octo.android.robospice.persistence.memory;

import com.octo.android.robospice.persistence.ObjectPersister;
import com.octo.android.robospice.persistence.exception.CacheLoadingException;
import com.octo.android.robospice.persistence.exception.CacheSavingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import roboguice.util.temp.Ln;

/* loaded from: robospice-cache-1.4.14.jar:com/octo/android/robospice/persistence/memory/LruCacheObjectPersister.class */
public class LruCacheObjectPersister<T> extends ObjectPersister<T> {
    private LruCache<Object, CacheItem<T>> lruCache;
    private ObjectPersister<T> decoratedPersister;

    public LruCacheObjectPersister(Class<T> clazz, LruCache<Object, CacheItem<T>> lruCache) {
        super(null, clazz);
        this.lruCache = lruCache;
    }

    public LruCacheObjectPersister(ObjectPersister<T> decoratedPersister, LruCache<Object, CacheItem<T>> lruCache) {
        super(decoratedPersister.getApplication(), decoratedPersister.getHandledClass());
        this.decoratedPersister = decoratedPersister;
        this.lruCache = lruCache;
    }

    public ObjectPersister<T> getDecoratedPersister() {
        return this.decoratedPersister;
    }

    public LruCache<Object, CacheItem<T>> getLruCache() {
        return this.lruCache;
    }

    @Override // com.octo.android.robospice.persistence.ObjectPersister
    public T loadDataFromCache(Object cacheKey, long maxTimeInCacheBeforeExpiry) throws CacheLoadingException {
        T data;
        CacheItem<T> cacheItem = this.lruCache.get(cacheKey);
        if (cacheItem == null) {
            Ln.d("Miss from lru cache for %s", cacheKey);
            if (this.decoratedPersister == null || (data = this.decoratedPersister.loadDataFromCache(cacheKey, maxTimeInCacheBeforeExpiry)) == null) {
                return null;
            }
            CacheItem<T> item = new CacheItem<>(this.decoratedPersister.getCreationDateInCache(cacheKey), data);
            Ln.d("Put in lru cache after miss", new Object[0]);
            this.lruCache.put(cacheKey, item);
            return data;
        }
        Ln.d("Hit from lru cache for %s", cacheKey);
        boolean dataCanExpire = maxTimeInCacheBeforeExpiry != 0;
        boolean dataIsNotExpired = System.currentTimeMillis() - cacheItem.getCreationDate() <= maxTimeInCacheBeforeExpiry;
        if (!dataCanExpire || dataIsNotExpired) {
            return cacheItem.getData();
        }
        return null;
    }

    @Override // com.octo.android.robospice.persistence.ObjectPersister
    public T saveDataToCacheAndReturnData(T data, Object cacheKey) throws CacheSavingException {
        CacheItem<T> itemToCache = new CacheItem<>(data);
        this.lruCache.put(cacheKey, itemToCache);
        Ln.d("Put in lru cache for %s", cacheKey);
        if (this.decoratedPersister != null) {
            this.decoratedPersister.saveDataToCacheAndReturnData(data, cacheKey);
        }
        return data;
    }

    @Override // com.octo.android.robospice.persistence.ObjectPersister
    public boolean isDataInCache(Object cacheKey, long maxTimeInCacheBeforeExpiry) {
        CacheItem<T> cacheItem = this.lruCache.get(cacheKey);
        if (cacheItem == null) {
            if (this.decoratedPersister != null) {
                return this.decoratedPersister.isDataInCache(cacheKey, maxTimeInCacheBeforeExpiry);
            }
            return false;
        }
        boolean dataCanExpire = maxTimeInCacheBeforeExpiry != 0;
        boolean dataIsNotExpired = System.currentTimeMillis() - cacheItem.getCreationDate() <= maxTimeInCacheBeforeExpiry;
        return !dataCanExpire || dataIsNotExpired;
    }

    @Override // com.octo.android.robospice.persistence.ObjectPersister
    public long getCreationDateInCache(Object cacheKey) throws CacheLoadingException {
        CacheItem<T> cacheItem = this.lruCache.get(cacheKey);
        if (cacheItem != null) {
            return cacheItem.getCreationDate();
        }
        if (this.decoratedPersister != null) {
            return this.decoratedPersister.getCreationDateInCache(cacheKey);
        }
        throw new CacheLoadingException("Data could not be found in cache for cacheKey=" + cacheKey);
    }

    @Override // com.octo.android.robospice.persistence.ObjectPersister
    public List<T> loadAllDataFromCache() throws CacheLoadingException {
        if (this.decoratedPersister != null) {
            return this.decoratedPersister.loadAllDataFromCache();
        }
        Map<Object, CacheItem<T>> cacheMap = this.lruCache.snapshot();
        List<T> allData = new ArrayList<>();
        for (CacheItem<T> item : cacheMap.values()) {
            allData.add(item.getData());
        }
        return allData;
    }

    @Override // com.octo.android.robospice.persistence.ObjectPersister
    public List<Object> getAllCacheKeys() {
        if (this.decoratedPersister != null) {
            return this.decoratedPersister.getAllCacheKeys();
        }
        return new ArrayList(this.lruCache.snapshot().keySet());
    }

    @Override // com.octo.android.robospice.persistence.ObjectPersister
    public boolean removeDataFromCache(Object cacheKey) {
        boolean result = false;
        if (this.decoratedPersister != null) {
            result = this.decoratedPersister.removeDataFromCache(cacheKey);
        }
        return result || this.lruCache.remove(cacheKey) != null;
    }

    @Override // com.octo.android.robospice.persistence.ObjectPersister, com.octo.android.robospice.persistence.CacheCleaner
    public void removeAllDataFromCache() {
        this.lruCache.evictAll();
        if (this.decoratedPersister != null) {
            this.decoratedPersister.removeAllDataFromCache();
        }
    }
}
