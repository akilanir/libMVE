package org.ligi.axt.listeners;

import android.app.Activity;
import android.content.DialogInterface;

/* loaded from: org.ligi.AXT.0.35.jar:org/ligi/axt/listeners/ActivityFinishingOnCancelListener.class */
public class ActivityFinishingOnCancelListener implements DialogInterface.OnCancelListener {
    private final Activity activity2finish;

    public ActivityFinishingOnCancelListener(Activity activity2close) {
        this.activity2finish = activity2close;
    }

    @Override // android.content.DialogInterface.OnCancelListener
    public void onCancel(DialogInterface dialog) {
        dialog.dismiss();
        this.activity2finish.finish();
    }
}
