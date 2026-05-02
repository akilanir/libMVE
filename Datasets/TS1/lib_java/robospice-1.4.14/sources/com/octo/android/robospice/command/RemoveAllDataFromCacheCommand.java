package com.octo.android.robospice.command;

import com.octo.android.robospice.SpiceManager;
import com.octo.android.robospice.SpiceService;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/command/RemoveAllDataFromCacheCommand.class */
public class RemoveAllDataFromCacheCommand extends SpiceManager.SpiceManagerCommand<Void> {
    public RemoveAllDataFromCacheCommand(SpiceManager spiceManager) {
        super(spiceManager);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.octo.android.robospice.SpiceManager.SpiceManagerCommand
    public Void executeWhenBound(SpiceService spiceService) {
        spiceService.removeAllDataFromCache();
        return null;
    }
}
