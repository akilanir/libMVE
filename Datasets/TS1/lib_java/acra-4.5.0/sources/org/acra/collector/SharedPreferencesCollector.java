package org.acra.collector;

import android.content.Context;
import android.content.SharedPreferences;
import android.preference.PreferenceManager;
import java.util.Map;
import java.util.TreeMap;
import org.acra.ACRA;

/* loaded from: acra-4.5.0.jar:org/acra/collector/SharedPreferencesCollector.class */
final class SharedPreferencesCollector {
    SharedPreferencesCollector() {
    }

    public static String collect(Context context) {
        StringBuilder result = new StringBuilder();
        Map<String, SharedPreferences> shrdPrefs = new TreeMap<>();
        shrdPrefs.put("default", PreferenceManager.getDefaultSharedPreferences(context));
        String[] shrdPrefsIds = ACRA.getConfig().additionalSharedPreferences();
        if (shrdPrefsIds != null) {
            for (String shrdPrefId : shrdPrefsIds) {
                shrdPrefs.put(shrdPrefId, context.getSharedPreferences(shrdPrefId, 0));
            }
        }
        for (String prefsId : shrdPrefs.keySet()) {
            SharedPreferences prefs = shrdPrefs.get(prefsId);
            if (prefs != null) {
                Map<String, ?> kv = prefs.getAll();
                if (kv != null && kv.size() > 0) {
                    for (String key : kv.keySet()) {
                        if (!filteredKey(key)) {
                            if (kv.get(key) != null) {
                                result.append(prefsId).append('.').append(key).append('=').append(kv.get(key).toString()).append("\n");
                            } else {
                                result.append(prefsId).append('.').append(key).append('=').append("null\n");
                            }
                        }
                    }
                } else {
                    result.append(prefsId).append('=').append("empty\n");
                }
            } else {
                result.append("null\n");
            }
            result.append('\n');
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
