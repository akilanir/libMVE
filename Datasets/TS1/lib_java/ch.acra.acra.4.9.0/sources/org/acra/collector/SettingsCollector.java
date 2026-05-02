package org.acra.collector;

import android.content.Context;
import android.os.Build;
import android.provider.Settings;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.lang.reflect.Field;
import java.util.Iterator;
import org.acra.ACRA;
import org.acra.config.ACRAConfiguration;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/collector/SettingsCollector.class */
final class SettingsCollector {
    private static final String ERROR = "Error: ";
    private final Context context;
    private final ACRAConfiguration config;

    SettingsCollector(@NonNull Context context, @NonNull ACRAConfiguration config) {
        this.context = context;
        this.config = config;
    }

    @NonNull
    public String collectSystemSettings() {
        StringBuilder result = new StringBuilder();
        Field[] keys = Settings.System.class.getFields();
        for (Field key : keys) {
            if (!key.isAnnotationPresent(Deprecated.class) && key.getType() == String.class) {
                try {
                    Object value = Settings.System.getString(this.context.getContentResolver(), (String) key.get(null));
                    if (value != null) {
                        result.append(key.getName()).append('=').append(value).append('\n');
                    }
                } catch (IllegalAccessException e) {
                    ACRA.log.w(ACRA.LOG_TAG, ERROR, e);
                } catch (IllegalArgumentException e2) {
                    ACRA.log.w(ACRA.LOG_TAG, ERROR, e2);
                }
            }
        }
        return result.toString();
    }

    @NonNull
    public String collectSecureSettings() {
        StringBuilder result = new StringBuilder();
        Field[] keys = Settings.Secure.class.getFields();
        for (Field key : keys) {
            if (!key.isAnnotationPresent(Deprecated.class) && key.getType() == String.class && isAuthorized(key)) {
                try {
                    Object value = Settings.Secure.getString(this.context.getContentResolver(), (String) key.get(null));
                    if (value != null) {
                        result.append(key.getName()).append('=').append(value).append('\n');
                    }
                } catch (IllegalAccessException e) {
                    ACRA.log.w(ACRA.LOG_TAG, ERROR, e);
                } catch (IllegalArgumentException e2) {
                    ACRA.log.w(ACRA.LOG_TAG, ERROR, e2);
                }
            }
        }
        return result.toString();
    }

    @NonNull
    public String collectGlobalSettings() {
        if (Build.VERSION.SDK_INT < 17) {
            return "";
        }
        StringBuilder result = new StringBuilder();
        Field[] keys = Settings.Global.class.getFields();
        for (Field key : keys) {
            if (!key.isAnnotationPresent(Deprecated.class) && key.getType() == String.class && isAuthorized(key)) {
                try {
                    Object value = Settings.Global.getString(this.context.getContentResolver(), (String) key.get(null));
                    if (value != null) {
                        result.append(key.getName()).append('=').append(value).append('\n');
                    }
                } catch (IllegalAccessException e) {
                    ACRA.log.w(ACRA.LOG_TAG, ERROR, e);
                } catch (IllegalArgumentException e2) {
                    ACRA.log.w(ACRA.LOG_TAG, ERROR, e2);
                } catch (SecurityException e3) {
                    ACRA.log.w(ACRA.LOG_TAG, ERROR, e3);
                }
            }
        }
        return result.toString();
    }

    private boolean isAuthorized(@Nullable Field key) {
        if (key == null || key.getName().startsWith("WIFI_AP")) {
            return false;
        }
        Iterator<String> it = this.config.excludeMatchingSettingsKeys().iterator();
        while (it.hasNext()) {
            String regex = it.next();
            if (key.getName().matches(regex)) {
                return false;
            }
        }
        return true;
    }
}
