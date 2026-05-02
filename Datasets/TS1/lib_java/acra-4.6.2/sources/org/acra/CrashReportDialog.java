package org.acra;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

/* loaded from: acra-4.6.2.jar:org/acra/CrashReportDialog.class */
public class CrashReportDialog extends BaseCrashReportDialog implements DialogInterface.OnClickListener, DialogInterface.OnDismissListener {
    private static final String STATE_EMAIL = "email";
    private static final String STATE_COMMENT = "comment";
    private EditText userCommentView;
    private EditText userEmailView;
    AlertDialog mDialog;

    @Override // org.acra.BaseCrashReportDialog, android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        AlertDialog.Builder dialogBuilder = new AlertDialog.Builder(this);
        int titleResourceId = ACRA.getConfig().resDialogTitle();
        if (titleResourceId != 0) {
            dialogBuilder.setTitle(titleResourceId);
        }
        int iconResourceId = ACRA.getConfig().resDialogIcon();
        if (iconResourceId != 0) {
            dialogBuilder.setIcon(iconResourceId);
        }
        dialogBuilder.setView(buildCustomView(savedInstanceState));
        dialogBuilder.setPositiveButton(getText(ACRA.getConfig().resDialogPositiveButtonText()), this);
        dialogBuilder.setNegativeButton(getText(ACRA.getConfig().resDialogNegativeButtonText()), this);
        this.mDialog = dialogBuilder.create();
        this.mDialog.setCanceledOnTouchOutside(false);
        this.mDialog.setOnDismissListener(this);
        this.mDialog.show();
    }

    protected View buildCustomView(Bundle savedInstanceState) {
        String savedValue;
        LinearLayout linearLayout = new LinearLayout(this);
        linearLayout.setOrientation(1);
        linearLayout.setPadding(10, 10, 10, 10);
        linearLayout.setLayoutParams(new ViewGroup.LayoutParams(-1, -2));
        linearLayout.setFocusable(true);
        linearLayout.setFocusableInTouchMode(true);
        ScrollView scrollView = new ScrollView(this);
        linearLayout.addView(scrollView, new LinearLayout.LayoutParams(-1, -1, 1.0f));
        LinearLayout scrollable = new LinearLayout(this);
        scrollable.setOrientation(1);
        scrollView.addView(scrollable);
        TextView text = new TextView(this);
        int dialogTextId = ACRA.getConfig().resDialogText();
        if (dialogTextId != 0) {
            text.setText(getText(dialogTextId));
        }
        scrollable.addView(text);
        int commentPromptId = ACRA.getConfig().resDialogCommentPrompt();
        if (commentPromptId != 0) {
            TextView label = new TextView(this);
            label.setText(getText(commentPromptId));
            label.setPadding(label.getPaddingLeft(), 10, label.getPaddingRight(), label.getPaddingBottom());
            scrollable.addView(label, new LinearLayout.LayoutParams(-1, -2));
            this.userCommentView = new EditText(this);
            this.userCommentView.setLines(2);
            if (savedInstanceState != null && (savedValue = savedInstanceState.getString(STATE_COMMENT)) != null) {
                this.userCommentView.setText(savedValue);
            }
            scrollable.addView(this.userCommentView);
        }
        int emailPromptId = ACRA.getConfig().resDialogEmailPrompt();
        if (emailPromptId != 0) {
            TextView label2 = new TextView(this);
            label2.setText(getText(emailPromptId));
            label2.setPadding(label2.getPaddingLeft(), 10, label2.getPaddingRight(), label2.getPaddingBottom());
            scrollable.addView(label2);
            this.userEmailView = new EditText(this);
            this.userEmailView.setSingleLine();
            this.userEmailView.setInputType(33);
            String savedValue2 = null;
            if (savedInstanceState != null) {
                savedValue2 = savedInstanceState.getString(STATE_EMAIL);
            }
            if (savedValue2 != null) {
                this.userEmailView.setText(savedValue2);
            } else {
                SharedPreferences prefs = ACRA.getACRASharedPreferences();
                this.userEmailView.setText(prefs.getString(ACRA.PREF_USER_EMAIL_ADDRESS, ""));
            }
            scrollable.addView(this.userEmailView);
        }
        return linearLayout;
    }

    @Override // android.content.DialogInterface.OnClickListener
    public void onClick(DialogInterface dialog, int which) {
        String userEmail;
        if (which == -1) {
            String comment = this.userCommentView != null ? this.userCommentView.getText().toString() : "";
            SharedPreferences prefs = ACRA.getACRASharedPreferences();
            if (this.userEmailView != null) {
                userEmail = this.userEmailView.getText().toString();
                SharedPreferences.Editor prefEditor = prefs.edit();
                prefEditor.putString(ACRA.PREF_USER_EMAIL_ADDRESS, userEmail);
                prefEditor.commit();
            } else {
                userEmail = prefs.getString(ACRA.PREF_USER_EMAIL_ADDRESS, "");
            }
            sendCrash(comment, userEmail);
        } else {
            cancelReports();
        }
        finish();
    }

    @Override // android.content.DialogInterface.OnDismissListener
    public void onDismiss(DialogInterface dialog) {
        finish();
    }

    @Override // android.app.Activity
    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        if (this.userCommentView != null && this.userCommentView.getText() != null) {
            outState.putString(STATE_COMMENT, this.userCommentView.getText().toString());
        }
        if (this.userEmailView != null && this.userEmailView.getText() != null) {
            outState.putString(STATE_EMAIL, this.userEmailView.getText().toString());
        }
    }
}
