package android.support.v14.preference;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.res.TypedArray;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.ArrayRes;
import android.support.annotation.NonNull;
import android.support.v4.content.SharedPreferencesCompat;
import android.support.v4.content.res.TypedArrayUtils;
import android.support.v7.preference.DialogPreference;
import android.support.v7.preference.Preference;
import android.util.AttributeSet;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/* loaded from: com.android.support.preference-v14.23.4.0.jar:android/support/v14/preference/MultiSelectListPreference.class */
public class MultiSelectListPreference extends DialogPreference {
    private CharSequence[] mEntries;
    private CharSequence[] mEntryValues;
    private Set<String> mValues;

    public MultiSelectListPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mValues = new HashSet();
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.MultiSelectListPreference, defStyleAttr, defStyleRes);
        this.mEntries = TypedArrayUtils.getTextArray(a, R.styleable.MultiSelectListPreference_entries, R.styleable.MultiSelectListPreference_android_entries);
        this.mEntryValues = TypedArrayUtils.getTextArray(a, R.styleable.MultiSelectListPreference_entryValues, R.styleable.MultiSelectListPreference_android_entryValues);
        a.recycle();
    }

    public MultiSelectListPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        this(context, attrs, defStyleAttr, 0);
    }

    public MultiSelectListPreference(Context context, AttributeSet attrs) {
        this(context, attrs, R.attr.dialogPreferenceStyle);
    }

    public MultiSelectListPreference(Context context) {
        this(context, null);
    }

    protected boolean persistStringSet(Set<String> values) {
        if (shouldPersist()) {
            if (values.equals(getPersistedStringSet(null))) {
                return true;
            }
            SharedPreferences.Editor editor = getPreferenceManager().getSharedPreferences().edit();
            editor.putStringSet(getKey(), values);
            SharedPreferencesCompat.EditorCompat.getInstance().apply(editor);
            return true;
        }
        return false;
    }

    protected Set<String> getPersistedStringSet(Set<String> defaultReturnValue) {
        if (!shouldPersist()) {
            return defaultReturnValue;
        }
        return getPreferenceManager().getSharedPreferences().getStringSet(getKey(), defaultReturnValue);
    }

    public void setEntries(CharSequence[] entries) {
        this.mEntries = entries;
    }

    public void setEntries(@ArrayRes int entriesResId) {
        setEntries(getContext().getResources().getTextArray(entriesResId));
    }

    public CharSequence[] getEntries() {
        return this.mEntries;
    }

    public void setEntryValues(CharSequence[] entryValues) {
        this.mEntryValues = entryValues;
    }

    public void setEntryValues(@ArrayRes int entryValuesResId) {
        setEntryValues(getContext().getResources().getTextArray(entryValuesResId));
    }

    public CharSequence[] getEntryValues() {
        return this.mEntryValues;
    }

    public void setValues(Set<String> values) {
        this.mValues.clear();
        this.mValues.addAll(values);
        persistStringSet(values);
    }

    public Set<String> getValues() {
        return this.mValues;
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

    protected boolean[] getSelectedItems() {
        CharSequence[] entries = this.mEntryValues;
        int entryCount = entries.length;
        Set<String> values = this.mValues;
        boolean[] result = new boolean[entryCount];
        for (int i = 0; i < entryCount; i++) {
            result[i] = values.contains(entries[i].toString());
        }
        return result;
    }

    protected Object onGetDefaultValue(TypedArray a, int index) {
        CharSequence[] defaultValues = a.getTextArray(index);
        Set<String> result = new HashSet<>();
        for (CharSequence defaultValue : defaultValues) {
            result.add(defaultValue.toString());
        }
        return result;
    }

    protected void onSetInitialValue(boolean restoreValue, Object defaultValue) {
        setValues(restoreValue ? getPersistedStringSet(this.mValues) : (Set) defaultValue);
    }

    /* JADX WARN: Type inference failed for: r0v4, types: [android.os.Parcelable, android.support.v14.preference.MultiSelectListPreference$SavedState] */
    protected Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        if (isPersistent()) {
            return superState;
        }
        ?? savedState = new SavedState(superState);
        savedState.values = getValues();
        return savedState;
    }

    /* JADX WARN: Multi-variable type inference failed */
    protected void onRestoreInstanceState(Parcelable parcelable) {
        if (parcelable == 0 || !parcelable.getClass().equals(SavedState.class)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        SavedState myState = (SavedState) parcelable;
        super.onRestoreInstanceState(myState.getSuperState());
        setValues(myState.values);
    }

    /* loaded from: com.android.support.preference-v14.23.4.0.jar:android/support/v14/preference/MultiSelectListPreference$SavedState.class */
    private static class SavedState extends Preference.BaseSavedState {
        Set<String> values;
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: android.support.v14.preference.MultiSelectListPreference.SavedState.1
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
            int size = source.readInt();
            this.values = new HashSet();
            String[] strings = new String[size];
            source.readStringArray(strings);
            Collections.addAll(this.values, strings);
        }

        public SavedState(Parcelable superState) {
            super(superState);
        }

        public void writeToParcel(@NonNull Parcel dest, int flags) {
            super.writeToParcel(dest, flags);
            dest.writeInt(this.values.size());
            dest.writeStringArray((String[]) this.values.toArray(new String[this.values.size()]));
        }
    }
}
