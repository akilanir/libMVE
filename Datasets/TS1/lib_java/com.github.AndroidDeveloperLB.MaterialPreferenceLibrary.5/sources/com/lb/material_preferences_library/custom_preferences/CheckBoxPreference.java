package com.lb.material_preferences_library.custom_preferences;

import android.content.Context;
import android.content.res.TypedArray;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Checkable;
import com.lb.material_preferences_library.R;

/* loaded from: com.github.AndroidDeveloperLB.MaterialPreferenceLibrary.5.jar:com/lb/material_preferences_library/custom_preferences/CheckBoxPreference.class */
public class CheckBoxPreference extends TwoStatePreference {
    public CheckBoxPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public CheckBoxPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }

    @Override // com.lb.material_preferences_library.custom_preferences.Preference
    protected void init(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super.init(context, attrs, defStyleAttr, defStyleRes);
        setWidgetLayoutResource(R.layout.mpl__preference_widget_checkbox);
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.CheckBoxPreference, defStyleAttr, defStyleRes);
        setSummaryOn(a.getString(R.styleable.CheckBoxPreference_summaryOn));
        setSummaryOff(a.getString(R.styleable.CheckBoxPreference_summaryOff));
        setDisableDependentsState(a.getBoolean(R.styleable.CheckBoxPreference_disableDependentsState, false));
        a.recycle();
    }

    public CheckBoxPreference(Context context, AttributeSet attrs) {
        this(context, attrs, R.attr.checkBoxPreferenceStyle);
    }

    public CheckBoxPreference(Context context) {
        this(context, null);
    }

    @Override // com.lb.material_preferences_library.custom_preferences.Preference, android.preference.Preference
    protected void onBindView(View view) {
        super.onBindView(view);
        KeyEvent.Callback findViewById = view.findViewById(android.R.id.checkbox);
        if (findViewById != null && (findViewById instanceof Checkable)) {
            ((Checkable) findViewById).setChecked(this.mChecked);
        }
        syncSummaryView(view);
    }
}
