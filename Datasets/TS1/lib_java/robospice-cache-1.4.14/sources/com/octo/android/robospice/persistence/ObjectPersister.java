package com.octo.android.robospice.persistence;

import android.app.Application;
import com.octo.android.robospice.persistence.exception.CacheLoadingException;
import com.octo.android.robospice.persistence.exception.CacheSavingException;
import java.util.List;

/* loaded from: robospice-cache-1.4.14.jar:com/octo/android/robospice/persistence/ObjectPersister.class */
public abstract class ObjectPersister<T> implements Persister, CacheCleaner {
    private boolean isAsyncSaveEnabled;
    private Application application;
    private Class<T> clazz;

    public abstract T loadDataFromCache(Object obj, long j) throws CacheLoadingException;

    public abstract List<T> loadAllDataFromCache() throws CacheLoadingException;

    public abstract List<Object> getAllCacheKeys();

    public abstract T saveDataToCacheAndReturnData(T t, Object obj) throws CacheSavingException;

    public abstract boolean removeDataFromCache(Object obj);

    @Override // com.octo.android.robospice.persistence.CacheCleaner
    public abstract void removeAllDataFromCache();

    public abstract long getCreationDateInCache(Object obj) throws CacheLoadingException;

    public abstract boolean isDataInCache(Object obj, long j);

    public ObjectPersister(Application application, Class<T> clazz) {
        this.application = application;
        this.clazz = clazz;
    }

    public Application getApplication() {
        return this.application;
    }

    public Class<T> getHandledClass() {
        return this.clazz;
    }

    @Override // com.octo.android.robospice.persistence.Persister
    public boolean canHandleClass(Class<?> clazz) {
        return clazz.equals(this.clazz);
    }

    public boolean isAsyncSaveEnabled() {
        return this.isAsyncSaveEnabled;
    }

    public void setAsyncSaveEnabled(boolean isAsyncSaveEnabled) {
        this.isAsyncSaveEnabled = isAsyncSaveEnabled;
    }
}
