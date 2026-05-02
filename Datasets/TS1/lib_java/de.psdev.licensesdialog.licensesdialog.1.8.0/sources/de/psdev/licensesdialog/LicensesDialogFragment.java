package de.psdev.licensesdialog;

import android.R;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.res.Resources;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.ColorInt;
import android.support.annotation.ColorRes;
import android.support.annotation.NonNull;
import android.support.annotation.RawRes;
import android.support.annotation.StyleRes;
import android.support.v4.app.DialogFragment;
import de.psdev.licensesdialog.LicensesDialog;
import de.psdev.licensesdialog.model.Notice;
import de.psdev.licensesdialog.model.Notices;

/* loaded from: de.psdev.licensesdialog.licensesdialog.1.8.0.jar:de/psdev/licensesdialog/LicensesDialogFragment.class */
public class LicensesDialogFragment extends DialogFragment {
    private static final String ARGUMENT_NOTICES = "ARGUMENT_NOTICES";
    private static final String ARGUMENT_NOTICES_XML_ID = "ARGUMENT_NOTICES_XML_ID";
    private static final String ARGUMENT_INCLUDE_OWN_LICENSE = "ARGUMENT_INCLUDE_OWN_LICENSE";
    private static final String ARGUMENT_FULL_LICENSE_TEXT = "ARGUMENT_FULL_LICENSE_TEXT";
    private static final String ARGUMENT_THEME_XML_ID = "ARGUMENT_THEME_XML_ID";
    private static final String ARGUMENT_DIVIDER_COLOR = "ARGUMENT_DIVIDER_COLOR";
    private static final String ARGUMENT_USE_APPCOMPAT = "ARGUMENT_USE_APPCOMPAT";
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

    /* JADX INFO: Access modifiers changed from: private */
    public static LicensesDialogFragment newInstance(Notices notices, boolean showFullLicenseText, boolean includeOwnLicense, int themeResourceId, int dividerColor, boolean useAppCompat) {
        LicensesDialogFragment licensesDialogFragment = new LicensesDialogFragment();
        Bundle args = new Bundle();
        args.putParcelable(ARGUMENT_NOTICES, notices);
        args.putBoolean(ARGUMENT_FULL_LICENSE_TEXT, showFullLicenseText);
        args.putBoolean(ARGUMENT_INCLUDE_OWN_LICENSE, includeOwnLicense);
        args.putInt(ARGUMENT_THEME_XML_ID, themeResourceId);
        args.putInt(ARGUMENT_DIVIDER_COLOR, dividerColor);
        args.putBoolean(ARGUMENT_USE_APPCOMPAT, useAppCompat);
        licensesDialogFragment.setArguments(args);
        return licensesDialogFragment;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static LicensesDialogFragment newInstance(int rawNoticesResourceId, boolean showFullLicenseText, boolean includeOwnLicense, int themeResourceId, int dividerColor, boolean useAppCompat) {
        LicensesDialogFragment licensesDialogFragment = new LicensesDialogFragment();
        Bundle args = new Bundle();
        args.putInt(ARGUMENT_NOTICES_XML_ID, rawNoticesResourceId);
        args.putBoolean(ARGUMENT_FULL_LICENSE_TEXT, showFullLicenseText);
        args.putBoolean(ARGUMENT_INCLUDE_OWN_LICENSE, includeOwnLicense);
        args.putInt(ARGUMENT_THEME_XML_ID, themeResourceId);
        args.putInt(ARGUMENT_DIVIDER_COLOR, dividerColor);
        args.putBoolean(ARGUMENT_USE_APPCOMPAT, useAppCompat);
        licensesDialogFragment.setArguments(args);
        return licensesDialogFragment;
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
        LicensesDialog.Builder builder = new LicensesDialog.Builder(getActivity()).setNotices(this.mLicensesText).setTitle(this.mTitleText).setCloseText(this.mCloseButtonText).setThemeResourceId(this.mThemeResourceId).setDividerColor(this.mDividerColor);
        LicensesDialog licensesDialog = builder.build();
        if (getArguments().getBoolean(ARGUMENT_USE_APPCOMPAT, false)) {
            return licensesDialog.createAppCompat();
        }
        return licensesDialog.create();
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

    /* loaded from: de.psdev.licensesdialog.licensesdialog.1.8.0.jar:de/psdev/licensesdialog/LicensesDialogFragment$Builder.class */
    public static class Builder {
        private final Context mContext;
        private Notices mNotices;
        private Integer mRawNoticesResourceId;
        private boolean mShowFullLicenseText = false;
        private boolean mIncludeOwnLicense = true;
        private int mThemeResourceId = 0;
        private int mDividerColor = 0;
        private boolean mUseAppCompat = false;

        public Builder(@NonNull Context context) {
            this.mContext = context;
        }

        public Builder setNotice(Notice notice) {
            this.mNotices = new Notices();
            this.mNotices.addNotice(notice);
            return this;
        }

        public Builder setNotices(Notices notices) {
            this.mNotices = notices;
            return this;
        }

        public Builder setNotices(@RawRes int rawNoticesResourceId) throws Exception {
            this.mRawNoticesResourceId = Integer.valueOf(rawNoticesResourceId);
            return this;
        }

        public Builder setShowFullLicenseText(boolean showFullLicenseText) {
            this.mShowFullLicenseText = showFullLicenseText;
            return this;
        }

        public Builder setIncludeOwnLicense(boolean includeOwnLicense) {
            this.mIncludeOwnLicense = includeOwnLicense;
            return this;
        }

        public Builder setThemeResourceId(@StyleRes int themeResourceId) {
            this.mThemeResourceId = themeResourceId;
            return this;
        }

        public Builder setDividerColorRes(@ColorRes int dividerColor) {
            this.mDividerColor = this.mContext.getResources().getColor(dividerColor);
            return this;
        }

        public Builder setDividerColor(@ColorInt int dividerColor) {
            this.mDividerColor = dividerColor;
            return this;
        }

        public Builder setUseAppCompat(boolean useAppCompat) {
            this.mUseAppCompat = useAppCompat;
            return this;
        }

        public LicensesDialogFragment build() {
            if (this.mNotices != null) {
                return LicensesDialogFragment.newInstance(this.mNotices, this.mShowFullLicenseText, this.mIncludeOwnLicense, this.mThemeResourceId, this.mDividerColor, this.mUseAppCompat);
            }
            if (this.mRawNoticesResourceId != null) {
                return LicensesDialogFragment.newInstance(this.mRawNoticesResourceId.intValue(), this.mShowFullLicenseText, this.mIncludeOwnLicense, this.mThemeResourceId, this.mDividerColor, this.mUseAppCompat);
            }
            throw new IllegalStateException("Required parameter not set. You need to call setNotices.");
        }
    }
}
