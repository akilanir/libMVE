package com.octo.android.robospice.command;

import com.octo.android.robospice.SpiceManager;
import com.octo.android.robospice.SpiceService;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/command/SetFailOnCacheErrorCommand.class */
public class SetFailOnCacheErrorCommand extends SpiceManager.SpiceManagerCommand<Void> {
    private final boolean failOnCacheError;

    public SetFailOnCacheErrorCommand(SpiceManager spiceManager, boolean failOnCacheError) {
        super(spiceManager);
        this.failOnCacheError = failOnCacheError;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.octo.android.robospice.SpiceManager.SpiceManagerCommand
    public Void executeWhenBound(SpiceService spiceService) {
        spiceService.setFailOnCacheError(this.failOnCacheError);
        return null;
    }
}
