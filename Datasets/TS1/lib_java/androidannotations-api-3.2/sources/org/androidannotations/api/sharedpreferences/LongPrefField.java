package org.androidannotations.api.sharedpreferences;

import android.content.SharedPreferences;

/* loaded from: androidannotations-api-3.2.jar:org/androidannotations/api/sharedpreferences/LongPrefField.class */
public final class LongPrefField extends AbstractPrefField {
    private final long defaultValue;

    LongPrefField(SharedPreferences sharedPreferences, String key, long defaultValue) {
        super(sharedPreferences, key);
        this.defaultValue = defaultValue;
    }

    public long get() {
        return getOr(this.defaultValue);
    }

    public long getOr(long defaultValue) {
        try {
            return this.sharedPreferences.getLong(this.key, defaultValue);
        } catch (ClassCastException e) {
            try {
                String value = this.sharedPreferences.getString(this.key, "" + defaultValue);
                return Long.parseLong(value);
            } catch (Exception e2) {
                throw e;
            }
        }
    }

    public void put(long value) {
        apply(edit().putLong(this.key, value));
    }
}
