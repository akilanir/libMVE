package com.octo.android.robospice.command;

import com.octo.android.robospice.SpiceManager;
import com.octo.android.robospice.SpiceService;
import com.octo.android.robospice.request.listener.SpiceServiceListener;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/command/AddSpiceServiceListenerCommand.class */
public class AddSpiceServiceListenerCommand extends SpiceManager.SpiceManagerCommand<Void> {
    private SpiceServiceListener spiceServiceListener;

    public AddSpiceServiceListenerCommand(SpiceManager spiceManager, SpiceServiceListener spiceServiceListener) {
        super(spiceManager);
        this.spiceServiceListener = spiceServiceListener;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.octo.android.robospice.SpiceManager.SpiceManagerCommand
    public Void executeWhenBound(SpiceService spiceService) {
        spiceService.addSpiceServiceListener(this.spiceServiceListener);
        return null;
    }
}
