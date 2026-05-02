package org.acra.collector;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import java.util.Map;
import java.util.TreeMap;
import org.acra.ACRA;

/* loaded from: acra-4.6.2.jar:org/acra/collector/SharedPreferencesCollector.class */
final class SharedPreferencesCollector {
    SharedPreferencesCollector() {
    }

    public static String collect(Context context) {
        StringBuilder result = new StringBuilder();
        Map<String, SharedPreferences> sharedPrefs = new TreeMap<>();
        sharedPrefs.put("default", PreferenceManager.getDefaultSharedPreferences(context));
        String[] sharedPrefIds = ACRA.getConfig().additionalSharedPreferences();
        if (sharedPrefIds != null) {
            for (String sharedPrefId : sharedPrefIds) {
                sharedPrefs.put(sharedPrefId, context.getSharedPreferences(sharedPrefId, 0));
            }
        }
        for (Map.Entry<String, SharedPreferences> entry : sharedPrefs.entrySet()) {
            String sharedPrefId2 = entry.getKey();
            SharedPreferences prefs = entry.getValue();
            Map<String, ?> prefEntries = prefs.getAll();
            if (prefEntries.isEmpty()) {
                result.append(sharedPrefId2).append('=').append("empty\n");
            } else {
                for (String key : prefEntries.keySet()) {
                    if (filteredKey(key)) {
                        ACRA.log.d(ACRA.LOG_TAG, "Filtered out sharedPreference=" + sharedPrefId2 + "  key=" + key + " due to filtering rule");
                    } else {
                        Object prefValue = prefEntries.get(key);
                        result.append(sharedPrefId2).append('.').append(key).append('=');
                        result.append(prefValue == null ? "null" : prefValue.toString());
                        result.append("\n");
                    }
                }
                result.append('\n');
            }
        }
        return result.toString();
    }

    private static boolean filteredKey(String key) {
        String[] arr$ = ACRA.getConfig().excludeMatchingSharedPreferencesKeys();
        for (String regex : arr$) {
            if (key.matches(regex)) {
                return true;
            }
        }
        return false;
    }
}
