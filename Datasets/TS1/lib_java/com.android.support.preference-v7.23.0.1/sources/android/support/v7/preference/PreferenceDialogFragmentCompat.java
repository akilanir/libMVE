package android.support.v7.preference;

import android.R;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.FragmentActivity;
import android.support.v7.app.AlertDialog;
import android.support.v7.preference.DialogPreference;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.TextView;

/* loaded from: com.android.support.preference-v7.23.0.1.jar:android/support/v7/preference/PreferenceDialogFragmentCompat.class */
public abstract class PreferenceDialogFragmentCompat extends DialogFragment implements DialogInterface.OnClickListener {
    protected static final String ARG_KEY = "key";
    private DialogPreference mPreference;
    private int mWhichButtonClicked;

    public abstract void onDialogClosed(boolean z);

    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        DialogPreference.TargetFragment targetFragment = getTargetFragment();
        if (!(targetFragment instanceof DialogPreference.TargetFragment)) {
            throw new IllegalStateException("Target fragment must implement TargetFragment interface");
        }
        DialogPreference.TargetFragment fragment = targetFragment;
        String key = getArguments().getString(ARG_KEY);
        this.mPreference = (DialogPreference) fragment.findPreference(key);
    }

    @NonNull
    public Dialog onCreateDialog(Bundle savedInstanceState) {
        FragmentActivity activity = getActivity();
        this.mWhichButtonClicked = -2;
        AlertDialog.Builder builder = new AlertDialog.Builder(activity).setTitle(this.mPreference.getDialogTitle()).setIcon(this.mPreference.getDialogIcon()).setPositiveButton(this.mPreference.getPositiveButtonText(), this).setNegativeButton(this.mPreference.getNegativeButtonText(), this);
        View contentView = onCreateDialogView(activity);
        if (contentView != null) {
            onBindDialogView(contentView);
            builder.setView(contentView);
        } else {
            builder.setMessage(this.mPreference.getDialogMessage());
        }
        onPrepareDialogBuilder(builder);
        AlertDialog create = builder.create();
        if (needInputMethod()) {
            requestInputMethod(create);
        }
        return builder.create();
    }

    public DialogPreference getPreference() {
        return this.mPreference;
    }

    protected void onPrepareDialogBuilder(AlertDialog.Builder builder) {
    }

    protected boolean needInputMethod() {
        return false;
    }

    private void requestInputMethod(Dialog dialog) {
        Window window = dialog.getWindow();
        window.setSoftInputMode(5);
    }

    protected View onCreateDialogView(Context context) {
        int resId = this.mPreference.getDialogLayoutResource();
        if (resId == 0) {
            return null;
        }
        LayoutInflater inflater = LayoutInflater.from(context);
        return inflater.inflate(resId, (ViewGroup) null);
    }

    protected void onBindDialogView(View view) {
        View dialogMessageView = view.findViewById(R.id.message);
        if (dialogMessageView != null) {
            CharSequence message = this.mPreference.getDialogMessage();
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

    public void onDismiss(DialogInterface dialog) {
        super.onDismiss(dialog);
        onDialogClosed(this.mWhichButtonClicked == -1);
    }
}
