package org.androidannotations.api.sharedpreferences;

import android.content.SharedPreferences;

/* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/api/sharedpreferences/FloatPrefField.class */
public final class FloatPrefField extends AbstractPrefField<Float> {
    FloatPrefField(SharedPreferences sharedPreferences, String key, Float defaultValue) {
        super(sharedPreferences, key, defaultValue);
    }

    @Override // org.androidannotations.api.sharedpreferences.AbstractPrefField
    public Float getOr(Float defaultValue) {
        try {
            return Float.valueOf(this.sharedPreferences.getFloat(this.key, defaultValue.floatValue()));
        } catch (ClassCastException e) {
            try {
                String value = this.sharedPreferences.getString(this.key, "" + defaultValue);
                return Float.valueOf(Float.parseFloat(value));
            } catch (Exception e2) {
                throw e;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // org.androidannotations.api.sharedpreferences.AbstractPrefField
    public void putInternal(Float value) {
        apply(edit().putFloat(this.key, value.floatValue()));
    }
}
