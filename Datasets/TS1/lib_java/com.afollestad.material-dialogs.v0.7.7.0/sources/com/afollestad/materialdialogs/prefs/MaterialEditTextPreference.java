package com.afollestad.materialdialogs.prefs;

import android.R;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.preference.EditTextPreference;
import android.preference.Preference;
import android.preference.PreferenceManager;
import android.support.annotation.NonNull;
import android.support.v7.widget.AppCompatEditText;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.Window;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.afollestad.materialdialogs.MaterialDialog;
import com.afollestad.materialdialogs.internal.MDTintHelper;
import com.afollestad.materialdialogs.util.DialogUtils;
import java.lang.reflect.Method;

/* loaded from: com.afollestad.material-dialogs.v0.7.7.0.jar:com/afollestad/materialdialogs/prefs/MaterialEditTextPreference.class */
public class MaterialEditTextPreference extends EditTextPreference {
    private int mColor;
    private MaterialDialog mDialog;
    private EditText mEditText;
    private final MaterialDialog.ButtonCallback callback;

    public MaterialEditTextPreference(Context context, AttributeSet attrs) {
        int fallback;
        super(context, attrs);
        this.mColor = 0;
        this.callback = new MaterialDialog.ButtonCallback() { // from class: com.afollestad.materialdialogs.prefs.MaterialEditTextPreference.1
            @Override // com.afollestad.materialdialogs.MaterialDialog.ButtonCallback
            public void onPositive(MaterialDialog dialog) {
                MaterialEditTextPreference.this.onClick(dialog, -1);
                String value = MaterialEditTextPreference.this.mEditText.getText().toString();
                if (MaterialEditTextPreference.this.callChangeListener(value) && MaterialEditTextPreference.this.isPersistent()) {
                    MaterialEditTextPreference.this.setText(value);
                }
            }

            @Override // com.afollestad.materialdialogs.MaterialDialog.ButtonCallback
            public void onNeutral(MaterialDialog dialog) {
                MaterialEditTextPreference.this.onClick(dialog, -3);
            }

            @Override // com.afollestad.materialdialogs.MaterialDialog.ButtonCallback
            public void onNegative(MaterialDialog dialog) {
                MaterialEditTextPreference.this.onClick(dialog, -2);
            }
        };
        if (Build.VERSION.SDK_INT >= 21) {
            fallback = DialogUtils.resolveColor(context, R.attr.colorAccent);
        } else {
            fallback = 0;
        }
        this.mColor = DialogUtils.resolveColor(context, com.afollestad.materialdialogs.R.attr.colorAccent, fallback);
        this.mEditText = new AppCompatEditText(context, attrs);
        this.mEditText.setId(R.id.edit);
        this.mEditText.setEnabled(true);
    }

    public MaterialEditTextPreference(Context context) {
        this(context, null);
    }

    @Override // android.preference.EditTextPreference
    protected void onAddEditTextToDialogView(@NonNull View dialogView, @NonNull EditText editText) {
        ((ViewGroup) dialogView).addView(editText, new LinearLayout.LayoutParams(-1, -2));
    }

    @Override // android.preference.EditTextPreference, android.preference.DialogPreference
    protected void onBindDialogView(@NonNull View view) {
        EditText editText = this.mEditText;
        editText.setText(getText());
        if (editText.getText().length() > 0) {
            editText.setSelection(editText.length());
        }
        ViewParent oldParent = editText.getParent();
        if (oldParent != view) {
            if (oldParent != null) {
                ((ViewGroup) oldParent).removeView(editText);
            }
            onAddEditTextToDialogView(view, editText);
        }
    }

    @Override // android.preference.EditTextPreference, android.preference.DialogPreference
    protected void onDialogClosed(boolean positiveResult) {
        if (positiveResult) {
            String value = this.mEditText.getText().toString();
            if (callChangeListener(value)) {
                setText(value);
            }
        }
    }

    @Override // android.preference.EditTextPreference
    public EditText getEditText() {
        return this.mEditText;
    }

    @Override // android.preference.DialogPreference
    public Dialog getDialog() {
        return this.mDialog;
    }

