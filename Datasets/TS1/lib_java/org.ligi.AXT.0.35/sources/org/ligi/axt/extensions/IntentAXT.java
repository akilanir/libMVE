package org.ligi.axt.extensions;

import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import java.util.List;

/* loaded from: org.ligi.AXT.0.35.jar:org/ligi/axt/extensions/IntentAXT.class */
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

    public Intent makeExplicit(Context context) {
        PackageManager pm = context.getPackageManager();
        List<ResolveInfo> resolveInfo = pm.queryIntentServices(this.intent, 0);
        if (resolveInfo == null) {
            return null;
        }
        ResolveInfo serviceInfo = resolveInfo.get(0);
        String packageName = serviceInfo.serviceInfo.packageName;
        String className = serviceInfo.serviceInfo.name;
        ComponentName component = new ComponentName(packageName, className);
        return new Intent(this.intent).setComponent(component);
    }
}
