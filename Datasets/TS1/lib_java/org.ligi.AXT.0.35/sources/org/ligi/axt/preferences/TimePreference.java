package org.ligi.axt.preferences;

import android.content.Context;
import android.preference.DialogPreference;
import android.util.AttributeSet;
import android.view.View;
import android.widget.TimePicker;

/* loaded from: org.ligi.AXT.0.35.jar:org/ligi/axt/preferences/TimePreference.class */
public class TimePreference extends DialogPreference implements TimePicker.OnTimeChangedListener {
    private static final String VALIDATION_EXPRESSION = "[0-2]*[0-9]:[0-5]*[0-9]";
    private String defaultValue;
    private int mHour;
    private int mMinute;

    public TimePreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mHour = 0;
        this.mMinute = 0;
        initialize();
    }

    public TimePreference(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mHour = 0;
        this.mMinute = 0;
        initialize();
    }

    private void initialize() {
        setPersistent(true);
    }

    @Override // android.preference.DialogPreference
    protected View onCreateDialogView() {
        TimePicker tp = new TimePicker(getContext());
        tp.setIs24HourView(true);
        tp.setOnTimeChangedListener(this);
        int h = getHour();
        int m = getMinute();
        if (h >= 0 && m >= 0) {
            tp.setCurrentHour(Integer.valueOf(h));
            tp.setCurrentMinute(Integer.valueOf(m));
        }
        return tp;
    }

    @Override // android.widget.TimePicker.OnTimeChangedListener
    public void onTimeChanged(TimePicker view, int hour, int minute) {
        this.mHour = hour;
        this.mMinute = minute;
    }

    @Override // android.preference.DialogPreference
    public void onDialogClosed(boolean positiveResult) {
        if (positiveResult && isPersistent()) {
            String result = this.mHour + ":" + this.mMinute;
            persistString(result);
            callChangeListener(result);
        }
    }

    @Override // android.preference.Preference
    public void setDefaultValue(Object defaultValue) {
        super.setDefaultValue(defaultValue);
        if (!(defaultValue instanceof String) || !((String) defaultValue).matches(VALIDATION_EXPRESSION)) {
            return;
        }
        this.defaultValue = (String) defaultValue;
    }

    private int getHour() {
        String time = getPersistedString(this.defaultValue);
        if (time == null || !time.matches(VALIDATION_EXPRESSION)) {
            return -1;
        }
        return Integer.valueOf(time.split(":")[0]).intValue();
    }

    private int getMinute() {
        String time = getPersistedString(this.defaultValue);
        if (time == null || !time.matches(VALIDATION_EXPRESSION)) {
            return -1;
        }
        return Integer.valueOf(time.split(":")[1]).intValue();
    }
}
