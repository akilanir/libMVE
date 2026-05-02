package org.androidannotations.api.sharedpreferences;

import android.content.SharedPreferences;

/* loaded from: androidannotations-api-3.2.jar:org/androidannotations/api/sharedpreferences/AbstractPrefField.class */
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

    public String key() {
        return this.key;
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
