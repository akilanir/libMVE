package org.androidannotations.api.sharedpreferences;

import android.content.SharedPreferences;

/* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/api/sharedpreferences/StringPrefField.class */
public final class StringPrefField extends AbstractPrefField<String> {
    StringPrefField(SharedPreferences sharedPreferences, String key, String defaultValue) {
        super(sharedPreferences, key, defaultValue);
    }

    @Override // org.androidannotations.api.sharedpreferences.AbstractPrefField
    public String getOr(String defaultValue) {
        return this.sharedPreferences.getString(this.key, defaultValue);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.androidannotations.api.sharedpreferences.AbstractPrefField
    public void putInternal(String value) {
        apply(edit().putString(this.key, value));
    }
}
