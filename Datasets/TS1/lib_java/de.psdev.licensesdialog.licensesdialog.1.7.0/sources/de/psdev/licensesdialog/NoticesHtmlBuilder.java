package de.psdev.licensesdialog;

import android.content.Context;
import de.psdev.licensesdialog.licenses.License;
import de.psdev.licensesdialog.model.Notice;
import de.psdev.licensesdialog.model.Notices;
import java.util.HashMap;
import java.util.Map;

/* loaded from: de.psdev.licensesdialog.licensesdialog.1.7.0.jar:de/psdev/licensesdialog/NoticesHtmlBuilder.class */
public final class NoticesHtmlBuilder {
    private final Context mContext;
    private Notices mNotices;
    private Notice mNotice;
    private String mStyle;
    private final Map<License, String> mLicenseTextCache = new HashMap();
    private boolean mShowFullLicenseText = false;

    public static NoticesHtmlBuilder create(Context context) {
        return new NoticesHtmlBuilder(context);
    }

    private NoticesHtmlBuilder(Context context) {
        this.mContext = context;
        this.mStyle = context.getResources().getString(R.string.notices_default_style);
    }

    public NoticesHtmlBuilder setNotices(Notices notices) {
        this.mNotices = notices;
        this.mNotice = null;
        return this;
    }

    public NoticesHtmlBuilder setNotice(Notice notice) {
        this.mNotice = notice;
        this.mNotices = null;
        return this;
    }

    public NoticesHtmlBuilder setStyle(String style) {
        this.mStyle = style;
        return this;
    }

    public NoticesHtmlBuilder setShowFullLicenseText(boolean showFullLicenseText) {
        this.mShowFullLicenseText = showFullLicenseText;
        return this;
    }

    public String build() {
        StringBuilder noticesHtmlBuilder = new StringBuilder(500);
        appendNoticesContainerStart(noticesHtmlBuilder);
        if (this.mNotice != null) {
            appendNoticeBlock(noticesHtmlBuilder, this.mNotice);
        } else if (this.mNotices != null) {
            for (Notice notice : this.mNotices.getNotices()) {
                appendNoticeBlock(noticesHtmlBuilder, notice);
            }
        } else {
            throw new IllegalStateException("no notice(s) set");
        }
        appendNoticesContainerEnd(noticesHtmlBuilder);
        return noticesHtmlBuilder.toString();
    }

    private void appendNoticesContainerStart(StringBuilder noticesHtmlBuilder) {
        noticesHtmlBuilder.append("<!DOCTYPE html><html><head>").append("<style type=\"text/css\">").append(this.mStyle).append("</style>").append("</head><body>");
    }

    private void appendNoticeBlock(StringBuilder noticesHtmlBuilder, Notice notice) {
        noticesHtmlBuilder.append("<ul><li>").append(notice.getName());
        String currentNoticeUrl = notice.getUrl();
        if (currentNoticeUrl != null && currentNoticeUrl.length() > 0) {
            noticesHtmlBuilder.append(" (<a href=\"").append(currentNoticeUrl).append("\">").append(currentNoticeUrl).append("</a>)");
        }
        noticesHtmlBuilder.append("</li></ul>");
        noticesHtmlBuilder.append("<pre>");
        String copyright = notice.getCopyright();
        if (copyright != null) {
            noticesHtmlBuilder.append(copyright).append("<br/><br/>");
        }
        noticesHtmlBuilder.append(getLicenseText(notice.getLicense())).append("</pre>");
    }

    private void appendNoticesContainerEnd(StringBuilder noticesHtmlBuilder) {
        noticesHtmlBuilder.append("</body></html>");
    }

    private String getLicenseText(License license) {
        if (license != null) {
            if (!this.mLicenseTextCache.containsKey(license)) {
                this.mLicenseTextCache.put(license, this.mShowFullLicenseText ? license.getFullText(this.mContext) : license.getSummaryText(this.mContext));
            }
            return this.mLicenseTextCache.get(license);
        }
        return "";
    }
}
