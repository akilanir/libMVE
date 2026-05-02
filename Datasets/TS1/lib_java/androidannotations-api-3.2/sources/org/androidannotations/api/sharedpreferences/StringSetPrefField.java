package org.androidannotations.api.sharedpreferences;

import android.content.SharedPreferences;
import java.util.Set;

/* loaded from: androidannotations-api-3.2.jar:org/androidannotations/api/sharedpreferences/StringSetPrefField.class */
public final class StringSetPrefField extends AbstractPrefField {
    private final Set<String> defaultValue;

    StringSetPrefField(SharedPreferences sharedPreferences, String key, Set<String> defaultValue) {
        super(sharedPreferences, key);
        this.defaultValue = defaultValue;
    }

    public Set<String> get() {
        return getOr(this.defaultValue);
    }

    public Set<String> getOr(Set<String> defaultValue) {
        return SharedPreferencesCompat.getStringSet(this.sharedPreferences, this.key, defaultValue);
    }

    public void put(Set<String> value) {
        SharedPreferences.Editor editor = this.sharedPreferences.edit();
        SharedPreferencesCompat.putStringSet(editor, this.key, value);
        apply(editor);
    }
}
