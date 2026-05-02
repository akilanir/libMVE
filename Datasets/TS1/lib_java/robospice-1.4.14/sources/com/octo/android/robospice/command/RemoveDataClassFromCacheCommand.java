package com.octo.android.robospice.command;

import com.octo.android.robospice.SpiceManager;
import com.octo.android.robospice.SpiceService;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/command/RemoveDataClassFromCacheCommand.class */
public class RemoveDataClassFromCacheCommand extends SpiceManager.SpiceManagerCommand<Void> {
    private final Class<?> clazz;

    /* JADX WARN: Multi-variable type inference failed */
    public <T> RemoveDataClassFromCacheCommand(SpiceManager spiceManager, Class<T> cls) {
        super(spiceManager);
        this.clazz = cls;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.octo.android.robospice.SpiceManager.SpiceManagerCommand
    public Void executeWhenBound(SpiceService spiceService) {
        spiceService.removeAllDataFromCache(this.clazz);
        return null;
    }
}
