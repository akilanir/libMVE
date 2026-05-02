package com.lb.material_preferences_library.custom_preferences;

import android.content.Context;
import android.content.res.TypedArray;
import android.support.v7.widget.SwitchCompat;
import android.util.AttributeSet;
import android.view.View;
import android.widget.Checkable;
import android.widget.CompoundButton;
import com.lb.material_preferences_library.R;

/* loaded from: com.github.AndroidDeveloperLB.MaterialPreferenceLibrary.5.jar:com/lb/material_preferences_library/custom_preferences/SwitchPreference.class */
public class SwitchPreference extends TwoStatePreference {
    private final Listener mListener;
    private CharSequence mSwitchOn;
    private CharSequence mSwitchOff;

    /* loaded from: com.github.AndroidDeveloperLB.MaterialPreferenceLibrary.5.jar:com/lb/material_preferences_library/custom_preferences/SwitchPreference$Listener.class */
    private class Listener implements CompoundButton.OnCheckedChangeListener {
        private Listener() {
        }

        @Override // android.widget.CompoundButton.OnCheckedChangeListener
        public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
            if (!SwitchPreference.this.callChangeListener(Boolean.valueOf(isChecked))) {
                buttonView.setChecked(!isChecked);
            } else {
                SwitchPreference.this.setChecked(isChecked);
            }
        }
    }

    public SwitchPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mListener = new Listener();
    }

    public SwitchPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mListener = new Listener();
    }

    public SwitchPreference(Context context, AttributeSet attrs) {
        this(context, attrs, R.attr.switchPreferenceStyle);
    }

    public SwitchPreference(Context context) {
        this(context, null);
    }

    @Override // com.lb.material_preferences_library.custom_preferences.Preference
    protected void init(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super.init(context, attrs, defStyleAttr, defStyleRes);
        setWidgetLayoutResource(R.layout.mpl__switch_preference);
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.SwitchPreference, defStyleAttr, defStyleRes);
        setSummaryOn(a.getString(R.styleable.SwitchPreference_summaryOn));
        setSummaryOff(a.getString(R.styleable.SwitchPreference_summaryOff));
        setSwitchTextOn(a.getString(R.styleable.SwitchPreference_switchTextOn));
        setSwitchTextOff(a.getString(R.styleable.SwitchPreference_switchTextOff));
        setDisableDependentsState(a.getBoolean(R.styleable.SwitchPreference_disableDependentsState, false));
        a.recycle();
    }

    @Override // com.lb.material_preferences_library.custom_preferences.Preference, android.preference.Preference
    protected void onBindView(View view) {
        super.onBindView(view);
        SwitchCompat switchView = view.findViewById(android.R.id.checkbox);
        if (switchView != null && (switchView instanceof Checkable)) {
            if (switchView instanceof SwitchCompat) {
                switchView.setOnCheckedChangeListener((CompoundButton.OnCheckedChangeListener) null);
            }
            ((Checkable) switchView).setChecked(this.mChecked);
            if (switchView instanceof SwitchCompat) {
                SwitchCompat switchView2 = switchView;
                switchView2.setTextOn(this.mSwitchOn);
                switchView2.setTextOff(this.mSwitchOff);
                switchView2.setOnCheckedChangeListener(this.mListener);
            }
        }
        syncSummaryView(view);
    }

    public void setSwitchTextOn(CharSequence onText) {
        this.mSwitchOn = onText;
        notifyChanged();
    }

    public void setSwitchTextOff(CharSequence offText) {
        this.mSwitchOff = offText;
        notifyChanged();
    }

    public void setSwitchTextOn(int resId) {
        setSwitchTextOn(getContext().getString(resId));
    }

    public void setSwitchTextOff(int resId) {
        setSwitchTextOff(getContext().getString(resId));
    }

    public CharSequence getSwitchTextOn() {
        return this.mSwitchOn;
    }

    public CharSequence getSwitchTextOff() {
        return this.mSwitchOff;
    }
}
