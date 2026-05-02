package com.googlecode.androidannotations.api.sharedpreferences;

import android.content.SharedPreferences;

/* loaded from: androidannotations-api-2.7.jar:com/googlecode/androidannotations/api/sharedpreferences/IntPrefField.class */
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
        return this.sharedPreferences.getInt(this.key, defaultValue);
    }

    public void put(int value) {
        apply(edit().putInt(this.key, value));
    }
}
