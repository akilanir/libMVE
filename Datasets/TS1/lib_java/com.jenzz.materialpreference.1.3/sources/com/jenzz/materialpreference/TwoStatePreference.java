package com.jenzz.materialpreference;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Parcel;
import android.os.Parcelable;
import android.preference.Preference;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;

/* loaded from: com.jenzz.materialpreference.1.3.jar:com/jenzz/materialpreference/TwoStatePreference.class */
public abstract class TwoStatePreference extends Preference {
    private CharSequence summaryOn;
    private CharSequence summaryOff;
    private boolean isChecked;
    private boolean isCheckedSet;
    private boolean disableDependentsState;

    public TwoStatePreference(Context context) {
        super(context);
    }

    public TwoStatePreference(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public TwoStatePreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public TwoStatePreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }

    @Override // android.preference.Preference
    protected void onClick() {
        super.onClick();
        boolean newValue = !isChecked();
        if (callChangeListener(Boolean.valueOf(newValue))) {
            setChecked(newValue);
        }
    }

    public void setChecked(boolean checked) {
        boolean changed = this.isChecked != checked;
        if (changed || !this.isCheckedSet) {
            this.isChecked = checked;
            this.isCheckedSet = true;
            persistBoolean(checked);
            if (changed) {
                notifyDependencyChange(shouldDisableDependents());
                notifyChanged();
            }
        }
    }

    public boolean isChecked() {
        return this.isChecked;
    }

    @Override // android.preference.Preference
    public boolean shouldDisableDependents() {
        boolean shouldDisable = this.disableDependentsState ? this.isChecked : !this.isChecked;
        return shouldDisable || super.shouldDisableDependents();
    }

    public void setSummaryOn(CharSequence summary) {
        this.summaryOn = summary;
        if (isChecked()) {
            notifyChanged();
        }
    }

    public void setSummaryOn(int summaryResId) {
        setSummaryOn(getContext().getString(summaryResId));
    }

    public CharSequence getSummaryOn() {
        return this.summaryOn;
    }

    public void setSummaryOff(CharSequence summary) {
        this.summaryOff = summary;
        if (!isChecked()) {
            notifyChanged();
        }
    }

    public void setSummaryOff(int summaryResId) {
        setSummaryOff(getContext().getString(summaryResId));
    }

    public CharSequence getSummaryOff() {
        return this.summaryOff;
    }

    public boolean getDisableDependentsState() {
        return this.disableDependentsState;
    }

    public void setDisableDependentsState(boolean disableDependentsState) {
        this.disableDependentsState = disableDependentsState;
    }

    @Override // android.preference.Preference
    protected Object onGetDefaultValue(TypedArray a, int index) {
        return Boolean.valueOf(a.getBoolean(index, false));
    }

    @Override // android.preference.Preference
    protected void onSetInitialValue(boolean restoreValue, Object defaultValue) {
        setChecked(restoreValue ? getPersistedBoolean(this.isChecked) : ((Boolean) defaultValue).booleanValue());
    }

    void syncSummaryView(View view) {
        boolean useDefaultSummary = true;
        if (this.isChecked && !TextUtils.isEmpty(this.summaryOn)) {
            this.summaryView.setText(this.summaryOn);
            useDefaultSummary = false;
        } else if (!this.isChecked && !TextUtils.isEmpty(this.summaryOff)) {
            this.summaryView.setText(this.summaryOff);
            useDefaultSummary = false;
        }
        if (useDefaultSummary) {
            CharSequence summary = getSummary();
            if (!TextUtils.isEmpty(summary)) {
                this.summaryView.setText(summary);
                useDefaultSummary = false;
            }
        }
        int newVisibility = 8;
        if (!useDefaultSummary) {
            newVisibility = 0;
        }
        if (newVisibility != this.summaryView.getVisibility()) {
            this.summaryView.setVisibility(newVisibility);
        }
    }

    @Override // android.preference.Preference
    protected Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        if (isPersistent()) {
            return superState;
        }
        SavedState myState = new SavedState(superState);
        myState.checked = isChecked();
        return myState;
    }

    @Override // android.preference.Preference
    protected void onRestoreInstanceState(Parcelable state) {
        if (state == null || !state.getClass().equals(SavedState.class)) {
            super.onRestoreInstanceState(state);
            return;
        }
        SavedState myState = (SavedState) state;
        super.onRestoreInstanceState(myState.getSuperState());
        setChecked(myState.checked);
    }

    /* loaded from: com.jenzz.materialpreference.1.3.jar:com/jenzz/materialpreference/TwoStatePreference$SavedState.class */
    static class SavedState extends Preference.BaseSavedState {
        boolean checked;
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: com.jenzz.materialpreference.TwoStatePreference.SavedState.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public SavedState createFromParcel(Parcel in) {
                return new SavedState(in);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            public SavedState[] newArray(int size) {
                return new SavedState[size];
            }
        };

        public SavedState(Parcel source) {
            super(source);
            this.checked = source.readInt() == 1;
        }

        @Override // android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel dest, int flags) {
            super.writeToParcel(dest, flags);
            dest.writeInt(this.checked ? 1 : 0);
        }

        public SavedState(Parcelable superState) {
            super(superState);
        }
    }
}
