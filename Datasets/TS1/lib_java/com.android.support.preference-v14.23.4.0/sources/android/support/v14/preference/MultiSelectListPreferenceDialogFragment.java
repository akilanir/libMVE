package android.support.v14.preference;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.support.annotation.NonNull;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

/* loaded from: com.android.support.preference-v14.23.4.0.jar:android/support/v14/preference/MultiSelectListPreferenceDialogFragment.class */
public class MultiSelectListPreferenceDialogFragment extends PreferenceDialogFragment {
    private static final String SAVE_STATE_VALUES = "MultiSelectListPreferenceDialogFragment.values";
    private static final String SAVE_STATE_CHANGED = "MultiSelectListPreferenceDialogFragment.changed";
    private static final String SAVE_STATE_ENTRIES = "MultiSelectListPreferenceDialogFragment.entries";
    private static final String SAVE_STATE_ENTRY_VALUES = "MultiSelectListPreferenceDialogFragment.entryValues";
    private Set<String> mNewValues = new HashSet();
    private boolean mPreferenceChanged;
    private CharSequence[] mEntries;
    private CharSequence[] mEntryValues;

    /* JADX WARN: Type inference failed for: r1v3, types: [boolean, byte] */
    static /* synthetic */ boolean access$076(MultiSelectListPreferenceDialogFragment multiSelectListPreferenceDialogFragment, int i) {
        ?? r1 = (byte) ((multiSelectListPreferenceDialogFragment.mPreferenceChanged ? 1 : 0) | i);
        multiSelectListPreferenceDialogFragment.mPreferenceChanged = r1;
        return r1;
    }

    public static MultiSelectListPreferenceDialogFragment newInstance(String key) {
        MultiSelectListPreferenceDialogFragment fragment = new MultiSelectListPreferenceDialogFragment();
        Bundle b = new Bundle(1);
        b.putString("key", key);
        fragment.setArguments(b);
        return fragment;
    }

    @Override // android.support.v14.preference.PreferenceDialogFragment, android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (savedInstanceState == null) {
            MultiSelectListPreference preference = getListPreference();
            if (preference.getEntries() == null || preference.getEntryValues() == null) {
                throw new IllegalStateException("MultiSelectListPreference requires an entries array and an entryValues array.");
            }
            this.mNewValues.clear();
            this.mNewValues.addAll(preference.getValues());
            this.mPreferenceChanged = false;
            this.mEntries = preference.getEntries();
            this.mEntryValues = preference.getEntryValues();
            return;
        }
        this.mNewValues.clear();
        this.mNewValues.addAll(savedInstanceState.getStringArrayList(SAVE_STATE_VALUES));
        this.mPreferenceChanged = savedInstanceState.getBoolean(SAVE_STATE_CHANGED, false);
        this.mEntries = savedInstanceState.getCharSequenceArray(SAVE_STATE_ENTRIES);
        this.mEntryValues = savedInstanceState.getCharSequenceArray(SAVE_STATE_ENTRY_VALUES);
    }

    @Override // android.support.v14.preference.PreferenceDialogFragment, android.app.DialogFragment, android.app.Fragment
    public void onSaveInstanceState(@NonNull Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putStringArrayList(SAVE_STATE_VALUES, new ArrayList<>(this.mNewValues));
        outState.putBoolean(SAVE_STATE_CHANGED, this.mPreferenceChanged);
        outState.putCharSequenceArray(SAVE_STATE_ENTRIES, this.mEntries);
        outState.putCharSequenceArray(SAVE_STATE_ENTRY_VALUES, this.mEntryValues);
    }

    private MultiSelectListPreference getListPreference() {
        return (MultiSelectListPreference) getPreference();
    }

    @Override // android.support.v14.preference.PreferenceDialogFragment
    protected void onPrepareDialogBuilder(AlertDialog.Builder builder) {
        super.onPrepareDialogBuilder(builder);
        int entryCount = this.mEntryValues.length;
        boolean[] checkedItems = new boolean[entryCount];
        for (int i = 0; i < entryCount; i++) {
            checkedItems[i] = this.mNewValues.contains(this.mEntryValues[i].toString());
        }
        builder.setMultiChoiceItems(this.mEntries, checkedItems, new DialogInterface.OnMultiChoiceClickListener() { // from class: android.support.v14.preference.MultiSelectListPreferenceDialogFragment.1
            @Override // android.content.DialogInterface.OnMultiChoiceClickListener
            public void onClick(DialogInterface dialogInterface, int i2, boolean z) {
                if (z) {
                    MultiSelectListPreferenceDialogFragment.access$076(MultiSelectListPreferenceDialogFragment.this, MultiSelectListPreferenceDialogFragment.this.mNewValues.add(MultiSelectListPreferenceDialogFragment.this.mEntryValues[i2].toString()) ? 1 : 0);
                } else {
                    MultiSelectListPreferenceDialogFragment.access$076(MultiSelectListPreferenceDialogFragment.this, MultiSelectListPreferenceDialogFragment.this.mNewValues.remove(MultiSelectListPreferenceDialogFragment.this.mEntryValues[i2].toString()) ? 1 : 0);
                }
            }
        });
    }

    @Override // android.support.v14.preference.PreferenceDialogFragment
    public void onDialogClosed(boolean positiveResult) {
        MultiSelectListPreference preference = getListPreference();
        if (positiveResult && this.mPreferenceChanged) {
            Set<String> values = this.mNewValues;
            if (preference.callChangeListener(values)) {
                preference.setValues(values);
            }
        }
        this.mPreferenceChanged = false;
    }
}
