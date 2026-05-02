package android.support.v7.preference;

import android.R;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.EditText;

/* loaded from: com.android.support.preference-v7.23.0.1.jar:android/support/v7/preference/EditTextPreferenceDialogFragmentCompat.class */
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
        this.mEditText = new EditText(view.getContext());
        this.mEditText.setId(R.id.edit);
        this.mEditText.setText(getEditTextPreference().getText());
        ViewParent oldParent = this.mEditText.getParent();
        if (oldParent != view) {
            if (oldParent != null) {
                ((ViewGroup) oldParent).removeView(this.mEditText);
            }
            onAddEditTextToDialogView(view, this.mEditText);
        }
    }

    private EditTextPreference getEditTextPreference() {
        return (EditTextPreference) getPreference();
    }

    @Override // android.support.v7.preference.PreferenceDialogFragmentCompat
    protected boolean needInputMethod() {
        return true;
    }

    protected void onAddEditTextToDialogView(View dialogView, EditText editText) {
        ViewGroup container = (ViewGroup) dialogView.findViewById(R.id.edittext_container);
        if (container != null) {
            container.addView(editText, -1, -2);
        }
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
