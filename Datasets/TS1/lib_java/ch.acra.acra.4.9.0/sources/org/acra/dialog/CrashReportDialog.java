package org.acra.dialog;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.annotation.CallSuper;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import org.acra.ACRA;
import org.acra.prefs.SharedPreferencesFactory;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/dialog/CrashReportDialog.class */
public class CrashReportDialog extends BaseCrashReportDialog implements DialogInterface.OnClickListener {
    private static final String STATE_EMAIL = "email";
    private static final String STATE_COMMENT = "comment";
    private static final int PADDING = 10;
    private LinearLayout scrollable;
    private EditText userCommentView;
    private EditText userEmailView;
    private SharedPreferencesFactory sharedPreferencesFactory;
    private AlertDialog mDialog;

    @Override // org.acra.dialog.BaseCrashReportDialog
    @CallSuper
    protected void init(@Nullable Bundle savedInstanceState) {
        this.scrollable = new LinearLayout(this);
        this.scrollable.setOrientation(1);
        this.sharedPreferencesFactory = new SharedPreferencesFactory(getApplicationContext(), getConfig());
        int themeResourceId = getConfig().resDialogTheme();
        if (themeResourceId != 0) {
            setTheme(themeResourceId);
        }
        buildAndShowDialog(savedInstanceState);
    }

    protected void buildAndShowDialog(@Nullable Bundle savedInstanceState) {
        AlertDialog.Builder dialogBuilder = new AlertDialog.Builder(this);
        int titleResourceId = getConfig().resDialogTitle();
        if (titleResourceId != 0) {
            dialogBuilder.setTitle(titleResourceId);
        }
        int iconResourceId = getConfig().resDialogIcon();
        if (iconResourceId != 0) {
            dialogBuilder.setIcon(iconResourceId);
        }
        dialogBuilder.setView(buildCustomView(savedInstanceState)).setPositiveButton(getText(getConfig().resDialogPositiveButtonText()), this).setNegativeButton(getText(getConfig().resDialogNegativeButtonText()), this);
        this.mDialog = dialogBuilder.create();
        this.mDialog.setCanceledOnTouchOutside(false);
        this.mDialog.show();
    }

    @NonNull
    protected View buildCustomView(@Nullable Bundle savedInstanceState) {
        ScrollView root = new ScrollView(this);
        root.setPadding(PADDING, PADDING, PADDING, PADDING);
        root.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
        root.setFocusable(true);
        root.setFocusableInTouchMode(true);
        root.addView(this.scrollable);
        addViewToDialog(getMainView());
        View comment = getCommentLabel();
        if (comment != null) {
            comment.setPadding(comment.getPaddingLeft(), PADDING, comment.getPaddingRight(), comment.getPaddingBottom());
            addViewToDialog(comment);
            String savedComment = null;
            if (savedInstanceState != null) {
                savedComment = savedInstanceState.getString(STATE_COMMENT);
            }
            this.userCommentView = getCommentPrompt(savedComment);
            addViewToDialog(this.userCommentView);
        }
        View email = getEmailLabel();
        if (email != null) {
            email.setPadding(email.getPaddingLeft(), PADDING, email.getPaddingRight(), email.getPaddingBottom());
            addViewToDialog(email);
            String savedEmail = null;
            if (savedInstanceState != null) {
                savedEmail = savedInstanceState.getString(STATE_EMAIL);
            }
            this.userEmailView = getEmailPrompt(savedEmail);
            addViewToDialog(this.userEmailView);
        }
        return root;
    }

    protected final void addViewToDialog(@NonNull View v) {
        this.scrollable.addView(v);
    }

    @NonNull
    protected View getMainView() {
        TextView text = new TextView(this);
        int dialogTextId = getConfig().resDialogText();
        if (dialogTextId != 0) {
            text.setText(getText(dialogTextId));
        }
        return text;
    }

    @Nullable
    protected View getCommentLabel() {
        int commentPromptId = getConfig().resDialogCommentPrompt();
        if (commentPromptId != 0) {
            TextView labelView = new TextView(this);
            labelView.setText(getText(commentPromptId));
            return labelView;
        }
        return null;
    }

    @NonNull
    protected EditText getCommentPrompt(@Nullable CharSequence savedComment) {
        EditText userCommentView = new EditText(this);
        userCommentView.setLines(2);
        if (savedComment != null) {
            userCommentView.setText(savedComment);
        }
        return userCommentView;
    }

    @Nullable
    protected View getEmailLabel() {
        int emailPromptId = getConfig().resDialogEmailPrompt();
        if (emailPromptId != 0) {
            TextView labelView = new TextView(this);
            labelView.setText(getText(emailPromptId));
            return labelView;
        }
        return null;
    }

    @NonNull
    protected EditText getEmailPrompt(@Nullable CharSequence savedEmail) {
        EditText userEmailView = new EditText(this);
        userEmailView.setSingleLine();
        userEmailView.setInputType(33);
        if (savedEmail != null) {
            userEmailView.setText(savedEmail);
        } else {
            SharedPreferences prefs = this.sharedPreferencesFactory.create();
            userEmailView.setText(prefs.getString(ACRA.PREF_USER_EMAIL_ADDRESS, ""));
        }
        return userEmailView;
    }

    @Override // android.content.DialogInterface.OnClickListener
    public void onClick(DialogInterface dialog, int which) {
        String userEmail;
        if (which == -1) {
            String comment = this.userCommentView != null ? this.userCommentView.getText().toString() : "";
            SharedPreferences prefs = this.sharedPreferencesFactory.create();
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

    @Override // android.app.Activity
    @CallSuper
    protected void onSaveInstanceState(@NonNull Bundle outState) {
        super.onSaveInstanceState(outState);
        if (this.userCommentView != null && this.userCommentView.getText() != null) {
            outState.putString(STATE_COMMENT, this.userCommentView.getText().toString());
        }
        if (this.userEmailView != null && this.userEmailView.getText() != null) {
            outState.putString(STATE_EMAIL, this.userEmailView.getText().toString());
        }
    }

    protected AlertDialog getDialog() {
        return this.mDialog;
    }
}
