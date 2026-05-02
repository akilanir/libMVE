package org.acra.sender;

import android.content.Context;
import android.support.annotation.NonNull;
import org.acra.collector.CrashReportData;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/sender/ReportSender.class */
public interface ReportSender {
    void send(@NonNull Context context, @NonNull CrashReportData crashReportData) throws ReportSenderException;
}
