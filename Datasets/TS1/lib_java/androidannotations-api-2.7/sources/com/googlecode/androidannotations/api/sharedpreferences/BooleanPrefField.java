package com.googlecode.androidannotations.api.sharedpreferences;

import android.content.SharedPreferences;

/* loaded from: androidannotations-api-2.7.jar:com/googlecode/androidannotations/api/sharedpreferences/BooleanPrefField.class */
public final class BooleanPrefField extends AbstractPrefField {
    private final boolean defaultValue;

    BooleanPrefField(SharedPreferences sharedPreferences, String key, boolean defaultValue) {
        super(sharedPreferences, key);
        this.defaultValue = defaultValue;
    }

    public boolean get() {
        return getOr(this.defaultValue);
    }

    public boolean getOr(boolean defaultValue) {
        return this.sharedPreferences.getBoolean(this.key, defaultValue);
    }

    public void put(boolean value) {
        apply(edit().putBoolean(this.key, value));
    }
}
