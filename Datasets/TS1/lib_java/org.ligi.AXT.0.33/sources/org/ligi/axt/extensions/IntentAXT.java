package org.ligi.axt.extensions;

import android.content.Intent;
import android.content.pm.PackageManager;

/* loaded from: org.ligi.AXT.0.33.jar:org/ligi/axt/extensions/IntentAXT.class */
public class IntentAXT {
    private final Intent intent;

    public IntentAXT(Intent intent) {
        this.intent = intent;
    }

    public boolean isIntentAvailable(PackageManager pm) {
        return isIntentAvailable(pm, 65536);
    }

    public boolean isIntentAvailable(PackageManager pm, int flags) {
        return pm.queryIntentActivities(this.intent, flags).size() > 0;
    }

    public boolean isServiceAvailable(PackageManager pm) {
        return pm.queryIntentServices(this.intent, 65536).size() > 0;
    }

    public boolean isServiceAvailable(PackageManager pm, int flags) {
        return pm.queryIntentServices(this.intent, flags).size() > 0;
    }
}
