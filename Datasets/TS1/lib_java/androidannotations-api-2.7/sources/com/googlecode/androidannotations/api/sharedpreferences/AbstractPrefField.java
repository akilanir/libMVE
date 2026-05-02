package com.googlecode.androidannotations.api.sharedpreferences;

import android.content.SharedPreferences;

/* loaded from: androidannotations-api-2.7.jar:com/googlecode/androidannotations/api/sharedpreferences/AbstractPrefField.class */
public abstract class AbstractPrefField {
    protected final SharedPreferences sharedPreferences;
    protected final String key;

    public AbstractPrefField(SharedPreferences sharedPreferences, String key) {
        this.sharedPreferences = sharedPreferences;
        this.key = key;
    }

    public final boolean exists() {
        return this.sharedPreferences.contains(this.key);
    }

    public final void remove() {
        apply(edit().remove(this.key));
    }

    protected SharedPreferences.Editor edit() {
        return this.sharedPreferences.edit();
    }

    protected final void apply(SharedPreferences.Editor editor) {
        SharedPreferencesCompat.apply(editor);
    }
}
