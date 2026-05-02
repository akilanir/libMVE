package com.afollestad.materialdialogs.prefs;

import android.R;
import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.preference.EditTextPreference;
import android.preference.Preference;
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
import com.afollestad.materialdialogs.DialogAction;
import com.afollestad.materialdialogs.MaterialDialog;
import com.afollestad.materialdialogs.commons.BuildConfig;
import com.afollestad.materialdialogs.internal.MDTintHelper;
import com.afollestad.materialdialogs.util.DialogUtils;

/* loaded from: com.github.afollestad.material-dialogs.commons.0.8.5.4.jar:com/afollestad/materialdialogs/prefs/MaterialEditTextPreference.class */
public class MaterialEditTextPreference extends EditTextPreference {
    private int mColor;
    private MaterialDialog mDialog;
    private EditText mEditText;

    public MaterialEditTextPreference(Context context) {
        super(context);
        this.mColor = 0;
        init(context, null);
    }

    public MaterialEditTextPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mColor = 0;
        init(context, attrs);
    }

    @TargetApi(21)
    public MaterialEditTextPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        this.mColor = 0;
        init(context, attrs);
    }

    @TargetApi(21)
    public MaterialEditTextPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        this.mColor = 0;
        init(context, attrs);
    }

    private void init(Context context, AttributeSet attrs) {
        int fallback;
        PrefUtil.setLayoutResource(context, this, attrs);
        if (Build.VERSION.SDK_INT >= 21) {
            fallback = DialogUtils.resolveColor(context, R.attr.colorAccent);
        } else {
            fallback = 0;
        }
        this.mColor = DialogUtils.resolveColor(context, com.afollestad.materialdialogs.commons.R.attr.md_widget_color, DialogUtils.resolveColor(context, com.afollestad.materialdialogs.commons.R.attr.colorAccent, fallback));
        this.mEditText = new AppCompatEditText(context, attrs);
        this.mEditText.setId(R.id.edit);
        this.mEditText.setEnabled(true);
    }

    @Override // android.preference.EditTextPreference
    protected void onAddEditTextToDialogView(@NonNull View dialogView, @NonNull EditText editText) {
        ((ViewGroup) dialogView).addView(editText, new LinearLayout.LayoutParams(-1, -2));
    }

    @Override // android.preference.EditTextPreference, android.preference.DialogPreference
    @SuppressLint({"MissingSuperCall"})
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
        MaterialDialog.Builder mBuilder = new MaterialDialog.Builder(getContext()).title(getDialogTitle()).icon(getDialogIcon()).positiveText(getPositiveButtonText()).negativeText(getNegativeButtonText()).dismissListener(this).onAny(new MaterialDialog.SingleButtonCallback() { // from class: com.afollestad.materialdialogs.prefs.MaterialEditTextPreference.1
            public void onClick(@NonNull MaterialDialog dialog, @NonNull DialogAction which) {
                switch (AnonymousClass2.$SwitchMap$com$afollestad$materialdialogs$DialogAction[which.ordinal()]) {
                    case BuildConfig.VERSION_CODE /* 1 */:
                        MaterialEditTextPreference.this.onClick(dialog, -3);
                        break;
                    case 2:
                        MaterialEditTextPreference.this.onClick(dialog, -2);
                        break;
                    default:
                        MaterialEditTextPreference.this.onClick(dialog, -1);
                        break;
                }
            }
        }).dismissListener(this);
        View layout = LayoutInflater.from(getContext()).inflate(com.afollestad.materialdialogs.commons.R.layout.md_stub_inputpref, (ViewGroup) null);
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
        PrefUtil.registerOnActivityDestroyListener(this, this);
        this.mDialog = mBuilder.build();
        if (state != null) {
            this.mDialog.onRestoreInstanceState(state);
        }
        requestInputMethod(this.mDialog);
        this.mDialog.show();
    }

    /* renamed from: com.afollestad.materialdialogs.prefs.MaterialEditTextPreference$2, reason: invalid class name */
    /* loaded from: com.github.afollestad.material-dialogs.commons.0.8.5.4.jar:com/afollestad/materialdialogs/prefs/MaterialEditTextPreference$2.class */
    static /* synthetic */ class AnonymousClass2 {
        static final /* synthetic */ int[] $SwitchMap$com$afollestad$materialdialogs$DialogAction = new int[DialogAction.values().length];

        static {
            try {
                $SwitchMap$com$afollestad$materialdialogs$DialogAction[DialogAction.NEUTRAL.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$afollestad$materialdialogs$DialogAction[DialogAction.NEGATIVE.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
        }
    }

    @Override // android.preference.DialogPreference, android.content.DialogInterface.OnDismissListener
    public void onDismiss(DialogInterface dialog) {
        super.onDismiss(dialog);
        PrefUtil.unregisterOnActivityDestroyListener(this, this);
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

    /* loaded from: com.github.afollestad.material-dialogs.commons.0.8.5.4.jar:com/afollestad/materialdialogs/prefs/MaterialEditTextPreference$SavedState.class */
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
