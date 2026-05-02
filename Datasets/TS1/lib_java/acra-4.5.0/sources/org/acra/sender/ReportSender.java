package org.acra.sender;

import org.acra.collector.CrashReportData;

/* loaded from: acra-4.5.0.jar:org/acra/sender/ReportSender.class */
public interface ReportSender {
    void send(CrashReportData crashReportData) throws ReportSenderException;
}
