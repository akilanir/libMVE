package org.acra.prefs;

import android.content.SharedPreferences;
import android.os.Build;
import android.support.annotation.NonNull;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/prefs/PrefUtils.class */
public final class PrefUtils {
    private PrefUtils() {
    }

    public static void save(@NonNull SharedPreferences.Editor editor) {
        if (Build.VERSION.SDK_INT >= 9) {
            editor.apply();
        } else {
            editor.commit();
        }
    }
}
