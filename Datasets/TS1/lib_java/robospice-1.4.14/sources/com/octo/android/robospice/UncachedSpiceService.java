package com.octo.android.robospice;

import android.app.Application;
import com.octo.android.robospice.persistence.CacheManager;
import com.octo.android.robospice.persistence.exception.CacheCreationException;
import com.octo.android.robospice.persistence.exception.CacheSavingException;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/UncachedSpiceService.class */
public class UncachedSpiceService extends SpiceService {
    @Override // com.octo.android.robospice.SpiceService
    public CacheManager createCacheManager(Application application) {
        return new CacheManager() { // from class: com.octo.android.robospice.UncachedSpiceService.1
            public <T> T saveDataToCacheAndReturnData(T data, Object cacheKey) throws CacheSavingException, CacheCreationException {
                return data;
            }
        };
    }
}
