package org.androidannotations.api.sharedpreferences;

import android.content.SharedPreferences;
import java.util.Set;

/* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/api/sharedpreferences/StringSetPrefField.class */
public final class StringSetPrefField extends AbstractPrefField<Set<String>> {
    StringSetPrefField(SharedPreferences sharedPreferences, String key, Set<String> defaultValue) {
        super(sharedPreferences, key, defaultValue);
    }

    @Override // org.androidannotations.api.sharedpreferences.AbstractPrefField
    public Set<String> getOr(Set<String> defaultValue) {
        return SharedPreferencesCompat.getStringSet(this.sharedPreferences, this.key, defaultValue);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.androidannotations.api.sharedpreferences.AbstractPrefField
    public void putInternal(Set<String> value) {
        SharedPreferences.Editor editor = this.sharedPreferences.edit();
        SharedPreferencesCompat.putStringSet(editor, this.key, value);
        apply(editor);
    }
}
