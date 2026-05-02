package com.octo.android.robospice.command;

import com.octo.android.robospice.SpiceManager;
import com.octo.android.robospice.SpiceService;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/command/RemoveDataFromCacheCommand.class */
public class RemoveDataFromCacheCommand extends SpiceManager.SpiceManagerCommand<Void> {
    private final Class<?> clazz;
    private Object cacheKey;

    /* JADX WARN: Multi-variable type inference failed */
    public <T> RemoveDataFromCacheCommand(SpiceManager spiceManager, Class<T> cls, Object cacheKey) {
        super(spiceManager);
        this.clazz = cls;
        this.cacheKey = cacheKey;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.octo.android.robospice.SpiceManager.SpiceManagerCommand
    public Void executeWhenBound(SpiceService spiceService) {
        spiceService.removeDataFromCache(this.clazz, this.cacheKey);
        return null;
    }
}
