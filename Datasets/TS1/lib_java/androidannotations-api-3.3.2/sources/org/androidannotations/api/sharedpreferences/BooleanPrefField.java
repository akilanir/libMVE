package org.androidannotations.api.sharedpreferences;

import android.content.SharedPreferences;

/* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/api/sharedpreferences/BooleanPrefField.class */
public final class BooleanPrefField extends AbstractPrefField<Boolean> {
    BooleanPrefField(SharedPreferences sharedPreferences, String key, Boolean defaultValue) {
        super(sharedPreferences, key, defaultValue);
    }

    @Override // org.androidannotations.api.sharedpreferences.AbstractPrefField
    public Boolean getOr(Boolean defaultValue) {
        return Boolean.valueOf(this.sharedPreferences.getBoolean(this.key, defaultValue.booleanValue()));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.androidannotations.api.sharedpreferences.AbstractPrefField
    public void putInternal(Boolean value) {
        apply(edit().putBoolean(this.key, value.booleanValue()));
    }
}
