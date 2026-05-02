package com.octo.android.robospice.command;

import com.octo.android.robospice.SpiceManager;
import com.octo.android.robospice.SpiceService;
import com.octo.android.robospice.persistence.exception.CacheCreationException;
import com.octo.android.robospice.persistence.exception.CacheLoadingException;
import java.util.List;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/command/GetAllDataFromCacheCommand.class */
public class GetAllDataFromCacheCommand<T> extends SpiceManager.SpiceManagerCommand<List<T>> {
    private Class<T> clazz;

    public GetAllDataFromCacheCommand(SpiceManager spiceManager, Class<T> clazz) {
        super(spiceManager);
        this.clazz = clazz;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.octo.android.robospice.SpiceManager.SpiceManagerCommand
    public List<T> executeWhenBound(SpiceService spiceService) throws CacheLoadingException, CacheCreationException {
        return spiceService.loadAllDataFromCache(this.clazz);
    }
}
