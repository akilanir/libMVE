package com.afollestad.materialdialogs.prefs;

import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.PreferenceManager;
import android.support.annotation.NonNull;
import android.util.AttributeSet;
import android.view.View;
import com.afollestad.materialdialogs.MaterialDialog;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

/* loaded from: com.afollestad.material-dialogs.v0.7.7.0.jar:com/afollestad/materialdialogs/prefs/MaterialListPreference.class */
public class MaterialListPreference extends ListPreference {
    private Context context;
    private MaterialDialog mDialog;

    public MaterialListPreference(Context context) {
        super(context);
        init(context);
    }

    public MaterialListPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        init(context);
    }

    private void init(Context context) {
        this.context = context;
        if (Build.VERSION.SDK_INT <= 10) {
            setWidgetLayoutResource(0);
        }
    }

    @Override // android.preference.ListPreference
    public void setEntries(CharSequence[] entries) {
        super.setEntries(entries);
        if (this.mDialog != null) {
            this.mDialog.setItems(entries);
        }
    }

    @Override // android.preference.DialogPreference
    public Dialog getDialog() {
        return this.mDialog;
    }

    @Override // android.preference.DialogPreference
    protected void showDialog(Bundle state) {
        if (getEntries() == null || getEntryValues() == null) {
            throw new IllegalStateException("ListPreference requires an entries array and an entryValues array.");
        }
        int preselect = findIndexOfValue(getValue());
        MaterialDialog.Builder builder = new MaterialDialog.Builder(this.context).title(getDialogTitle()).content(getDialogMessage()).icon(getDialogIcon()).dismissListener(this).callback(new MaterialDialog.ButtonCallback() { // from class: com.afollestad.materialdialogs.prefs.MaterialListPreference.2
            @Override // com.afollestad.materialdialogs.MaterialDialog.ButtonCallback
            public void onNeutral(MaterialDialog dialog) {
                MaterialListPreference.this.onClick(dialog, -3);
            }

            @Override // com.afollestad.materialdialogs.MaterialDialog.ButtonCallback
            public void onNegative(MaterialDialog dialog) {
                MaterialListPreference.this.onClick(dialog, -2);
            }

            @Override // com.afollestad.materialdialogs.MaterialDialog.ButtonCallback
            public void onPositive(MaterialDialog dialog) {
                MaterialListPreference.this.onClick(dialog, -1);
            }
        }).negativeText(getNegativeButtonText()).items(getEntries()).autoDismiss(true).itemsCallbackSingleChoice(preselect, new MaterialDialog.ListCallbackSingleChoice() { // from class: com.afollestad.materialdialogs.prefs.MaterialListPreference.1
            @Override // com.afollestad.materialdialogs.MaterialDialog.ListCallbackSingleChoice
            public boolean onSelection(MaterialDialog dialog, View itemView, int which, CharSequence text) {
                MaterialListPreference.this.onClick(null, -1);
                if (which >= 0 && MaterialListPreference.this.getEntryValues() != null) {
                    try {
                        Field clickedIndex = ListPreference.class.getDeclaredField("mClickedDialogEntryIndex");
                        clickedIndex.setAccessible(true);
                        clickedIndex.set(MaterialListPreference.this, Integer.valueOf(which));
                        return true;
                    } catch (Exception e) {
                        e.printStackTrace();
                        return true;
                    }
                }
                return true;
            }
        });
        View contentView = onCreateDialogView();
        if (contentView != null) {
            onBindDialogView(contentView);
            builder.customView(contentView, false);
        } else {
            builder.content(getDialogMessage());
        }
        try {
            PreferenceManager pm = getPreferenceManager();
            Method method = pm.getClass().getDeclaredMethod("registerOnActivityDestroyListener", PreferenceManager.OnActivityDestroyListener.class);
            method.setAccessible(true);
            method.invoke(pm, this);
        } catch (Exception e) {
        }
        this.mDialog = builder.build();
        if (state != null) {
            this.mDialog.onRestoreInstanceState(state);
        }
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

    @Override // android.preference.DialogPreference, android.preference.PreferenceManager.OnActivityDestroyListener
    public void onActivityDestroy() {
        super.onActivityDestroy();
        if (this.mDialog != null && this.mDialog.isShowing()) {
            this.mDialog.dismiss();
        }
    }

    @Override // android.preference.ListPreference, android.preference.DialogPreference, android.preference.Preference
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

    @Override // android.preference.ListPreference, android.preference.DialogPreference, android.preference.Preference
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

    /* loaded from: com.afollestad.material-dialogs.v0.7.7.0.jar:com/afollestad/materialdialogs/prefs/MaterialListPreference$SavedState.class */
    private static class SavedState extends Preference.BaseSavedState {
        boolean isDialogShowing;
        Bundle dialogBundle;
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: com.afollestad.materialdialogs.prefs.MaterialListPreference.SavedState.1
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
