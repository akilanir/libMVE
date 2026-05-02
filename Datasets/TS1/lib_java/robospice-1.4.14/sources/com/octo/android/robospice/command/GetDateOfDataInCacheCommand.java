package com.octo.android.robospice.command;

import com.octo.android.robospice.SpiceManager;
import com.octo.android.robospice.SpiceService;
import com.octo.android.robospice.persistence.exception.CacheCreationException;
import com.octo.android.robospice.persistence.exception.CacheLoadingException;
import java.util.Date;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/command/GetDateOfDataInCacheCommand.class */
public class GetDateOfDataInCacheCommand extends SpiceManager.SpiceManagerCommand<Date> {
    private Class<?> clazz;
    private Object cacheKey;

    public GetDateOfDataInCacheCommand(SpiceManager spiceManager, Class<?> clazz, Object cacheKey) {
        super(spiceManager);
        this.clazz = clazz;
        this.cacheKey = cacheKey;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.octo.android.robospice.SpiceManager.SpiceManagerCommand
    public Date executeWhenBound(SpiceService spiceService) throws CacheCreationException {
        try {
            return spiceService.getDateOfDataInCache(this.clazz, this.cacheKey);
        } catch (CacheLoadingException e) {
            return null;
        }
    }
}
