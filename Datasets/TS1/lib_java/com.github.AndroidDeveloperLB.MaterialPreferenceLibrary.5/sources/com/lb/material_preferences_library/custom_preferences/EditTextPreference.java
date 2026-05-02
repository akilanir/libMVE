package com.lb.material_preferences_library.custom_preferences;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.res.TypedArray;
import android.os.Parcel;
import android.os.Parcelable;
import android.preference.Preference;
import android.support.v7.widget.AppCompatEditText;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.EditText;
import com.lb.material_preferences_library.R;

/* loaded from: com.github.AndroidDeveloperLB.MaterialPreferenceLibrary.5.jar:com/lb/material_preferences_library/custom_preferences/EditTextPreference.class */
public class EditTextPreference extends DialogPreference {
    private EditText mEditText;
    private String mText;

    @TargetApi(21)
    public EditTextPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }

    public EditTextPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public EditTextPreference(Context context, AttributeSet attrs) {
        this(context, attrs, R.attr.editTextPreferenceStyle);
    }

    public EditTextPreference(Context context) {
        this(context, null);
    }

    @Override // com.lb.material_preferences_library.custom_preferences.DialogPreference, com.lb.material_preferences_library.custom_preferences.Preference
    protected void init(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super.init(context, attrs, defStyleAttr, defStyleRes);
        this.mEditText = new AppCompatEditText(context, attrs);
        this.mEditText.setId(android.R.id.edit);
        this.mEditText.setEnabled(true);
        setDialogLayoutResource(R.layout.mpl__edittext_dialog_preference);
    }

    public void setText(String text) {
        boolean wasBlocking = shouldDisableDependents();
        this.mText = text;
        persistString(text);
        boolean isBlocking = shouldDisableDependents();
        if (isBlocking != wasBlocking) {
            notifyDependencyChange(isBlocking);
        }
    }

    public String getText() {
        return this.mText;
    }

    @Override // com.lb.material_preferences_library.custom_preferences.DialogPreference
    protected void onBindDialogView(View view) {
        super.onBindDialogView(view);
        EditText editText = this.mEditText;
        editText.setText(getText());
        ViewParent oldParent = editText.getParent();
        if (oldParent != view) {
            if (oldParent != null) {
                ((ViewGroup) oldParent).removeView(editText);
            }
            onAddEditTextToDialogView(view, editText);
        }
    }

    protected void onAddEditTextToDialogView(View dialogView, EditText editText) {
        ViewGroup container = (ViewGroup) dialogView.findViewById(R.id.edittext_container);
        if (container != null) {
            container.addView(editText, -1, -2);
        }
    }

    @Override // com.lb.material_preferences_library.custom_preferences.DialogPreference
    protected void onDialogClosed(boolean positiveResult) {
        super.onDialogClosed(positiveResult);
        if (positiveResult) {
            String value = this.mEditText.getText().toString();
            if (callChangeListener(value)) {
                setText(value);
            }
        }
    }

    @Override // android.preference.Preference
    protected Object onGetDefaultValue(TypedArray a, int index) {
        return a.getString(index);
    }

    @Override // android.preference.Preference
    protected void onSetInitialValue(boolean restoreValue, Object defaultValue) {
        setText(restoreValue ? getPersistedString(this.mText) : (String) defaultValue);
    }

    @Override // android.preference.Preference
    public boolean shouldDisableDependents() {
        return TextUtils.isEmpty(this.mText) || super.shouldDisableDependents();
    }

    public EditText getEditText() {
        return this.mEditText;
    }

    @Override // com.lb.material_preferences_library.custom_preferences.DialogPreference
    protected boolean needInputMethod() {
        return true;
    }

    @Override // com.lb.material_preferences_library.custom_preferences.DialogPreference, android.preference.Preference
    protected Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        if (isPersistent()) {
            return superState;
        }
        SavedState myState = new SavedState(superState);
        myState.text = getText();
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
        setText(myState.text);
    }

    /* loaded from: com.github.AndroidDeveloperLB.MaterialPreferenceLibrary.5.jar:com/lb/material_preferences_library/custom_preferences/EditTextPreference$SavedState.class */
    private static class SavedState extends Preference.BaseSavedState {
        String text;
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: com.lb.material_preferences_library.custom_preferences.EditTextPreference.SavedState.1
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
            this.text = source.readString();
        }

        @Override // android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel dest, int flags) {
            super.writeToParcel(dest, flags);
            dest.writeString(this.text);
        }

        public SavedState(Parcelable superState) {
            super(superState);
        }
    }
}
