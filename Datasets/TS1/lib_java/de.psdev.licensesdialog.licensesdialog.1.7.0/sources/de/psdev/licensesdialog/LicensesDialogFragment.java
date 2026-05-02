package de.psdev.licensesdialog;

import android.R;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.res.Resources;
import android.os.Build;
import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import de.psdev.licensesdialog.LicensesDialog;
import de.psdev.licensesdialog.model.Notices;

/* loaded from: de.psdev.licensesdialog.licensesdialog.1.7.0.jar:de/psdev/licensesdialog/LicensesDialogFragment.class */
public class LicensesDialogFragment extends DialogFragment {
    private static final String ARGUMENT_NOTICES = "ARGUMENT_NOTICES";
    private static final String ARGUMENT_NOTICES_XML_ID = "ARGUMENT_NOTICES_XML_ID";
    private static final String ARGUMENT_INCLUDE_OWN_LICENSE = "ARGUMENT_INCLUDE_OWN_LICENSE";
    private static final String ARGUMENT_FULL_LICENSE_TEXT = "ARGUMENT_FULL_LICENSE_TEXT";
    private static final String ARGUMENT_THEME_XML_ID = "ARGUMENT_THEME_XML_ID";
    private static final String ARGUMENT_DIVIDER_COLOR = "ARGUMENT_DIVIDER_COLOR";
    private static final String STATE_TITLE_TEXT = "title_text";
    private static final String STATE_LICENSES_TEXT = "licenses_text";
    private static final String STATE_CLOSE_TEXT = "close_text";
    private static final String STATE_THEME_XML_ID = "theme_xml_id";
    private static final String STATE_DIVIDER_COLOR = "divider_color";
    private String mTitleText;
    private String mCloseButtonText;
    private String mLicensesText;
    private int mThemeResourceId;
    private int mDividerColor;
    private DialogInterface.OnDismissListener mOnDismissListener;

    public static LicensesDialogFragment newInstance(int rawNoticesResourceId) {
        return newInstance(rawNoticesResourceId, false);
    }

    public static LicensesDialogFragment newInstance(int rawNoticesResourceId, boolean showFullLicenseText) {
        return newInstance(rawNoticesResourceId, showFullLicenseText, false);
    }

    public static LicensesDialogFragment newInstance(int rawNoticesResourceId, boolean showFullLicenseText, boolean includeOwnLicense) {
        return newInstance(rawNoticesResourceId, showFullLicenseText, includeOwnLicense, 0);
    }

    public static LicensesDialogFragment newInstance(int rawNoticesResourceId, boolean showFullLicenseText, boolean includeOwnLicense, int themeResourceId) {
        return newInstance(rawNoticesResourceId, showFullLicenseText, includeOwnLicense, themeResourceId, 0);
    }

    public static LicensesDialogFragment newInstance(int rawNoticesResourceId, boolean showFullLicenseText, boolean includeOwnLicense, int themeResourceId, int dividerColor) {
        return newInstance((Notices) null, rawNoticesResourceId, showFullLicenseText, includeOwnLicense, themeResourceId, dividerColor);
    }

    public static LicensesDialogFragment newInstance(int rawNoticesResourceId, boolean showFullLicenseText, boolean includeOwnLicense, int themeResourceId, int dividerColorId, Context context) {
        return newInstance((Notices) null, rawNoticesResourceId, showFullLicenseText, includeOwnLicense, themeResourceId, getColor(dividerColorId, context));
    }

    public static LicensesDialogFragment newInstance(Notices notices, boolean showFullLicenseText, boolean includeOwnLicense) {
        return newInstance(notices, showFullLicenseText, includeOwnLicense, 0);
    }

    public static LicensesDialogFragment newInstance(Notices notices, boolean showFullLicenseText, boolean includeOwnLicense, int themeResourceId) {
        return newInstance(notices, showFullLicenseText, includeOwnLicense, themeResourceId, 0);
    }

    public static LicensesDialogFragment newInstance(Notices notices, boolean showFullLicenseText, boolean includeOwnLicense, int themeResourceId, int dividerColor) {
        return newInstance(notices, -1, showFullLicenseText, includeOwnLicense, themeResourceId, dividerColor);
    }

    public static LicensesDialogFragment newInstance(Notices notices, boolean showFullLicenseText, boolean includeOwnLicense, int themeResourceId, int dividerColorId, Context context) {
        return newInstance(notices, -1, showFullLicenseText, includeOwnLicense, themeResourceId, getColor(dividerColorId, context));
    }

    private static LicensesDialogFragment newInstance(Notices notices, int rawNoticesResourceId, boolean showFullLicenseText, boolean includeOwnLicense, int themeResourceId, int dividerColor) {
        LicensesDialogFragment licensesDialogFragment = new LicensesDialogFragment();
        Bundle args = new Bundle();
        if (notices != null) {
            args.putParcelable(ARGUMENT_NOTICES, notices);
        } else {
            args.putInt(ARGUMENT_NOTICES_XML_ID, rawNoticesResourceId);
        }
        args.putBoolean(ARGUMENT_FULL_LICENSE_TEXT, showFullLicenseText);
        args.putBoolean(ARGUMENT_INCLUDE_OWN_LICENSE, includeOwnLicense);
        args.putInt(ARGUMENT_THEME_XML_ID, themeResourceId);
        args.putInt(ARGUMENT_DIVIDER_COLOR, dividerColor);
        licensesDialogFragment.setArguments(args);
        return licensesDialogFragment;
    }

