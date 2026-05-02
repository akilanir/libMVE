package org.androidannotations.api.sharedpreferences;

import android.content.SharedPreferences;

/* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/api/sharedpreferences/LongPrefField.class */
public final class LongPrefField extends AbstractPrefField<Long> {
    LongPrefField(SharedPreferences sharedPreferences, String key, Long defaultValue) {
        super(sharedPreferences, key, defaultValue);
    }

    @Override // org.androidannotations.api.sharedpreferences.AbstractPrefField
    public Long getOr(Long defaultValue) {
        try {
            return Long.valueOf(this.sharedPreferences.getLong(this.key, defaultValue.longValue()));
        } catch (ClassCastException e) {
            try {
                String value = this.sharedPreferences.getString(this.key, "" + defaultValue);
                return Long.valueOf(Long.parseLong(value));
            } catch (Exception e2) {
                throw e;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.androidannotations.api.sharedpreferences.AbstractPrefField
    public void putInternal(Long value) {
        apply(edit().putLong(this.key, value.longValue()));
    }
}
