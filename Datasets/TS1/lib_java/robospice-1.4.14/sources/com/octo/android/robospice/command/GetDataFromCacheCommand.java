package com.octo.android.robospice.command;

import com.octo.android.robospice.SpiceManager;
import com.octo.android.robospice.SpiceService;
import com.octo.android.robospice.persistence.exception.CacheCreationException;
import com.octo.android.robospice.persistence.exception.CacheLoadingException;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/command/GetDataFromCacheCommand.class */
public class GetDataFromCacheCommand<T> extends SpiceManager.SpiceManagerCommand<T> {
    private Object cacheKey;
    private Class<T> clazz;

    public GetDataFromCacheCommand(SpiceManager spiceManager, Class<T> clazz, Object cacheKey) {
        super(spiceManager);
        this.clazz = clazz;
        this.cacheKey = cacheKey;
    }

    @Override // com.octo.android.robospice.SpiceManager.SpiceManagerCommand
    protected T executeWhenBound(SpiceService spiceService) throws CacheLoadingException, CacheCreationException {
        return (T) spiceService.getDataFromCache(this.clazz, this.cacheKey);
    }
}