    private static int getColor(int dividerColorId, Context context) {
        return context.getResources().getColor(dividerColorId);
    }

    public void onCreate(Bundle savedInstanceState) {
        Notices notices;
        super.onCreate(savedInstanceState);
        Resources resources = getResources();
        if (savedInstanceState != null) {
            this.mTitleText = savedInstanceState.getString(STATE_TITLE_TEXT);
            this.mLicensesText = savedInstanceState.getString(STATE_LICENSES_TEXT);
            this.mCloseButtonText = savedInstanceState.getString(STATE_CLOSE_TEXT);
            if (savedInstanceState.containsKey(STATE_THEME_XML_ID)) {
                this.mThemeResourceId = savedInstanceState.getInt(STATE_THEME_XML_ID);
            }
            if (savedInstanceState.containsKey(STATE_DIVIDER_COLOR)) {
                this.mDividerColor = savedInstanceState.getInt(STATE_DIVIDER_COLOR);
                return;
            }
            return;
        }
        this.mTitleText = resources.getString(R.string.notices_title);
        this.mCloseButtonText = resources.getString(R.string.notices_close);
        try {
            Bundle arguments = getArguments();
            if (arguments != null) {
                if (arguments.containsKey(ARGUMENT_NOTICES_XML_ID)) {
                    notices = NoticesXmlParser.parse(resources.openRawResource(getNoticesXmlResourceId()));
                } else if (arguments.containsKey(ARGUMENT_NOTICES)) {
                    notices = (Notices) arguments.getParcelable(ARGUMENT_NOTICES);
                } else {
                    throw new IllegalStateException("Missing ARGUMENT_NOTICES_XML_ID / ARGUMENT_NOTICES");
                }
                if (arguments.getBoolean(ARGUMENT_INCLUDE_OWN_LICENSE, false)) {
                    notices.getNotices().add(LicensesDialog.LICENSES_DIALOG_NOTICE);
                }
                boolean showFullLicenseText = arguments.getBoolean(ARGUMENT_FULL_LICENSE_TEXT, false);
                if (arguments.containsKey(ARGUMENT_THEME_XML_ID)) {
                    if (Build.VERSION.SDK_INT >= 14) {
                        this.mThemeResourceId = arguments.getInt(ARGUMENT_THEME_XML_ID, R.style.Theme.DeviceDefault.Light.Dialog);
                    } else {
                        this.mThemeResourceId = arguments.getInt(ARGUMENT_THEME_XML_ID);
                    }
                }
                if (arguments.containsKey(ARGUMENT_DIVIDER_COLOR)) {
                    if (Build.VERSION.SDK_INT >= 14) {
                        this.mDividerColor = arguments.getInt(ARGUMENT_DIVIDER_COLOR, R.color.holo_blue_light);
                    } else {
                        this.mDividerColor = arguments.getInt(ARGUMENT_DIVIDER_COLOR);
                    }
                }
                this.mLicensesText = NoticesHtmlBuilder.create(getActivity()).setNotices(notices).setShowFullLicenseText(showFullLicenseText).build();
                return;
            }
            throw new IllegalStateException("Missing arguments");
        } catch (Exception e) {
            throw new IllegalStateException(e);
        }
    }

    public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putString(STATE_TITLE_TEXT, this.mTitleText);
        outState.putString(STATE_LICENSES_TEXT, this.mLicensesText);
        outState.putString(STATE_CLOSE_TEXT, this.mCloseButtonText);
        if (this.mThemeResourceId != 0) {
            outState.putInt(STATE_THEME_XML_ID, this.mThemeResourceId);
        }
        if (this.mDividerColor != 0) {
            outState.putInt(STATE_DIVIDER_COLOR, this.mDividerColor);
        }
    }

    public Dialog onCreateDialog(Bundle savedInstanceState) {
        return new LicensesDialog.Builder(getActivity()).setNotices(this.mLicensesText).setTitle(this.mTitleText).setCloseText(this.mCloseButtonText).setThemeResourceId(this.mThemeResourceId).setDividerColor(this.mDividerColor).build().create();
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

    private int getNoticesXmlResourceId() {
        int resourceId = R.raw.notices;
        Bundle arguments = getArguments();
        if (arguments != null && arguments.containsKey(ARGUMENT_NOTICES_XML_ID)) {
            resourceId = arguments.getInt(ARGUMENT_NOTICES_XML_ID);
            if (!"raw".equalsIgnoreCase(getResources().getResourceTypeName(resourceId))) {
                throw new IllegalStateException("not a raw resource");
            }
        }
        return resourceId;
    }
}
