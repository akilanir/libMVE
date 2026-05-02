package com.googlecode.androidannotations.api.sharedpreferences;

import android.content.SharedPreferences;

/* loaded from: androidannotations-api-2.7.jar:com/googlecode/androidannotations/api/sharedpreferences/FloatPrefField.class */
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
        return this.sharedPreferences.getFloat(this.key, defaultValue);
    }

    public void put(float value) {
        apply(edit().putFloat(this.key, value));
    }
}
