package org.acra.prefs;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.support.annotation.NonNull;
import org.acra.config.ACRAConfiguration;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/prefs/SharedPreferencesFactory.class */
public class SharedPreferencesFactory {
    private final Context context;
    private final ACRAConfiguration config;

    public SharedPreferencesFactory(@NonNull Context context, @NonNull ACRAConfiguration config) {
        this.context = context;
        this.config = config;
    }

    @NonNull
    public SharedPreferences create() {
        if (this.context == null) {
            throw new IllegalStateException("Cannot call ACRA.getACRASharedPreferences() before ACRA.init().");
        }
        if (!"".equals(this.config.sharedPreferencesName())) {
            return this.context.getSharedPreferences(this.config.sharedPreferencesName(), this.config.sharedPreferencesMode());
        }
        return PreferenceManager.getDefaultSharedPreferences(this.context);
    }
}
