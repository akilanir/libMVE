package com.lb.material_preferences_library.custom_preferences;

import android.content.Context;
import android.content.DialogInterface;
import android.content.res.TypedArray;
import android.os.Parcel;
import android.os.Parcelable;
import android.preference.Preference;
import android.support.v7.app.AlertDialog;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.widget.ArrayAdapter;
import com.lb.material_preferences_library.BuildConfig;
import com.lb.material_preferences_library.R;

/* loaded from: com.github.AndroidDeveloperLB.MaterialPreferenceLibrary.5.jar:com/lb/material_preferences_library/custom_preferences/ListPreference.class */
public class ListPreference extends DialogPreference {
    private CharSequence[] mEntries;
    private CharSequence[] mEntryValues;
    private String mValue;
    private String mSummary;
    private int mClickedDialogEntryIndex;
    private boolean mValueSet;

    public ListPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }

    public ListPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public ListPreference(Context context, AttributeSet attrs) {
        this(context, attrs, R.attr.dialogPreferenceStyle);
    }

    public ListPreference(Context context) {
        this(context, null);
    }

    @Override // com.lb.material_preferences_library.custom_preferences.DialogPreference, com.lb.material_preferences_library.custom_preferences.Preference
    protected void init(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super.init(context, attrs, defStyleAttr, defStyleRes);
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.ListPreference, defStyleAttr, defStyleRes);
        this.mEntries = a.getTextArray(R.styleable.ListPreference_entries);
        this.mEntryValues = a.getTextArray(R.styleable.ListPreference_entryValues);
        a.recycle();
        this.mSummary = super.getSummary() == null ? null : super.getSummary().toString();
    }

    public void setEntries(CharSequence[] entries) {
        this.mEntries = entries;
    }

    public void setEntries(int entriesResId) {
        setEntries(getContext().getResources().getTextArray(entriesResId));
    }

    public CharSequence[] getEntries() {
        return this.mEntries;
    }

    public void setEntryValues(CharSequence[] entryValues) {
        this.mEntryValues = entryValues;
    }

    public void setEntryValues(int entryValuesResId) {
        setEntryValues(getContext().getResources().getTextArray(entryValuesResId));
    }

    public CharSequence[] getEntryValues() {
        return this.mEntryValues;
    }

    public void setValue(String value) {
        boolean changed = !TextUtils.equals(this.mValue, value);
        if (changed || !this.mValueSet) {
            this.mValue = value;
            this.mValueSet = true;
            persistString(value);
            if (changed) {
                notifyChanged();
            }
        }
    }

    @Override // android.preference.Preference
    public CharSequence getSummary() {
        CharSequence entry = getEntry();
        if (this.mSummary == null) {
            return super.getSummary();
        }
        String str = this.mSummary;
        Object[] objArr = new Object[1];
        objArr[0] = entry == null ? BuildConfig.FLAVOR : entry;
        return String.format(str, objArr);
    }

    @Override // android.preference.Preference
    public void setSummary(CharSequence summary) {
        super.setSummary(summary);
        if (summary == null && this.mSummary != null) {
            this.mSummary = null;
        } else if (summary != null && !summary.equals(this.mSummary)) {
            this.mSummary = summary.toString();
        }
    }

    public void setValueIndex(int index) {
        if (this.mEntryValues != null) {
            setValue(this.mEntryValues[index].toString());
        }
    }

    public String getValue() {
        return this.mValue;
    }

    public CharSequence getEntry() {
        int index = getValueIndex();
        if (index < 0 || this.mEntries == null) {
            return null;
        }
        return this.mEntries[index];
    }

    public int findIndexOfValue(String value) {
        if (value != null && this.mEntryValues != null) {
            for (int i = this.mEntryValues.length - 1; i >= 0; i--) {
                if (this.mEntryValues[i].equals(value)) {
                    return i;
                }
            }
            return -1;
        }
        return -1;
    }

    private int getValueIndex() {
        return findIndexOfValue(this.mValue);
    }

    @Override // com.lb.material_preferences_library.custom_preferences.DialogPreference
    protected void onPrepareDialogBuilder(AlertDialog.Builder builder) {
        super.onPrepareDialogBuilder(builder);
        if (this.mEntries == null || this.mEntryValues == null) {
            throw new IllegalStateException("ListPreference requires an entries array and an entryValues array.");
        }
        this.mClickedDialogEntryIndex = getValueIndex();
        builder.setSingleChoiceItems(new ArrayAdapter(getContext(), R.layout.mpl__simple_list_item_single_choice, this.mEntries), this.mClickedDialogEntryIndex, new DialogInterface.OnClickListener() { // from class: com.lb.material_preferences_library.custom_preferences.ListPreference.1
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                ListPreference.this.mClickedDialogEntryIndex = which;
                ListPreference.this.onClick(dialog, -1);
                dialog.dismiss();
            }
        });
        builder.setPositiveButton((CharSequence) null, (DialogInterface.OnClickListener) null);
    }

    @Override // com.lb.material_preferences_library.custom_preferences.DialogPreference
    protected void onDialogClosed(boolean positiveResult) {
        super.onDialogClosed(positiveResult);
        if (positiveResult && this.mClickedDialogEntryIndex >= 0 && this.mEntryValues != null) {
            String value = this.mEntryValues[this.mClickedDialogEntryIndex].toString();
            if (callChangeListener(value)) {
                setValue(value);
            }
        }
    }

    @Override // android.preference.Preference
    protected Object onGetDefaultValue(TypedArray a, int index) {
        return a.getString(index);
    }

    @Override // android.preference.Preference
    protected void onSetInitialValue(boolean restoreValue, Object defaultValue) {
        setValue(restoreValue ? getPersistedString(this.mValue) : (String) defaultValue);
    }

    @Override // com.lb.material_preferences_library.custom_preferences.DialogPreference, android.preference.Preference
    protected Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        if (isPersistent()) {
            return superState;
        }
        SavedState myState = new SavedState(superState);
        myState.value = getValue();
        return myState;
    }

    @Override // com.lb.material_preferences_library.custom_preferences.DialogPreference, android.preference.Preference
    protected void onRestoreInstanceState(Parcelable state) {
        if (state == null || !state.getClass().equals(SavedState.class)) {
            super.onRestoreInstanceState(state);
            return;
        }
        SavedState myState = (SavedState) state;
        super.onRestoreInstanceState(myState.getSuperState());
        setValue(myState.value);
    }

    /* loaded from: com.github.AndroidDeveloperLB.MaterialPreferenceLibrary.5.jar:com/lb/material_preferences_library/custom_preferences/ListPreference$SavedState.class */
    private static class SavedState extends Preference.BaseSavedState {
        String value;
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: com.lb.material_preferences_library.custom_preferences.ListPreference.SavedState.1
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
            this.value = source.readString();
        }

        @Override // android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel dest, int flags) {
            super.writeToParcel(dest, flags);
            dest.writeString(this.value);
        }

        public SavedState(Parcelable superState) {
            super(superState);
        }
    }
}
