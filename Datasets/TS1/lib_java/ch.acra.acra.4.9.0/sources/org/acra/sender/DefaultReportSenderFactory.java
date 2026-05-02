package org.acra.sender;

import android.content.Context;
import android.support.annotation.NonNull;
import org.acra.ACRA;
import org.acra.config.ACRAConfiguration;
import org.acra.util.PackageManagerWrapper;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/sender/DefaultReportSenderFactory.class */
public final class DefaultReportSenderFactory implements ReportSenderFactory {
    @Override // org.acra.sender.ReportSenderFactory
    @NonNull
    public ReportSender create(@NonNull Context context, @NonNull ACRAConfiguration config) {
        PackageManagerWrapper pm = new PackageManagerWrapper(context);
        if (!"".equals(config.mailTo())) {
            ACRA.log.w(ACRA.LOG_TAG, context.getPackageName() + " reports will be sent by email (if accepted by user).");
            return new EmailIntentSenderFactory().create(context, config);
        }
        if (!pm.hasPermission("android.permission.INTERNET")) {
            ACRA.log.e(ACRA.LOG_TAG, context.getPackageName() + " should be granted permission android.permission.INTERNET if you want your crash reports to be sent. If you don't want to add this permission to your application you can also enable sending reports by email. If this is your will then provide your email address in @AcraConfig(mailTo=\"your.account@domain.com\"");
            return new NullSender();
        }
        if (config.formUri() != null && !"".equals(config.formUri())) {
            if (ACRA.DEV_LOGGING) {
                ACRA.log.d(ACRA.LOG_TAG, context.getPackageName() + " reports will be sent by Http.");
            }
            return new HttpSenderFactory().create(context, config);
        }
        return new NullSender();
    }
}
