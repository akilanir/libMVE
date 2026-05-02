package com.googlecode.androidannotations.api.sharedpreferences;

import android.content.SharedPreferences;

/* loaded from: androidannotations-api-2.7.jar:com/googlecode/androidannotations/api/sharedpreferences/StringPrefField.class */
public final class StringPrefField extends AbstractPrefField {
    private final String defaultValue;

    StringPrefField(SharedPreferences sharedPreferences, String key, String defaultValue) {
        super(sharedPreferences, key);
        this.defaultValue = defaultValue;
    }

    public String get() {
        return getOr(this.defaultValue);
    }

    public String getOr(String defaultValue) {
        return this.sharedPreferences.getString(this.key, defaultValue);
    }

    public void put(String value) {
        apply(edit().putString(this.key, value));
    }
}
