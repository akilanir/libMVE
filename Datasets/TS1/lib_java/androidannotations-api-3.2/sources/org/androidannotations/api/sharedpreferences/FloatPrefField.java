package org.androidannotations.api.sharedpreferences;

import android.content.SharedPreferences;

/* loaded from: androidannotations-api-3.2.jar:org/androidannotations/api/sharedpreferences/FloatPrefField.class */
public final class FloatPrefField extends AbstractPrefField {
    private final float defaultValue;

    FloatPrefField(SharedPreferences sharedPreferences, String key, float defaultValue) {
        super(sharedPreferences, key);
        this.defaultValue = defaultValue;
    }

    public float get() {
        return getOr(this.defaultValue);
    }

    public float getOr(float defaultValue) {
        try {
            return this.sharedPreferences.getFloat(this.key, defaultValue);
        } catch (ClassCastException e) {
            try {
                String value = this.sharedPreferences.getString(this.key, "" + defaultValue);
                return Float.parseFloat(value);
            } catch (Exception e2) {
                throw e;
            }
        }
    }

    public void put(float value) {
        apply(edit().putFloat(this.key, value));
    }
}
