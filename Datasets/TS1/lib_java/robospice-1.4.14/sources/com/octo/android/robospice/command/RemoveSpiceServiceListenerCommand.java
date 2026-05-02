package com.octo.android.robospice.command;

import com.octo.android.robospice.SpiceManager;
import com.octo.android.robospice.SpiceService;
import com.octo.android.robospice.request.listener.SpiceServiceListener;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/command/RemoveSpiceServiceListenerCommand.class */
public class RemoveSpiceServiceListenerCommand extends SpiceManager.SpiceManagerCommand<Void> {
    private SpiceServiceListener spiceServiceListener;

    public RemoveSpiceServiceListenerCommand(SpiceManager spiceManager, SpiceServiceListener spiceServiceListener) {
        super(spiceManager);
        this.spiceServiceListener = spiceServiceListener;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.octo.android.robospice.SpiceManager.SpiceManagerCommand
    public Void executeWhenBound(SpiceService spiceService) {
        spiceService.removeSpiceServiceListener(this.spiceServiceListener);
        return null;
    }
}
