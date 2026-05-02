package org.ligi.axt.extensions.misc;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;

/* loaded from: org.ligi.AXT.0.35.jar:org/ligi/axt/extensions/misc/CommonIntentStarter.class */
public class CommonIntentStarter {
    public final Context context;
    private boolean asNewTask = true;

    public CommonIntentStarter(Context context) {
        this.context = context;
    }

    public void openUrl(String urlString) {
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.setData(Uri.parse(urlString));
        start(intent);
    }

    public void shareUrl(String urlString) {
        Intent intent = new Intent("android.intent.action.SEND");
        intent.putExtra("android.intent.extra.TEXT", urlString);
        intent.setType("text/plain");
        start(intent);
    }

    public void activityFromClass(Class class2start) {
        Intent intent = new Intent(this.context, (Class<?>) class2start);
        start(intent);
    }

    public CommonIntentStarter noNewTask() {
        this.asNewTask = false;
        return this;
    }

    private void start(Intent intent) {
        if (this.asNewTask) {
            intent.addFlags(268435456);
        }
        this.context.startActivity(intent);
    }
}