    @Override // android.preference.EditTextPreference, android.preference.DialogPreference
    protected void showDialog(Bundle state) {
        MaterialDialog.Builder mBuilder = new MaterialDialog.Builder(getContext()).title(getDialogTitle()).icon(getDialogIcon()).positiveText(getPositiveButtonText()).negativeText(getNegativeButtonText()).dismissListener(this).callback(this.callback).dismissListener(this);
        View layout = LayoutInflater.from(getContext()).inflate(com.afollestad.materialdialogs.R.layout.md_stub_inputpref, (ViewGroup) null);
        onBindDialogView(layout);
        MDTintHelper.setTint(this.mEditText, this.mColor);
        TextView message = (TextView) layout.findViewById(R.id.message);
        if (getDialogMessage() != null && getDialogMessage().toString().length() > 0) {
            message.setVisibility(0);
            message.setText(getDialogMessage());
        } else {
            message.setVisibility(8);
        }
        mBuilder.customView(layout, false);
        try {
            PreferenceManager pm = getPreferenceManager();
            Method method = pm.getClass().getDeclaredMethod("registerOnActivityDestroyListener", PreferenceManager.OnActivityDestroyListener.class);
            method.setAccessible(true);
            method.invoke(pm, this);
        } catch (Exception e) {
        }
        this.mDialog = mBuilder.build();
        if (state != null) {
            this.mDialog.onRestoreInstanceState(state);
        }
        requestInputMethod(this.mDialog);
        this.mDialog.show();
    }

    @Override // android.preference.DialogPreference, android.content.DialogInterface.OnDismissListener
    public void onDismiss(DialogInterface dialog) {
        super.onDismiss(dialog);
        try {
            PreferenceManager pm = getPreferenceManager();
            Method method = pm.getClass().getDeclaredMethod("unregisterOnActivityDestroyListener", PreferenceManager.OnActivityDestroyListener.class);
            method.setAccessible(true);
            method.invoke(pm, this);
        } catch (Exception e) {
        }
    }

    private void requestInputMethod(Dialog dialog) {
        Window window = dialog.getWindow();
        window.setSoftInputMode(5);
    }

    @Override // android.preference.DialogPreference, android.preference.PreferenceManager.OnActivityDestroyListener
    public void onActivityDestroy() {
        super.onActivityDestroy();
        if (this.mDialog != null && this.mDialog.isShowing()) {
            this.mDialog.dismiss();
        }
    }

    @Override // android.preference.EditTextPreference, android.preference.DialogPreference, android.preference.Preference
    protected Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        Dialog dialog = getDialog();
        if (dialog == null || !dialog.isShowing()) {
            return superState;
        }
        SavedState myState = new SavedState(superState);
        myState.isDialogShowing = true;
        myState.dialogBundle = dialog.onSaveInstanceState();
        return myState;
    }

    @Override // android.preference.EditTextPreference, android.preference.DialogPreference, android.preference.Preference
    protected void onRestoreInstanceState(Parcelable state) {
        if (state == null || !state.getClass().equals(SavedState.class)) {
            super.onRestoreInstanceState(state);
            return;
        }
        SavedState myState = (SavedState) state;
        super.onRestoreInstanceState(myState.getSuperState());
        if (myState.isDialogShowing) {
            showDialog(myState.dialogBundle);
        }
    }

    /* loaded from: com.afollestad.material-dialogs.v0.7.7.0.jar:com/afollestad/materialdialogs/prefs/MaterialEditTextPreference$SavedState.class */
    private static class SavedState extends Preference.BaseSavedState {
        boolean isDialogShowing;
        Bundle dialogBundle;
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: com.afollestad.materialdialogs.prefs.MaterialEditTextPreference.SavedState.1
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
            this.isDialogShowing = source.readInt() == 1;
            this.dialogBundle = source.readBundle();
        }

        @Override // android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(@NonNull Parcel dest, int flags) {
            super.writeToParcel(dest, flags);
            dest.writeInt(this.isDialogShowing ? 1 : 0);
            dest.writeBundle(this.dialogBundle);
        }

        public SavedState(Parcelable superState) {
            super(superState);
        }
    }
}
