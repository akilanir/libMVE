package org.acra.sender;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.support.annotation.NonNull;
import java.util.Set;
import org.acra.ACRAConstants;
import org.acra.ReportField;
import org.acra.collections.ImmutableSet;
import org.acra.collector.CrashReportData;
import org.acra.config.ACRAConfiguration;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/sender/EmailIntentSender.class */
public class EmailIntentSender implements ReportSender {
    private final ACRAConfiguration config;

    public EmailIntentSender(@NonNull ACRAConfiguration config) {
        this.config = config;
    }

    @Override // org.acra.sender.ReportSender
    public void send(@NonNull Context context, @NonNull CrashReportData errorContent) throws ReportSenderException {
        String subject = context.getPackageName() + " Crash Report";
        String body = buildBody(errorContent);
        Intent emailIntent = new Intent("android.intent.action.SENDTO");
        emailIntent.setData(Uri.fromParts("mailto", this.config.mailTo(), null));
        emailIntent.addFlags(268435456);
        emailIntent.putExtra("android.intent.extra.SUBJECT", subject);
        emailIntent.putExtra("android.intent.extra.TEXT", body);
        context.startActivity(emailIntent);
    }

    private String buildBody(@NonNull CrashReportData errorContent) {
        Set<ReportField> fields = this.config.getReportFields();
        if (fields.isEmpty()) {
            fields = new ImmutableSet<>(ACRAConstants.DEFAULT_MAIL_REPORT_FIELDS);
        }
        StringBuilder builder = new StringBuilder();
        for (ReportField field : fields) {
            builder.append(field.toString()).append('=');
            builder.append((String) errorContent.get(field));
            builder.append('\n');
        }
        return builder.toString();
    }
}
