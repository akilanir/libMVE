package org.ligi.axt.views;

import android.app.Activity;
import android.view.View;

/* loaded from: org.ligi.AXT.0.35.jar:org/ligi/axt/views/ActivityFinishOnViewClickListener.class */
public class ActivityFinishOnViewClickListener implements View.OnClickListener {
    private Activity activity2finish;

    public ActivityFinishOnViewClickListener(Activity activity2finish) {
        this.activity2finish = activity2finish;
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        this.activity2finish.finish();
    }
}
