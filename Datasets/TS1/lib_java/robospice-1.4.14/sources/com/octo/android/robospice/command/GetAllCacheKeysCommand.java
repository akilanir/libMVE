package com.octo.android.robospice.command;

import com.octo.android.robospice.SpiceManager;
import com.octo.android.robospice.SpiceService;
import com.octo.android.robospice.persistence.exception.CacheCreationException;
import com.octo.android.robospice.persistence.exception.CacheLoadingException;
import java.util.List;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/command/GetAllCacheKeysCommand.class */
public class GetAllCacheKeysCommand extends SpiceManager.SpiceManagerCommand<List<Object>> {
    private Class<?> clazz;

    public GetAllCacheKeysCommand(SpiceManager spiceManager, Class<?> clazz) {
        super(spiceManager);
        this.clazz = clazz;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.octo.android.robospice.SpiceManager.SpiceManagerCommand
    public List<Object> executeWhenBound(SpiceService spiceService) throws CacheLoadingException, CacheCreationException {
        return spiceService.getAllCacheKeys(this.clazz);
    }
}
