package com.nononsenseapps.filepicker;

import android.R;
import android.app.Activity;
import android.app.Dialog;
import android.content.DialogInterface;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v4.app.DialogFragment;
import android.support.v7.app.AlertDialog;
import android.text.Editable;
import android.text.TextWatcher;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

/* loaded from: com.nononsenseapps.filepicker.2.5.0.jar:com/nononsenseapps/filepicker/NewItemFragment.class */
public abstract class NewItemFragment extends DialogFragment {
    private OnNewFolderListener listener = null;

    /* loaded from: com.nononsenseapps.filepicker.2.5.0.jar:com/nononsenseapps/filepicker/NewItemFragment$OnNewFolderListener.class */
    public interface OnNewFolderListener {
        void onNewFolder(String str);
    }

    protected abstract boolean validateName(String str);

    public void setListener(OnNewFolderListener listener) {
        this.listener = listener;
    }

    public void onAttach(Activity activity) {
        super.onAttach(activity);
    }

    @NonNull
    public Dialog onCreateDialog(Bundle savedInstanceState) {
        AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
        builder.setView(R.layout.nnf_dialog_folder_name).setTitle(R.string.nnf_new_folder).setNegativeButton(R.string.cancel, (DialogInterface.OnClickListener) null).setPositiveButton(R.string.ok, (DialogInterface.OnClickListener) null);
        AlertDialog dialog = builder.create();
        dialog.setOnShowListener(new DialogInterface.OnShowListener() { // from class: com.nononsenseapps.filepicker.NewItemFragment.1
            @Override // android.content.DialogInterface.OnShowListener
            public void onShow(DialogInterface dialog1) {
                final AlertDialog dialog2 = (AlertDialog) dialog1;
                final EditText editText = (EditText) dialog2.findViewById(R.id.edit_text);
                Button cancel = dialog2.getButton(-2);
                cancel.setOnClickListener(new View.OnClickListener() { // from class: com.nononsenseapps.filepicker.NewItemFragment.1.1
                    @Override // android.view.View.OnClickListener
                    public void onClick(View view) {
                        dialog2.cancel();
                    }
                });
                final Button ok = dialog2.getButton(-1);
                ok.setEnabled(false);
                ok.setOnClickListener(new View.OnClickListener() { // from class: com.nononsenseapps.filepicker.NewItemFragment.1.2
                    @Override // android.view.View.OnClickListener
                    public void onClick(View view) {
                        String itemName = editText.getText().toString();
                        if (NewItemFragment.this.validateName(itemName)) {
                            if (NewItemFragment.this.listener != null) {
                                NewItemFragment.this.listener.onNewFolder(itemName);
                            }
                            dialog2.dismiss();
                        }
                    }
                });
                editText.addTextChangedListener(new TextWatcher() { // from class: com.nononsenseapps.filepicker.NewItemFragment.1.3
                    @Override // android.text.TextWatcher
                    public void beforeTextChanged(CharSequence s, int start, int count, int after) {
                    }

                    @Override // android.text.TextWatcher
                    public void onTextChanged(CharSequence s, int start, int before, int count) {
                    }

                    @Override // android.text.TextWatcher
                    public void afterTextChanged(Editable s) {
                        ok.setEnabled(NewItemFragment.this.validateName(s.toString()));
                    }
                });
            }
        });
        return dialog;
    }
}
