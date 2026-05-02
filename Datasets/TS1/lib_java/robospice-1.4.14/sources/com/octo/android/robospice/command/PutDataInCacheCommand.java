package com.octo.android.robospice.command;

import com.octo.android.robospice.SpiceManager;
import com.octo.android.robospice.SpiceService;
import com.octo.android.robospice.persistence.exception.CacheCreationException;
import com.octo.android.robospice.persistence.exception.CacheSavingException;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/command/PutDataInCacheCommand.class */
public class PutDataInCacheCommand<T> extends SpiceManager.SpiceManagerCommand<T> {
    private Object cacheKey;
    private T data;

    public PutDataInCacheCommand(SpiceManager spiceManager, T data, Object cacheKey) {
        super(spiceManager);
        this.data = data;
        this.cacheKey = cacheKey;
    }

    @Override // com.octo.android.robospice.SpiceManager.SpiceManagerCommand
    protected T executeWhenBound(SpiceService spiceService) throws CacheSavingException, CacheCreationException {
        return (T) spiceService.putDataInCache(this.cacheKey, this.data);
    }
}
