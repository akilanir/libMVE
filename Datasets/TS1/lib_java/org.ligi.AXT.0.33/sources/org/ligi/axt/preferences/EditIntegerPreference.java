package org.ligi.axt.preferences;

import android.content.Context;
import android.preference.EditTextPreference;
import android.util.AttributeSet;

/* loaded from: org.ligi.AXT.0.33.jar:org/ligi/axt/preferences/EditIntegerPreference.class */
public class EditIntegerPreference extends EditTextPreference {
    public EditIntegerPreference(Context context) {
        super(context);
    }

    public EditIntegerPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public EditIntegerPreference(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    @Override // android.preference.EditTextPreference
    public String getText() {
        return String.valueOf(getSharedPreferences().getInt(getKey(), 0));
    }

    @Override // android.preference.EditTextPreference
    public void setText(String text) {
        getSharedPreferences().edit().putInt(getKey(), Integer.parseInt(text)).commit();
    }
}
