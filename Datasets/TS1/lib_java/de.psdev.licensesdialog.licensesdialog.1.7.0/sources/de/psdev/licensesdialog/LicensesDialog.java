package de.psdev.licensesdialog;

import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.res.Resources;
import android.view.ContextThemeWrapper;
import android.view.View;
import android.webkit.WebView;
import de.psdev.licensesdialog.licenses.ApacheSoftwareLicense20;
import de.psdev.licensesdialog.model.Notice;
import de.psdev.licensesdialog.model.Notices;
import java.util.List;
import javax.annotation.Nullable;

/* loaded from: de.psdev.licensesdialog.licensesdialog.1.7.0.jar:de/psdev/licensesdialog/LicensesDialog.class */
public class LicensesDialog {
    public static final Notice LICENSES_DIALOG_NOTICE = new Notice("LicensesDialog", "http://psdev.de/LicensesDialog", "Copyright 2013 Philip Schiffer", new ApacheSoftwareLicense20());
    private final Context mContext;
    private final String mTitleText;
    private final String mLicensesText;
    private final String mCloseText;
    private final int mThemeResourceId;
    private final int mDividerColor;
    private DialogInterface.OnDismissListener mOnDismissListener;

    private LicensesDialog(Context context, String licensesText, String titleText, String closeText, int themeResourceId, int dividerColor) {
        this.mContext = context;
        this.mTitleText = titleText;
        this.mLicensesText = licensesText;
        this.mCloseText = closeText;
        this.mThemeResourceId = themeResourceId;
        this.mDividerColor = dividerColor;
    }

    public LicensesDialog setOnDismissListener(DialogInterface.OnDismissListener onDismissListener) {
        this.mOnDismissListener = onDismissListener;
        return this;
    }

