package com.afollestad.materialdialogs.prefs;

import android.annotation.TargetApi;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Build;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.preference.MultiSelectListPreference;
import android.preference.Preference;
import android.preference.PreferenceManager;
import android.support.annotation.NonNull;
import android.util.AttributeSet;
import android.view.View;
import com.afollestad.materialdialogs.MaterialDialog;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@TargetApi(11)
/* loaded from: com.afollestad.material-dialogs.v0.7.7.0.jar:com/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference.class */
public class MaterialMultiSelectListPreference extends MultiSelectListPreference {
    private Context context;
    private MaterialDialog mDialog;

    public MaterialMultiSelectListPreference(Context context) {
        this(context, null);
    }

    public MaterialMultiSelectListPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        init(context);
    }

    @Override // android.preference.MultiSelectListPreference
    public void setEntries(CharSequence[] entries) {
        super.setEntries(entries);
        if (this.mDialog != null) {
            this.mDialog.setItems(entries);
        }
    }

    private void init(Context context) {
        this.context = context;
        if (Build.VERSION.SDK_INT <= 10) {
            setWidgetLayoutResource(0);
        }
    }

    @Override // android.preference.DialogPreference
    public Dialog getDialog() {
        return this.mDialog;
    }

    @Override // android.preference.DialogPreference
    protected void showDialog(Bundle state) {
        List<Integer> indices = new ArrayList<>();
        for (String s : getValues()) {
            int index = findIndexOfValue(s);
            if (index >= 0) {
                indices.add(Integer.valueOf(findIndexOfValue(s)));
            }
        }
        MaterialDialog.Builder builder = new MaterialDialog.Builder(this.context).title(getDialogTitle()).content(getDialogMessage()).icon(getDialogIcon()).negativeText(getNegativeButtonText()).positiveText(getPositiveButtonText()).callback(new MaterialDialog.ButtonCallback() { // from class: com.afollestad.materialdialogs.prefs.MaterialMultiSelectListPreference.2
            @Override // com.afollestad.materialdialogs.MaterialDialog.ButtonCallback
            public void onNeutral(MaterialDialog dialog) {
                MaterialMultiSelectListPreference.this.onClick(dialog, -3);
            }

            @Override // com.afollestad.materialdialogs.MaterialDialog.ButtonCallback
            public void onNegative(MaterialDialog dialog) {
                MaterialMultiSelectListPreference.this.onClick(dialog, -2);
            }

            @Override // com.afollestad.materialdialogs.MaterialDialog.ButtonCallback
            public void onPositive(MaterialDialog dialog) {
                MaterialMultiSelectListPreference.this.onClick(dialog, -1);
            }
        }).items(getEntries()).itemsCallbackMultiChoice((Integer[]) indices.toArray(new Integer[indices.size()]), new MaterialDialog.ListCallbackMultiChoice() { // from class: com.afollestad.materialdialogs.prefs.MaterialMultiSelectListPreference.1
            @Override // com.afollestad.materialdialogs.MaterialDialog.ListCallbackMultiChoice
            public boolean onSelection(MaterialDialog dialog, Integer[] which, CharSequence[] text) {
                MaterialMultiSelectListPreference.this.onClick(null, -1);
                dialog.dismiss();
                Set<String> values = new HashSet<>();
                for (Integer num : which) {
                    int i = num.intValue();
                    values.add(MaterialMultiSelectListPreference.this.getEntryValues()[i].toString());
                }
                if (MaterialMultiSelectListPreference.this.callChangeListener(values)) {
                    MaterialMultiSelectListPreference.this.setValues(values);
                    return true;
                }
                return true;
            }
        }).dismissListener(this);
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

    @Override // android.preference.MultiSelectListPreference, android.preference.DialogPreference, android.preference.Preference
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

    @Override // android.preference.DialogPreference, android.preference.Preference
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

    /* loaded from: com.afollestad.material-dialogs.v0.7.7.0.jar:com/afollestad/materialdialogs/prefs/MaterialMultiSelectListPreference$SavedState.class */
    private static class SavedState extends Preference.BaseSavedState {
        boolean isDialogShowing;
        Bundle dialogBundle;
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: com.afollestad.materialdialogs.prefs.MaterialMultiSelectListPreference.SavedState.1
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
