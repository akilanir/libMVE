package com.rey.material.app;

import android.content.Context;
import android.content.DialogInterface;
import android.os.Bundle;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.view.View;

/* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/DialogFragment.class */
public class DialogFragment extends android.support.v4.app.DialogFragment {
    protected static final String ARG_BUILDER = "arg_builder";
    protected Builder mBuilder;
    private View.OnClickListener mActionListener = new View.OnClickListener() { // from class: com.rey.material.app.DialogFragment.1
        @Override // android.view.View.OnClickListener
        public void onClick(View v) {
            if (DialogFragment.this.mBuilder == null) {
                return;
            }
            if (v.getId() == Dialog.ACTION_POSITIVE) {
                DialogFragment.this.mBuilder.onPositiveActionClicked(DialogFragment.this);
            } else if (v.getId() == Dialog.ACTION_NEGATIVE) {
                DialogFragment.this.mBuilder.onNegativeActionClicked(DialogFragment.this);
            } else if (v.getId() == Dialog.ACTION_NEUTRAL) {
                DialogFragment.this.mBuilder.onNeutralActionClicked(DialogFragment.this);
            }
        }
    };

    /* loaded from: com.github.rey5137.material.1.2.2.jar:com/rey/material/app/DialogFragment$Builder.class */
    public interface Builder {
        Dialog build(Context context);

        void onPositiveActionClicked(DialogFragment dialogFragment);

        void onNegativeActionClicked(DialogFragment dialogFragment);

        void onNeutralActionClicked(DialogFragment dialogFragment);

        void onCancel(DialogInterface dialogInterface);

        void onDismiss(DialogInterface dialogInterface);
    }

    public static DialogFragment newInstance(Builder builder) {
        DialogFragment fragment = new DialogFragment();
        fragment.mBuilder = builder;
        return fragment;
    }

    @NonNull
    /* renamed from: onCreateDialog, reason: merged with bridge method [inline-methods] */
    public Dialog m3onCreateDialog(Bundle savedInstanceState) {
        Dialog dialog = this.mBuilder == null ? new Dialog(getActivity()) : this.mBuilder.build(getActivity());
        dialog.positiveActionClickListener(this.mActionListener).negativeActionClickListener(this.mActionListener).neutralActionClickListener(this.mActionListener);
        return dialog;
    }

    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (savedInstanceState != null && this.mBuilder == null) {
            this.mBuilder = (Builder) savedInstanceState.getParcelable(ARG_BUILDER);
        }
    }

    public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        if (this.mBuilder != null && (this.mBuilder instanceof Parcelable)) {
            outState.putParcelable(ARG_BUILDER, (Parcelable) this.mBuilder);
        }
    }

    public void onDestroyView() {
        android.app.Dialog dialog = getDialog();
        if (dialog != null && (dialog instanceof Dialog)) {
            ((Dialog) dialog).dismissImmediately();
        }
        super.onDestroyView();
    }

    public void onCancel(DialogInterface dialog) {
        super.onCancel(dialog);
        this.mBuilder.onCancel(dialog);
    }

    public void onDismiss(DialogInterface dialog) {
        super.onDismiss(dialog);
        this.mBuilder.onDismiss(dialog);
    }
}
