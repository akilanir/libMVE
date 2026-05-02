package org.androidannotations.api.builder;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import org.androidannotations.api.builder.ActivityIntentBuilder;

/* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/api/builder/ActivityIntentBuilder.class */
public abstract class ActivityIntentBuilder<I extends ActivityIntentBuilder<I>> extends IntentBuilder<I> implements ActivityStarter {
    protected Bundle lastOptions;

    @Override // org.androidannotations.api.builder.ActivityStarter
    public abstract void startForResult(int i);

    public ActivityIntentBuilder(Context context, Class<?> clazz) {
        super(context, clazz);
    }

    public ActivityIntentBuilder(Context context, Intent intent) {
        super(context, intent);
    }

    @Override // org.androidannotations.api.builder.ActivityStarter
    public final void start() {
        startForResult(-1);
    }

    public ActivityStarter withOptions(Bundle options) {
        this.lastOptions = options;
        return this;
    }
}
