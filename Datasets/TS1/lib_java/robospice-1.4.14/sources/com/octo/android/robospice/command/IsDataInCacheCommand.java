package com.octo.android.robospice.command;

import com.octo.android.robospice.SpiceManager;
import com.octo.android.robospice.SpiceService;
import com.octo.android.robospice.persistence.exception.CacheCreationException;
import com.octo.android.robospice.persistence.exception.CacheSavingException;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/command/IsDataInCacheCommand.class */
public class IsDataInCacheCommand extends SpiceManager.SpiceManagerCommand<Boolean> {
    private Class<?> clazz;
    private Object cacheKey;
    private long cacheExpiryDuration;

    public IsDataInCacheCommand(SpiceManager spiceManager, Class<?> clazz, Object cacheKey, long cacheExpiryDuration) {
        super(spiceManager);
        this.clazz = clazz;
        this.cacheExpiryDuration = cacheExpiryDuration;
        this.cacheKey = cacheKey;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.octo.android.robospice.SpiceManager.SpiceManagerCommand
    public Boolean executeWhenBound(SpiceService spiceService) throws CacheSavingException, CacheCreationException {
        return Boolean.valueOf(spiceService.isDataInCache(this.clazz, this.cacheKey, this.cacheExpiryDuration));
    }
}
