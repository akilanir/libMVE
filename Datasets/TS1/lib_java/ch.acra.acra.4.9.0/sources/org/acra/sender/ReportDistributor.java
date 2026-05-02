package org.acra.sender;

import android.content.Context;
import android.content.pm.PackageManager;
import android.support.annotation.NonNull;
import java.io.File;
import java.io.IOException;
import java.util.List;
import org.acra.ACRA;
import org.acra.collector.CrashReportData;
import org.acra.config.ACRAConfiguration;
import org.acra.file.CrashReportPersister;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/sender/ReportDistributor.class */
final class ReportDistributor {
    private final Context context;
    private final ACRAConfiguration config;
    private final List<ReportSender> reportSenders;

    ReportDistributor(@NonNull Context context, @NonNull ACRAConfiguration config, @NonNull List<ReportSender> reportSenders) {
        this.context = context;
        this.config = config;
        this.reportSenders = reportSenders;
    }

    public void distribute(@NonNull File reportFile) {
        ACRA.log.i(ACRA.LOG_TAG, "Sending report " + reportFile);
        try {
            CrashReportPersister persister = new CrashReportPersister();
            CrashReportData previousCrashReport = persister.load(reportFile);
            sendCrashReport(previousCrashReport);
            deleteFile(reportFile);
        } catch (IOException e) {
            ACRA.log.e(ACRA.LOG_TAG, "Failed to load crash report for " + reportFile, e);
            deleteFile(reportFile);
        } catch (RuntimeException e2) {
            ACRA.log.e(ACRA.LOG_TAG, "Failed to send crash reports for " + reportFile, e2);
            deleteFile(reportFile);
        } catch (ReportSenderException e3) {
            ACRA.log.e(ACRA.LOG_TAG, "Failed to send crash report for " + reportFile, e3);
        }
    }

    private void sendCrashReport(@NonNull CrashReportData errorContent) throws ReportSenderException {
        if (!isDebuggable() || this.config.sendReportsInDevMode()) {
            boolean sentAtLeastOnce = false;
            ReportSenderException sendFailure = null;
            String failedSender = null;
            for (ReportSender sender : this.reportSenders) {
                try {
                    if (ACRA.DEV_LOGGING) {
                        ACRA.log.d(ACRA.LOG_TAG, "Sending report using " + sender.getClass().getName());
                    }
                    sender.send(this.context, errorContent);
                    if (ACRA.DEV_LOGGING) {
                        ACRA.log.d(ACRA.LOG_TAG, "Sent report using " + sender.getClass().getName());
                    }
                    sentAtLeastOnce = true;
                } catch (ReportSenderException e) {
                    sendFailure = e;
                    failedSender = sender.getClass().getName();
                }
            }
            if (sendFailure != null) {
                if (!sentAtLeastOnce) {
                    throw sendFailure;
                }
                ACRA.log.w(ACRA.LOG_TAG, "ReportSender of class " + failedSender + " failed but other senders completed their task. ACRA will not send this report again.");
            }
        }
    }

    private void deleteFile(@NonNull File file) {
        boolean deleted = file.delete();
        if (!deleted) {
            ACRA.log.w(ACRA.LOG_TAG, "Could not delete error report : " + file);
        }
    }

    private boolean isDebuggable() {
        PackageManager pm = this.context.getPackageManager();
        try {
            return (pm.getApplicationInfo(this.context.getPackageName(), 0).flags & 2) > 0;
        } catch (PackageManager.NameNotFoundException e) {
            return false;
        }
    }
}
