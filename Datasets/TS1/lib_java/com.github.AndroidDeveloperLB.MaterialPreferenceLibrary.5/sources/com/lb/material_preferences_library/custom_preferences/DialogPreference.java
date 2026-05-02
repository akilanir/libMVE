package com.lb.material_preferences_library.custom_preferences;

import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.preference.Preference;
import android.preference.PreferenceManager;
import android.support.v4.content.res.ResourcesCompat;
import android.support.v7.app.AlertDialog;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.TextView;
import com.lb.material_preferences_library.R;

/* loaded from: com.github.AndroidDeveloperLB.MaterialPreferenceLibrary.5.jar:com/lb/material_preferences_library/custom_preferences/DialogPreference.class */
public abstract class DialogPreference extends Preference implements DialogInterface.OnClickListener, DialogInterface.OnDismissListener, PreferenceManager.OnActivityDestroyListener {
    private AlertDialog.Builder mBuilder;
    private CharSequence mDialogTitle;
    private CharSequence mDialogMessage;
    private Drawable mDialogIcon;
    private CharSequence mPositiveButtonText;
    private CharSequence mNegativeButtonText;
    private int mDialogLayoutResId;
    private Dialog mDialog;
    private int mWhichButtonClicked;

    public DialogPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
    }

    public DialogPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
    }

    public DialogPreference(Context context, AttributeSet attrs) {
        this(context, attrs, R.attr.dialogPreferenceStyle);
    }

    public DialogPreference(Context context) {
        this(context, null);
    }

    @Override // com.lb.material_preferences_library.custom_preferences.Preference
    protected void init(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super.init(context, attrs, defStyleAttr, defStyleRes);
        TypedArray a = context.obtainStyledAttributes(attrs, R.styleable.DialogPreference, defStyleAttr, defStyleRes);
        this.mDialogTitle = a.getString(R.styleable.DialogPreference_dialogTitle);
        if (this.mDialogTitle == null) {
            this.mDialogTitle = getTitle();
        }
        this.mDialogMessage = a.getString(R.styleable.DialogPreference_dialogMessage);
        this.mDialogIcon = a.getDrawable(R.styleable.DialogPreference_dialogIcon);
        this.mPositiveButtonText = a.getString(R.styleable.DialogPreference_positiveButtonText);
        this.mNegativeButtonText = a.getString(R.styleable.DialogPreference_negativeButtonText);
        this.mDialogLayoutResId = a.getResourceId(R.styleable.DialogPreference_dialogLayout, this.mDialogLayoutResId);
        a.recycle();
    }

    public void setDialogTitle(CharSequence dialogTitle) {
        this.mDialogTitle = dialogTitle;
    }

    public CharSequence getDialogTitle() {
        return this.mDialogTitle;
    }

    public void setDialogTitle(int dialogTitleResId) {
        setDialogTitle(getContext().getString(dialogTitleResId));
    }

    public void setDialogMessage(CharSequence dialogMessage) {
        this.mDialogMessage = dialogMessage;
    }

    public CharSequence getDialogMessage() {
        return this.mDialogMessage;
    }

    public void setDialogMessage(int dialogMessageResId) {
        setDialogMessage(getContext().getString(dialogMessageResId));
    }

    public void setDialogIcon(Drawable dialogIcon) {
        this.mDialogIcon = dialogIcon;
    }

    public Drawable getDialogIcon() {
        return this.mDialogIcon;
    }

    public void setDialogIcon(int dialogIconRes) {
        this.mDialogIcon = ResourcesCompat.getDrawable(getContext().getResources(), dialogIconRes, (Resources.Theme) null);
    }

    public void setPositiveButtonText(CharSequence positiveButtonText) {
        this.mPositiveButtonText = positiveButtonText;
    }

    public CharSequence getPositiveButtonText() {
        return this.mPositiveButtonText;
    }

    public void setPositiveButtonText(int positiveButtonTextResId) {
        setPositiveButtonText(getContext().getString(positiveButtonTextResId));
    }

    public void setNegativeButtonText(CharSequence negativeButtonText) {
        this.mNegativeButtonText = negativeButtonText;
    }

    public CharSequence getNegativeButtonText() {
        return this.mNegativeButtonText;
    }

    public void setNegativeButtonText(int negativeButtonTextResId) {
        setNegativeButtonText(getContext().getString(negativeButtonTextResId));
    }

    public int getDialogLayoutResource() {
        return this.mDialogLayoutResId;
    }

    public void setDialogLayoutResource(int dialogLayoutResId) {
        this.mDialogLayoutResId = dialogLayoutResId;
    }

    protected void onPrepareDialogBuilder(AlertDialog.Builder builder) {
    }

    @Override // android.preference.Preference
    protected void onClick() {
        if (this.mDialog == null || !this.mDialog.isShowing()) {
            showDialog(null);
        }
    }

    protected void showDialog(Bundle state) {
        Context context = getContext();
        this.mWhichButtonClicked = -2;
        this.mBuilder = new AlertDialog.Builder(context).setTitle(this.mDialogTitle).setIcon(this.mDialogIcon).setPositiveButton(this.mPositiveButtonText, this).setNegativeButton(this.mNegativeButtonText, this);
        View contentView = onCreateDialogView();
        if (contentView != null) {
            onBindDialogView(contentView);
            this.mBuilder.setView(contentView);
        } else {
            this.mBuilder.setMessage(this.mDialogMessage);
        }
        onPrepareDialogBuilder(this.mBuilder);
        PreferenceManagerEx.getInstance().registerOnActivityDestroyListener(getPreferenceManager(), this);
        AlertDialog create = this.mBuilder.create();
        this.mDialog = create;
        if (state != null) {
            create.onRestoreInstanceState(state);
        }
        if (needInputMethod()) {
            requestInputMethod(create);
        }
        create.setOnDismissListener(this);
        create.show();
    }

    protected boolean needInputMethod() {
        return false;
    }

    private void requestInputMethod(Dialog dialog) {
        Window window = dialog.getWindow();
        window.setSoftInputMode(5);
    }

    protected View onCreateDialogView() {
        if (this.mDialogLayoutResId == 0) {
            return null;
        }
        LayoutInflater inflater = LayoutInflater.from(this.mBuilder.getContext());
        return inflater.inflate(this.mDialogLayoutResId, (ViewGroup) null);
    }

    protected void onBindDialogView(View view) {
        View dialogMessageView = view.findViewById(android.R.id.message);
        if (dialogMessageView != null) {
            CharSequence message = getDialogMessage();
            int newVisibility = 8;
            if (!TextUtils.isEmpty(message)) {
                if (dialogMessageView instanceof TextView) {
                    ((TextView) dialogMessageView).setText(message);
                }
                newVisibility = 0;
            }
            if (dialogMessageView.getVisibility() != newVisibility) {
                dialogMessageView.setVisibility(newVisibility);
            }
        }
    }

    @Override // android.content.DialogInterface.OnClickListener
    public void onClick(DialogInterface dialog, int which) {
        this.mWhichButtonClicked = which;
    }

    @Override // android.content.DialogInterface.OnDismissListener
    public void onDismiss(DialogInterface dialog) {
        PreferenceManagerEx.getInstance().unregisterOnActivityDestroyListener(getPreferenceManager(), this);
        this.mDialog = null;
        onDialogClosed(this.mWhichButtonClicked == -1);
    }

    protected void onDialogClosed(boolean positiveResult) {
    }

    public Dialog getDialog() {
        return this.mDialog;
    }

    @Override // android.preference.PreferenceManager.OnActivityDestroyListener
    public void onActivityDestroy() {
        if (this.mDialog == null || !this.mDialog.isShowing()) {
            return;
        }
        this.mDialog.dismiss();
    }

    @Override // android.preference.Preference
    protected Parcelable onSaveInstanceState() {
        Parcelable superState = super.onSaveInstanceState();
        if (this.mDialog == null || !this.mDialog.isShowing()) {
            return superState;
        }
        SavedState myState = new SavedState(superState);
        myState.isDialogShowing = true;
        myState.dialogBundle = this.mDialog.onSaveInstanceState();
        return myState;
    }

    @Override // android.preference.Preference
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

    /* loaded from: com.github.AndroidDeveloperLB.MaterialPreferenceLibrary.5.jar:com/lb/material_preferences_library/custom_preferences/DialogPreference$SavedState.class */
    private static class SavedState extends Preference.BaseSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: com.lb.material_preferences_library.custom_preferences.DialogPreference.SavedState.1
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
        boolean isDialogShowing;
        Bundle dialogBundle;

        public SavedState(Parcel source) {
            super(source);
            this.isDialogShowing = source.readInt() == 1;
            this.dialogBundle = source.readBundle();
        }

        public SavedState(Parcelable superState) {
            super(superState);
        }

        @Override // android.view.AbsSavedState, android.os.Parcelable
        public void writeToParcel(Parcel dest, int flags) {
            super.writeToParcel(dest, flags);
            dest.writeInt(this.isDialogShowing ? 1 : 0);
            dest.writeBundle(this.dialogBundle);
        }
    }
}
