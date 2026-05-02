package com.octo.android.robospice.persistence;

import com.octo.android.robospice.persistence.exception.CacheCreationException;
import com.octo.android.robospice.persistence.exception.CacheLoadingException;
import com.octo.android.robospice.persistence.exception.CacheSavingException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;
import roboguice.util.temp.Ln;

/* loaded from: robospice-cache-1.4.14.jar:com/octo/android/robospice/persistence/CacheManager.class */
public class CacheManager implements ICacheManager {
    private Collection<Persister> listPersister = new ArrayList();
    private Map<ObjectPersisterFactory, List<ObjectPersister<?>>> mapFactoryToPersister = new HashMap();

    @Override // com.octo.android.robospice.persistence.ICacheManager
    public void addPersister(Persister persister) {
        this.listPersister.add(persister);
        if (persister instanceof ObjectPersisterFactory) {
            this.mapFactoryToPersister.put((ObjectPersisterFactory) persister, new CopyOnWriteArrayList());
        } else if (!(persister instanceof ObjectPersister)) {
            throw new RuntimeException(getClass().getSimpleName() + " only supports " + ObjectPersister.class.getSimpleName() + " or " + ObjectPersisterFactory.class.getSimpleName() + " instances.");
        }
    }

    @Override // com.octo.android.robospice.persistence.ICacheManager
    public void removePersister(Persister persister) {
        this.listPersister.remove(persister);
        if (persister instanceof ObjectPersisterFactory) {
            this.mapFactoryToPersister.remove(persister);
        }
    }

    @Override // com.octo.android.robospice.persistence.ICacheManager
    public <T> T loadDataFromCache(Class<T> clazz, Object cacheKey, long maxTimeInCacheBeforeExpiry) throws CacheLoadingException, CacheCreationException {
        return getObjectPersister(clazz).loadDataFromCache(cacheKey, maxTimeInCacheBeforeExpiry);
    }

    @Override // com.octo.android.robospice.persistence.ICacheManager
    public <T> T saveDataToCacheAndReturnData(T data, Object cacheKey) throws CacheSavingException, CacheCreationException {
        ObjectPersister<T> classCacheManager = getObjectPersister(data.getClass());
        return classCacheManager.saveDataToCacheAndReturnData(data, cacheKey);
    }

    @Override // com.octo.android.robospice.persistence.ICacheManager
    public boolean isDataInCache(Class<?> clazz, Object cacheKey, long maxTimeInCacheBeforeExpiry) throws CacheCreationException {
        return getObjectPersister(clazz).isDataInCache(cacheKey, maxTimeInCacheBeforeExpiry);
    }

    @Override // com.octo.android.robospice.persistence.ICacheManager
    public Date getDateOfDataInCache(Class<?> clazz, Object cacheKey) throws CacheLoadingException, CacheCreationException {
        return new Date(getObjectPersister(clazz).getCreationDateInCache(cacheKey));
    }

    @Override // com.octo.android.robospice.persistence.ICacheManager
    public boolean removeDataFromCache(Class<?> clazz, Object cacheKey) {
        try {
            return getObjectPersister(clazz).removeDataFromCache(cacheKey);
        } catch (CacheCreationException e) {
            Ln.e(e);
            return false;
        }
    }

    @Override // com.octo.android.robospice.persistence.ICacheManager
    public void removeAllDataFromCache(Class<?> clazz) {
        try {
            getObjectPersister(clazz).removeAllDataFromCache();
        } catch (CacheCreationException e) {
            Ln.e(e);
        }
    }

    @Override // com.octo.android.robospice.persistence.ICacheManager
    public <T> List<Object> getAllCacheKeys(Class<T> clazz) {
        try {
            return getObjectPersister(clazz).getAllCacheKeys();
        } catch (CacheCreationException e) {
            Ln.e(e);
            return Collections.emptyList();
        }
    }

    @Override // com.octo.android.robospice.persistence.ICacheManager
    public <T> List<T> loadAllDataFromCache(Class<T> clazz) throws CacheLoadingException, CacheCreationException {
        return getObjectPersister(clazz).loadAllDataFromCache();
    }

    @Override // com.octo.android.robospice.persistence.ICacheManager
    public void removeAllDataFromCache() {
        for (Persister persister : this.listPersister) {
            if (persister instanceof CacheCleaner) {
                ((CacheCleaner) persister).removeAllDataFromCache();
            }
            if (persister instanceof ObjectPersisterFactory) {
                ObjectPersisterFactory factory = (ObjectPersisterFactory) persister;
                List<ObjectPersister<?>> listPersisterForFactory = this.mapFactoryToPersister.get(factory);
                for (ObjectPersister<?> objectPersister : listPersisterForFactory) {
                    objectPersister.removeAllDataFromCache();
                }
            }
        }
    }

    protected <T> ObjectPersister<T> getObjectPersister(Class<T> clazz) throws CacheCreationException {
        for (Persister persister : this.listPersister) {
            if (persister.canHandleClass(clazz)) {
                if (persister instanceof ObjectPersister) {
                    return (ObjectPersister) persister;
                }
                if (persister instanceof ObjectPersisterFactory) {
                    ObjectPersisterFactory factory = (ObjectPersisterFactory) persister;
                    if (factory.canHandleClass(clazz)) {
                        List<ObjectPersister<?>> listPersisterForFactory = this.mapFactoryToPersister.get(factory);
                        Iterator i$ = listPersisterForFactory.iterator();
                        while (i$.hasNext()) {
                            ObjectPersister<T> objectPersister = (ObjectPersister) i$.next();
                            if (objectPersister.canHandleClass(clazz)) {
                                return objectPersister;
                            }
                        }
                        ObjectPersister<T> newPersister = factory.createObjectPersister(clazz);
                        newPersister.setAsyncSaveEnabled(factory.isAsyncSaveEnabled());
                        listPersisterForFactory.add(newPersister);
                        return newPersister;
                    }
                } else {
                    continue;
                }
            }
        }
        throw new RuntimeException("Class " + clazz.getName() + " is not handled by any registered ObjectPersister. Please add a Persister for this class inside the CacheManager of your SpiceService.");
    }
}
