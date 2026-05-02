package org.acra.sender;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import org.acra.ACRA;
import org.acra.ACRAConstants;
import org.acra.ReportField;
import org.acra.collector.CrashReportData;

/* loaded from: acra-4.6.2.jar:org/acra/sender/EmailIntentSender.class */
public class EmailIntentSender implements ReportSender {
    private final Context mContext;

    public EmailIntentSender(Context ctx) {
        this.mContext = ctx;
    }

    @Override // org.acra.sender.ReportSender
    public void send(Context context, CrashReportData errorContent) throws ReportSenderException {
        String subject = this.mContext.getPackageName() + " Crash Report";
        String body = buildBody(errorContent);
        Intent emailIntent = new Intent("android.intent.action.SENDTO");
        emailIntent.setData(Uri.fromParts("mailto", ACRA.getConfig().mailTo(), null));
        emailIntent.addFlags(268435456);
        emailIntent.putExtra("android.intent.extra.SUBJECT", subject);
        emailIntent.putExtra("android.intent.extra.TEXT", body);
        this.mContext.startActivity(emailIntent);
    }

    private String buildBody(CrashReportData errorContent) {
        ReportField[] fields = ACRA.getConfig().customReportContent();
        if (fields.length == 0) {
            fields = ACRAConstants.DEFAULT_MAIL_REPORT_FIELDS;
        }
        StringBuilder builder = new StringBuilder();
        ReportField[] arr$ = fields;
        for (ReportField field : arr$) {
            builder.append(field.toString()).append("=");
            builder.append((String) errorContent.get(field));
            builder.append('\n');
        }
        return builder.toString();
    }
}
