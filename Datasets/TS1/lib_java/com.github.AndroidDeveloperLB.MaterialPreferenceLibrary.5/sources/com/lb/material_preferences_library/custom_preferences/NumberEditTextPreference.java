package com.lb.material_preferences_library.custom_preferences;

import android.annotation.TargetApi;
import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;

/* loaded from: com.github.AndroidDeveloperLB.MaterialPreferenceLibrary.5.jar:com/lb/material_preferences_library/custom_preferences/NumberEditTextPreference.class */
public class NumberEditTextPreference extends EditTextPreference {
    public NumberEditTextPreference(Context context) {
        super(context);
    }

    public NumberEditTextPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public NumberEditTextPreference(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    @Override // android.preference.Preference
    @TargetApi(17)
    protected View onCreateView(ViewGroup parent) {
        View view = super.onCreateView(parent);
        return view;
    }

    @Override // com.lb.material_preferences_library.custom_preferences.EditTextPreference
    protected void onAddEditTextToDialogView(View dialogView, EditText editText) {
        super.onAddEditTextToDialogView(dialogView, editText);
        editText.setInputType(8194);
        editText.setSelectAllOnFocus(true);
    }
}
