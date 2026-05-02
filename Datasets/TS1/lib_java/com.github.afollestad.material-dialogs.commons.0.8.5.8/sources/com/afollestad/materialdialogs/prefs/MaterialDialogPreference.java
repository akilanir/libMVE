package com.afollestad.materialdialogs.prefs;

import android.annotation.TargetApi;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.preference.DialogPreference;
import android.preference.Preference;
import android.support.annotation.NonNull;
import android.util.AttributeSet;
import android.view.View;
import com.afollestad.materialdialogs.DialogAction;
import com.afollestad.materialdialogs.MaterialDialog;
import com.afollestad.materialdialogs.commons.BuildConfig;

/* loaded from: com.github.afollestad.material-dialogs.commons.0.8.5.8.jar:com/afollestad/materialdialogs/prefs/MaterialDialogPreference.class */
public class MaterialDialogPreference extends DialogPreference {
    private Context context;
    private MaterialDialog mDialog;

    @TargetApi(21)
    public MaterialDialogPreference(Context context) {
        super(context);
        init(context, null);
    }

    public MaterialDialogPreference(Context context, AttributeSet attrs) {
        super(context, attrs);
        init(context, attrs);
    }

    public MaterialDialogPreference(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init(context, attrs);
    }

    @TargetApi(21)
    public MaterialDialogPreference(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        init(context, attrs);
    }

    private void init(Context context, AttributeSet attrs) {
        this.context = context;
        PrefUtil.setLayoutResource(context, this, attrs);
    }

    @Override // android.preference.DialogPreference
    public Dialog getDialog() {
        return this.mDialog;
    }

    @Override // android.preference.DialogPreference
    protected void showDialog(Bundle state) {
        MaterialDialog.Builder builder = new MaterialDialog.Builder(this.context).title(getDialogTitle()).icon(getDialogIcon()).dismissListener(this).onAny(new MaterialDialog.SingleButtonCallback() { // from class: com.afollestad.materialdialogs.prefs.MaterialDialogPreference.1
            public void onClick(@NonNull MaterialDialog dialog, @NonNull DialogAction which) {
                switch (AnonymousClass2.$SwitchMap$com$afollestad$materialdialogs$DialogAction[which.ordinal()]) {
                    case BuildConfig.VERSION_CODE /* 1 */:
                        MaterialDialogPreference.this.onClick(dialog, -3);
                        break;
                    case 2:
                        MaterialDialogPreference.this.onClick(dialog, -2);
                        break;
                    default:
                        MaterialDialogPreference.this.onClick(dialog, -1);
                        break;
                }
            }
        }).positiveText(getPositiveButtonText()).negativeText(getNegativeButtonText()).autoDismiss(true);
        View contentView = onCreateDialogView();
        if (contentView != null) {
            onBindDialogView(contentView);
            builder.customView(contentView, false);
        } else {
            builder.content(getDialogMessage());
        }
        PrefUtil.registerOnActivityDestroyListener(this, this);
        this.mDialog = builder.build();
        if (state != null) {
            this.mDialog.onRestoreInstanceState(state);
        }
        this.mDialog.show();
    }

    /* renamed from: com.afollestad.materialdialogs.prefs.MaterialDialogPreference$2, reason: invalid class name */
    /* loaded from: com.github.afollestad.material-dialogs.commons.0.8.5.8.jar:com/afollestad/materialdialogs/prefs/MaterialDialogPreference$2.class */
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

    @Override // android.preference.DialogPreference, android.preference.PreferenceManager.OnActivityDestroyListener
    public void onActivityDestroy() {
        super.onActivityDestroy();
        if (this.mDialog != null && this.mDialog.isShowing()) {
            this.mDialog.dismiss();
        }
    }

    @Override // android.preference.DialogPreference, android.preference.Preference
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

    /* loaded from: com.github.afollestad.material-dialogs.commons.0.8.5.8.jar:com/afollestad/materialdialogs/prefs/MaterialDialogPreference$SavedState.class */
    private static class SavedState extends Preference.BaseSavedState {
        boolean isDialogShowing;
        Bundle dialogBundle;
        public static final Parcelable.Creator<SavedState> CREATOR = new Parcelable.Creator<SavedState>() { // from class: com.afollestad.materialdialogs.prefs.MaterialDialogPreference.SavedState.1
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