    public Dialog create() {
        AlertDialog.Builder builder;
        WebView webView = new WebView(this.mContext);
        webView.loadDataWithBaseURL(null, this.mLicensesText, "text/html", "utf-8", null);
        if (this.mThemeResourceId != 0) {
            builder = new AlertDialog.Builder(new ContextThemeWrapper(this.mContext, this.mThemeResourceId));
        } else {
            builder = new AlertDialog.Builder(this.mContext);
        }
        builder.setTitle(this.mTitleText).setView(webView).setPositiveButton(this.mCloseText, new DialogInterface.OnClickListener() { // from class: de.psdev.licensesdialog.LicensesDialog.1
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface dialogInterface, int i) {
                dialogInterface.dismiss();
            }
        });
        final AlertDialog dialog = builder.create();
        dialog.setOnDismissListener(new DialogInterface.OnDismissListener() { // from class: de.psdev.licensesdialog.LicensesDialog.2
            @Override // android.content.DialogInterface.OnDismissListener
            public void onDismiss(DialogInterface dialog2) {
                if (LicensesDialog.this.mOnDismissListener != null) {
                    LicensesDialog.this.mOnDismissListener.onDismiss(dialog2);
                }
            }
        });
        dialog.setOnShowListener(new DialogInterface.OnShowListener() { // from class: de.psdev.licensesdialog.LicensesDialog.3
            @Override // android.content.DialogInterface.OnShowListener
            public void onShow(DialogInterface dialogInterface) {
                if (LicensesDialog.this.mDividerColor != 0) {
                    int titleDividerId = LicensesDialog.this.mContext.getResources().getIdentifier("titleDivider", "id", "android");
                    View titleDivider = dialog.findViewById(titleDividerId);
                    if (titleDivider != null) {
                        titleDivider.setBackgroundColor(LicensesDialog.this.mDividerColor);
                    }
                }
            }
        });
        return dialog;
    }

    public Dialog show() {
        Dialog dialog = create();
        dialog.show();
        return dialog;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Notices getNotices(Context context, int rawNoticesResourceId) {
        try {
            Resources resources = context.getResources();
            if ("raw".equals(resources.getResourceTypeName(rawNoticesResourceId))) {
                Notices notices = NoticesXmlParser.parse(resources.openRawResource(rawNoticesResourceId));
                return notices;
            }
            throw new IllegalStateException("not a raw resource");
        } catch (Exception e) {
            throw new IllegalStateException(e);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static String getLicensesText(Context context, Notices notices, boolean showFullLicenseText, boolean includeOwnLicense, String style) {
        if (includeOwnLicense) {
            try {
                List<Notice> noticeList = notices.getNotices();
                noticeList.add(LICENSES_DIALOG_NOTICE);
            } catch (Exception e) {
                throw new IllegalStateException(e);
            }
        }
        return NoticesHtmlBuilder.create(context).setShowFullLicenseText(showFullLicenseText).setNotices(notices).setStyle(style).build();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Notices getSingleNoticeNotices(Notice notice) {
        Notices notices = new Notices();
        notices.addNotice(notice);
        return notices;
    }

    /* loaded from: de.psdev.licensesdialog.licensesdialog.1.7.0.jar:de/psdev/licensesdialog/LicensesDialog$Builder.class */
    public static final class Builder {
        private final Context mContext;
        private String mTitleText;
        private String mCloseText;

        @Nullable
        private Integer mRawNoticesId;

        @Nullable
        private Notices mNotices;

        @Nullable
        private String mNoticesText;
        private String mNoticesStyle;
        private boolean mShowFullLicenseText = false;
        private boolean mIncludeOwnLicense = false;
        private int mThemeResourceId = 0;
        private int mDividerColor = 0;

        public Builder(Context context) {
            this.mContext = context;
            this.mTitleText = context.getString(R.string.notices_title);
            this.mCloseText = context.getString(R.string.notices_close);
            this.mNoticesStyle = context.getString(R.string.notices_default_style);
        }

        public Builder setTitle(int titleId) {
            this.mTitleText = this.mContext.getString(titleId);
            return this;
        }

        public Builder setTitle(String title) {
            this.mTitleText = title;
            return this;
        }

        public Builder setCloseText(int closeId) {
            this.mCloseText = this.mContext.getString(closeId);
            return this;
        }

        public Builder setCloseText(String closeText) {
            this.mCloseText = closeText;
            return this;
        }

        public Builder setNotices(int rawNoticesId) {
            this.mRawNoticesId = Integer.valueOf(rawNoticesId);
            this.mNotices = null;
            return this;
        }

        public Builder setNotices(Notices notices) {
            this.mNotices = notices;
            this.mRawNoticesId = null;
            return this;
        }

        public Builder setNotices(Notice notice) {
            return setNotices(LicensesDialog.getSingleNoticeNotices(notice));
        }

        Builder setNotices(String notices) {
            this.mNotices = null;
            this.mRawNoticesId = null;
            this.mNoticesText = notices;
            return this;
        }

        public Builder setNoticesCssStyle(int cssStyleTextId) {
            this.mNoticesStyle = this.mContext.getString(cssStyleTextId);
            return this;
        }

        public Builder setNoticesCssStyle(String cssStyleText) {
            this.mNoticesStyle = cssStyleText;
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

        public Builder setThemeResourceId(int themeResourceId) {
            this.mThemeResourceId = themeResourceId;
            return this;
        }

        public Builder setDividerColor(int dividerColor) {
            this.mDividerColor = dividerColor;
            return this;
        }

        public Builder setDividerColorId(int dividerColorId) {
            this.mDividerColor = this.mContext.getResources().getColor(dividerColorId);
            return this;
        }

        public LicensesDialog build() {
            String licensesText;
            if (this.mNotices != null) {
                licensesText = LicensesDialog.getLicensesText(this.mContext, this.mNotices, this.mShowFullLicenseText, this.mIncludeOwnLicense, this.mNoticesStyle);
            } else if (this.mRawNoticesId != null) {
                licensesText = LicensesDialog.getLicensesText(this.mContext, LicensesDialog.getNotices(this.mContext, this.mRawNoticesId.intValue()), this.mShowFullLicenseText, this.mIncludeOwnLicense, this.mNoticesStyle);
            } else if (this.mNoticesText != null) {
                licensesText = this.mNoticesText;
            } else {
                throw new IllegalStateException("Notices have to be provided, see setNotices");
            }
            return new LicensesDialog(this.mContext, licensesText, this.mTitleText, this.mCloseText, this.mThemeResourceId, this.mDividerColor);
        }
    }
}
