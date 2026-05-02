package org.acra.sender;

import android.content.Context;
import android.support.annotation.NonNull;
import org.acra.ACRA;
import org.acra.collector.CrashReportData;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/sender/NullSender.class */
final class NullSender implements ReportSender {
    NullSender() {
    }

    @Override // org.acra.sender.ReportSender
    public void send(@NonNull Context context, @NonNull CrashReportData errorContent) throws ReportSenderException {
        ACRA.log.w(ACRA.LOG_TAG, context.getPackageName() + " reports will NOT be sent - no valid ReportSender is configured. Try setting 'formUri' or 'mailTo'");
    }
}
