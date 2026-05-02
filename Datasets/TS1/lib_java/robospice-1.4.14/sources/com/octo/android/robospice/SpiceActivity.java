package com.octo.android.robospice;

import android.app.Activity;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/SpiceActivity.class */
public class SpiceActivity extends Activity {
    private final SpiceManager spiceManager = new SpiceManager(SpiceService.class);

    @Override // android.app.Activity
    protected void onStart() {
        this.spiceManager.start(this);
        super.onStart();
    }

    @Override // android.app.Activity
    protected void onStop() {
        this.spiceManager.shouldStop();
        super.onStop();
    }

    public SpiceManager getSpiceManager() {
        return this.spiceManager;
    }
}
