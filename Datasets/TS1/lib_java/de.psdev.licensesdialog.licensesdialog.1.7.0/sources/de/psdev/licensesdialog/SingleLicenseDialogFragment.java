package de.psdev.licensesdialog;

import android.app.Dialog;
import android.content.DialogInterface;
import android.content.res.Resources;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import de.psdev.licensesdialog.LicensesDialog;
import de.psdev.licensesdialog.model.Notice;

/* loaded from: de.psdev.licensesdialog.licensesdialog.1.7.0.jar:de/psdev/licensesdialog/SingleLicenseDialogFragment.class */
public class SingleLicenseDialogFragment extends DialogFragment {
    private static final String ARGUMENT_NOTICE = "ARGUMENT_NOTICE";
    private static final String ARGUMENT_FULL_LICENSE_TEXT = "ARGUMENT_FULL_LICENSE_TEXT";
    private static final String STATE_LICENSE_TEXT = "license_text";
    private static final String STATE_TITLE_TEXT = "title_text";
    private static final String STATE_CLOSE_TEXT = "close_text";
    private String mTitleText;
    private String mCloseButtonText;
    private String mLicenseText;
    private boolean mShowFullLicenseText;
    private DialogInterface.OnDismissListener mOnDismissListener;

    public static SingleLicenseDialogFragment newInstance(Notice notice) {
        return newInstance(notice, false);
    }

    public static SingleLicenseDialogFragment newInstance(Notice notice, boolean showFullLicenseText) {
        SingleLicenseDialogFragment fragment = new SingleLicenseDialogFragment();
        Bundle args = new Bundle();
        args.putParcelable(ARGUMENT_NOTICE, notice);
        args.putBoolean(ARGUMENT_FULL_LICENSE_TEXT, showFullLicenseText);
        fragment.setArguments(args);
        return fragment;
    }

    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        Resources resources = getResources();
        if (savedInstanceState != null) {
            this.mTitleText = savedInstanceState.getString(STATE_TITLE_TEXT);
            this.mLicenseText = savedInstanceState.getString(STATE_LICENSE_TEXT);
            this.mCloseButtonText = savedInstanceState.getString(STATE_CLOSE_TEXT);
            return;
        }
        this.mTitleText = resources.getString(R.string.notices_title);
        this.mCloseButtonText = resources.getString(R.string.notices_close);
        try {
            Notice notice = getNotice();
            boolean showFullLicenseText = getArguments().getBoolean(ARGUMENT_FULL_LICENSE_TEXT, false);
            this.mLicenseText = NoticesHtmlBuilder.create(getActivity()).setNotice(notice).setShowFullLicenseText(showFullLicenseText).build();
        } catch (Exception e) {
            throw new IllegalStateException(e);
        }
    }

    public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putString(STATE_TITLE_TEXT, this.mTitleText);
        outState.putString(STATE_LICENSE_TEXT, this.mLicenseText);
        outState.putString(STATE_CLOSE_TEXT, this.mCloseButtonText);
    }

    public Dialog onCreateDialog(Bundle savedInstanceState) {
        return new LicensesDialog.Builder(getActivity()).setNotices(this.mLicenseText).setTitle(this.mTitleText).setCloseText(this.mCloseButtonText).build().create();
    }

    public void onDismiss(DialogInterface dialog) {
        super.onDismiss(dialog);
        if (this.mOnDismissListener != null) {
            this.mOnDismissListener.onDismiss(dialog);
        }
    }

    public DialogInterface.OnDismissListener getOnDismissListener() {
        return this.mOnDismissListener;
    }

    public void setOnDismissListener(DialogInterface.OnDismissListener onDismissListener) {
        this.mOnDismissListener = onDismissListener;
    }

    public boolean isShowFullLicenseText() {
        return this.mShowFullLicenseText;
    }

    public void setShowFullLicenseText(boolean showFullLicenseText) {
        this.mShowFullLicenseText = showFullLicenseText;
    }

    private Notice getNotice() {
        Bundle arguments = getArguments();
        if (arguments != null && arguments.containsKey(ARGUMENT_NOTICE)) {
            return (Notice) arguments.getParcelable(ARGUMENT_NOTICE);
        }
        throw new IllegalStateException("no notice provided");
    }
}
