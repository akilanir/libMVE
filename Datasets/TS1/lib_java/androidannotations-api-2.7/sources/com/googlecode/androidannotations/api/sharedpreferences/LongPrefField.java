package com.googlecode.androidannotations.api.sharedpreferences;

import android.content.SharedPreferences;

/* loaded from: androidannotations-api-2.7.jar:com/googlecode/androidannotations/api/sharedpreferences/LongPrefField.class */
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
        return this.sharedPreferences.getLong(this.key, defaultValue);
    }

    public void put(long value) {
        apply(edit().putLong(this.key, value));
    }
}
