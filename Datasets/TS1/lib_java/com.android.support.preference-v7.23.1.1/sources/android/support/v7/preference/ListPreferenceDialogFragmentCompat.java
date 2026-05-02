package android.support.v7.preference;

import android.content.DialogInterface;
import android.os.Bundle;
import android.support.v7.app.AlertDialog;

/* loaded from: com.android.support.preference-v7.23.1.1.jar:android/support/v7/preference/ListPreferenceDialogFragmentCompat.class */
public class ListPreferenceDialogFragmentCompat extends PreferenceDialogFragmentCompat {
    private int mClickedDialogEntryIndex;

    public static ListPreferenceDialogFragmentCompat newInstance(String key) {
        ListPreferenceDialogFragmentCompat fragment = new ListPreferenceDialogFragmentCompat();
        Bundle b = new Bundle(1);
        b.putString("key", key);
        fragment.setArguments(b);
        return fragment;
    }

    private ListPreference getListPreference() {
        return (ListPreference) getPreference();
    }

    @Override // android.support.v7.preference.PreferenceDialogFragmentCompat
    protected void onPrepareDialogBuilder(AlertDialog.Builder builder) {
        super.onPrepareDialogBuilder(builder);
        ListPreference preference = getListPreference();
        if (preference.getEntries() == null || preference.getEntryValues() == null) {
            throw new IllegalStateException("ListPreference requires an entries array and an entryValues array.");
        }
        this.mClickedDialogEntryIndex = preference.findIndexOfValue(preference.getValue());
        builder.setSingleChoiceItems(preference.getEntries(), this.mClickedDialogEntryIndex, new DialogInterface.OnClickListener() { // from class: android.support.v7.preference.ListPreferenceDialogFragmentCompat.1
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                ListPreferenceDialogFragmentCompat.this.mClickedDialogEntryIndex = which;
                ListPreferenceDialogFragmentCompat.this.onClick(dialog, -1);
                dialog.dismiss();
            }
        });
        builder.setPositiveButton((CharSequence) null, (DialogInterface.OnClickListener) null);
    }

    @Override // android.support.v7.preference.PreferenceDialogFragmentCompat
    public void onDialogClosed(boolean positiveResult) {
        ListPreference preference = getListPreference();
        if (positiveResult && this.mClickedDialogEntryIndex >= 0 && preference.getEntryValues() != null) {
            String value = preference.getEntryValues()[this.mClickedDialogEntryIndex].toString();
            if (preference.callChangeListener(value)) {
                preference.setValue(value);
            }
        }
    }
}
