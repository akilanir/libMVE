package org.androidannotations.api.sharedpreferences;

import android.content.SharedPreferences;

/* loaded from: androidannotations-api-3.2.jar:org/androidannotations/api/sharedpreferences/IntPrefField.class */
public final class IntPrefField extends AbstractPrefField {
    private final int defaultValue;

    IntPrefField(SharedPreferences sharedPreferences, String key, int defaultValue) {
        super(sharedPreferences, key);
        this.defaultValue = defaultValue;
    }

    public int get() {
        return getOr(this.defaultValue);
    }

    public int getOr(int defaultValue) {
        try {
            return this.sharedPreferences.getInt(this.key, defaultValue);
        } catch (ClassCastException e) {
            try {
                String value = this.sharedPreferences.getString(this.key, "" + defaultValue);
                return Integer.parseInt(value);
            } catch (Exception e2) {
                throw e;
            }
        }
    }

    public void put(int value) {
        apply(edit().putInt(this.key, value));
    }
}
