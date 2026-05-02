package org.androidannotations.api.builder;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import org.androidannotations.api.builder.ActivityIntentBuilder;

/* loaded from: androidannotations-api-3.2.jar:org/androidannotations/api/builder/ActivityIntentBuilder.class */
public abstract class ActivityIntentBuilder<I extends ActivityIntentBuilder<I>> extends IntentBuilder<I> {
    public ActivityIntentBuilder(Context context, Class<?> clazz) {
        super(context, clazz);
    }

    public ActivityIntentBuilder(Context context, Intent intent) {
        super(context, intent);
    }

    public void start() {
        this.context.startActivity(this.intent);
    }

    public void startForResult(int requestCode) {
        if (this.context instanceof Activity) {
            ((Activity) this.context).startActivityForResult(this.intent, requestCode);
        } else {
            this.context.startActivity(this.intent);
        }
    }
}
