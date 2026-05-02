package org.androidannotations.api.support.app;

import android.app.IntentService;
import android.content.Intent;

/* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/api/support/app/AbstractIntentService.class */
public abstract class AbstractIntentService extends IntentService {
    public AbstractIntentService(String name) {
        super(name);
    }

    @Override // android.app.IntentService
    protected void onHandleIntent(Intent intent) {
    }
}
