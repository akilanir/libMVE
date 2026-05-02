package org.ligi.axt.listeners;

import android.app.Activity;
import android.content.DialogInterface;

/* loaded from: org.ligi.AXT.0.33.jar:org/ligi/axt/listeners/ActivityFinishingOnClickListener.class */
public class ActivityFinishingOnClickListener implements DialogInterface.OnClickListener {
    private final Activity activity2finish;

    public ActivityFinishingOnClickListener(Activity activity2finish) {
        this.activity2finish = activity2finish;
    }

    @Override // android.content.DialogInterface.OnClickListener
    public void onClick(DialogInterface dialog, int which) {
        this.activity2finish.finish();
    }
}
