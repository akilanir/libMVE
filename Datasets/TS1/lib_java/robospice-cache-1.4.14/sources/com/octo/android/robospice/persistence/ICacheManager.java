package com.octo.android.robospice.persistence;

import com.octo.android.robospice.persistence.exception.CacheCreationException;
import com.octo.android.robospice.persistence.exception.CacheLoadingException;
import com.octo.android.robospice.persistence.exception.CacheSavingException;
import java.util.Date;
import java.util.List;

@Deprecated
/* loaded from: robospice-cache-1.4.14.jar:com/octo/android/robospice/persistence/ICacheManager.class */
public interface ICacheManager {
    void addPersister(Persister persister);

    void removePersister(Persister persister);

    <T> List<Object> getAllCacheKeys(Class<T> cls);

    <T> T loadDataFromCache(Class<T> cls, Object obj, long j) throws CacheLoadingException, CacheCreationException;

    <T> List<T> loadAllDataFromCache(Class<T> cls) throws CacheLoadingException, CacheCreationException;

    <T> T saveDataToCacheAndReturnData(T t, Object obj) throws CacheCreationException, CacheSavingException;

    boolean isDataInCache(Class<?> cls, Object obj, long j) throws CacheCreationException;

    Date getDateOfDataInCache(Class<?> cls, Object obj) throws CacheCreationException, CacheLoadingException;

    boolean removeDataFromCache(Class<?> cls, Object obj);

    void removeAllDataFromCache(Class<?> cls);

    void removeAllDataFromCache();
}
