package com.greysonparrelli.permiso;

import android.R;
import android.app.Dialog;
import android.app.DialogFragment;
import android.content.DialogInterface;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v7.app.AlertDialog;

/* loaded from: com.greysonparrelli.permiso.permiso.0.1.3.jar:com/greysonparrelli/permiso/PermisoDialogFragment.class */
public class PermisoDialogFragment extends DialogFragment {
    public static String TAG = "PermisoDialogFragment";
    private static final String KEY_TITLE = "title";
    private static final String KEY_MESSAGE = "message";
    private static final String KEY_BUTTON_TEXT = "button_text";
    private String mTitle;
    private String mMessage;
    private String mButtonText;
    private IOnCloseListener mOnCloseListener;

    /* loaded from: com.greysonparrelli.permiso.permiso.0.1.3.jar:com/greysonparrelli/permiso/PermisoDialogFragment$IOnCloseListener.class */
    public interface IOnCloseListener {
        void onClose();
    }

    public static PermisoDialogFragment newInstance(@Nullable String title, @NonNull String message, @Nullable String buttonText) {
        PermisoDialogFragment dialogFragment = new PermisoDialogFragment();
        Bundle args = new Bundle();
        args.putString(KEY_TITLE, title);
        args.putString(KEY_MESSAGE, message);
        args.putString(KEY_BUTTON_TEXT, buttonText);
        dialogFragment.setArguments(args);
        return dialogFragment;
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setRetainInstance(true);
        this.mTitle = getArguments().getString(KEY_TITLE);
        this.mMessage = getArguments().getString(KEY_MESSAGE);
        this.mButtonText = getArguments().getString(KEY_BUTTON_TEXT);
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        if (getDialog() != null && getRetainInstance()) {
            getDialog().setDismissMessage(null);
        }
        super.onDestroyView();
    }

    @Override // android.app.DialogFragment
    public Dialog onCreateDialog(Bundle savedInstanceState) {
        String buttonText;
        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
        if (this.mTitle != null) {
            builder.setTitle(this.mTitle);
        }
        if (this.mMessage != null) {
            builder.setMessage(this.mMessage);
        }
        if (this.mButtonText != null) {
            buttonText = this.mButtonText;
        } else {
            buttonText = getString(R.string.ok);
        }
        builder.setPositiveButton(buttonText, new DialogInterface.OnClickListener() { // from class: com.greysonparrelli.permiso.PermisoDialogFragment.1
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialog, int which) {
                if (PermisoDialogFragment.this.mOnCloseListener != null) {
                    PermisoDialogFragment.this.mOnCloseListener.onClose();
                }
            }
        });
        return builder.create();
    }

    @Override // android.app.DialogFragment, android.content.DialogInterface.OnCancelListener
    public void onCancel(DialogInterface dialog) {
        super.onCancel(dialog);
        if (this.mOnCloseListener != null) {
            this.mOnCloseListener.onClose();
        }
    }

    public void setOnCloseListener(IOnCloseListener listener) {
        this.mOnCloseListener = listener;
    }
}
