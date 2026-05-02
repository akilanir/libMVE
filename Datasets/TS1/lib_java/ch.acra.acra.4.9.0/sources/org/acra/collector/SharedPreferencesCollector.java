package org.acra.collector;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import android.support.annotation.NonNull;
import java.util.Iterator;
import java.util.Map;
import java.util.TreeMap;
import org.acra.ACRA;
import org.acra.config.ACRAConfiguration;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/collector/SharedPreferencesCollector.class */
final class SharedPreferencesCollector {
    private final Context context;
    private final ACRAConfiguration config;

    SharedPreferencesCollector(@NonNull Context context, @NonNull ACRAConfiguration config) {
        this.context = context;
        this.config = config;
    }

    @NonNull
    public String collect() {
        StringBuilder result = new StringBuilder();
        Map<String, SharedPreferences> sharedPrefs = new TreeMap<>();
        sharedPrefs.put("default", PreferenceManager.getDefaultSharedPreferences(this.context));
        Iterator<String> it = this.config.additionalSharedPreferences().iterator();
        while (it.hasNext()) {
            String sharedPrefId = it.next();
            sharedPrefs.put(sharedPrefId, this.context.getSharedPreferences(sharedPrefId, 0));
        }
        for (Map.Entry<String, SharedPreferences> entry : sharedPrefs.entrySet()) {
            String sharedPrefId2 = entry.getKey();
            SharedPreferences prefs = entry.getValue();
            Map<String, ?> prefEntries = prefs.getAll();
            if (prefEntries.isEmpty()) {
                result.append(sharedPrefId2).append('=').append("empty\n");
            } else {
                for (Map.Entry<String, ?> prefEntry : prefEntries.entrySet()) {
                    if (filteredKey(prefEntry.getKey())) {
                        if (ACRA.DEV_LOGGING) {
                            ACRA.log.d(ACRA.LOG_TAG, "Filtered out sharedPreference=" + sharedPrefId2 + "  key=" + prefEntry.getKey() + " due to filtering rule");
                        }
                    } else {
                        Object prefValue = prefEntry.getValue();
                        result.append(sharedPrefId2).append('.').append(prefEntry.getKey()).append('=');
                        result.append(prefValue == null ? "null" : prefValue.toString());
                        result.append('\n');
                    }
                }
                result.append('\n');
            }
        }
        return result.toString();
    }

    private boolean filteredKey(@NonNull String key) {
        Iterator<String> it = this.config.excludeMatchingSharedPreferencesKeys().iterator();
        while (it.hasNext()) {
            String regex = it.next();
            if (key.matches(regex)) {
                return true;
            }
        }
        return false;
    }
}
