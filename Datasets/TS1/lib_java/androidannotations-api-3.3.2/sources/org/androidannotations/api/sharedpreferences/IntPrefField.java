package org.androidannotations.api.sharedpreferences;

import android.content.SharedPreferences;

/* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/api/sharedpreferences/IntPrefField.class */
public final class IntPrefField extends AbstractPrefField<Integer> {
    IntPrefField(SharedPreferences sharedPreferences, String key, Integer defaultValue) {
        super(sharedPreferences, key, defaultValue);
    }

    @Override // org.androidannotations.api.sharedpreferences.AbstractPrefField
    public Integer getOr(Integer defaultValue) {
        try {
            return Integer.valueOf(this.sharedPreferences.getInt(this.key, defaultValue.intValue()));
        } catch (ClassCastException e) {
            try {
                String value = this.sharedPreferences.getString(this.key, "" + defaultValue);
                return Integer.valueOf(Integer.parseInt(value));
            } catch (Exception e2) {
                throw e;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.androidannotations.api.sharedpreferences.AbstractPrefField
    public void putInternal(Integer value) {
        apply(edit().putInt(this.key, value.intValue()));
    }
}
