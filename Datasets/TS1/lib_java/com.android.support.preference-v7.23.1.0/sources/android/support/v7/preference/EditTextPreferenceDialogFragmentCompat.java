package android.support.v7.preference;

import android.R;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;

/* loaded from: com.android.support.preference-v7.23.1.0.jar:android/support/v7/preference/EditTextPreferenceDialogFragmentCompat.class */
public class EditTextPreferenceDialogFragmentCompat extends PreferenceDialogFragmentCompat {
    private EditText mEditText;

    public static EditTextPreferenceDialogFragmentCompat newInstance(String key) {
        EditTextPreferenceDialogFragmentCompat fragment = new EditTextPreferenceDialogFragmentCompat();
        Bundle b = new Bundle(1);
        b.putString("key", key);
        fragment.setArguments(b);
        return fragment;
    }

    @Override // android.support.v7.preference.PreferenceDialogFragmentCompat
    protected void onBindDialogView(View view) {
        super.onBindDialogView(view);
        this.mEditText = (EditText) view.findViewById(R.id.edit);
        if (this.mEditText == null) {
            throw new IllegalStateException("Dialog view must contain an EditText with id @android:id/edit");
        }
        this.mEditText.setText(getEditTextPreference().getText());
    }

    private EditTextPreference getEditTextPreference() {
        return (EditTextPreference) getPreference();
    }

    @Override // android.support.v7.preference.PreferenceDialogFragmentCompat
    protected boolean needInputMethod() {
        return true;
    }

    @Override // android.support.v7.preference.PreferenceDialogFragmentCompat
    public void onDialogClosed(boolean positiveResult) {
        if (positiveResult) {
            String value = this.mEditText.getText().toString();
            if (getEditTextPreference().callChangeListener(value)) {
                getEditTextPreference().setText(value);
            }
        }
    }
}
