package org.acra.sender;

import android.content.Context;
import org.acra.collector.CrashReportData;

/* loaded from: acra-4.6.2.jar:org/acra/sender/ReportSender.class */
public interface ReportSender {
    void send(Context context, CrashReportData crashReportData) throws ReportSenderException;
}
