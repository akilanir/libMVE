package org.androidannotations.api.sharedpreferences;

import android.content.SharedPreferences;

/* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/api/sharedpreferences/AbstractPrefField.class */
public abstract class AbstractPrefField<T> {
    protected final T defaultValue;
    protected final SharedPreferences sharedPreferences;
    protected final String key;

    public abstract T getOr(T t);

    protected abstract void putInternal(T t);

    public AbstractPrefField(SharedPreferences sharedPreferences, String key, T defaultValue) {
        this.sharedPreferences = sharedPreferences;
        this.key = key;
        this.defaultValue = defaultValue;
    }

    public final boolean exists() {
        return this.sharedPreferences.contains(this.key);
    }

    public String key() {
        return this.key;
    }

    public final T get() {
        return getOr(this.defaultValue);
    }

    public final void put(T value) {
        putInternal(value == null ? this.defaultValue : value);
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
