package org.acra.sender;

import android.app.IntentService;
import android.content.Intent;
import android.support.annotation.NonNull;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import org.acra.ACRA;
import org.acra.config.ACRAConfiguration;
import org.acra.file.CrashReportFileNameParser;
import org.acra.file.ReportLocator;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/sender/SenderService.class */
public class SenderService extends IntentService {
    public static final String EXTRA_ONLY_SEND_SILENT_REPORTS = "onlySendSilentReports";
    public static final String EXTRA_APPROVE_REPORTS_FIRST = "approveReportsFirst";
    public static final String EXTRA_REPORT_SENDER_FACTORIES = "reportSenderFactories";
    public static final String EXTRA_ACRA_CONFIG = "acraConfig";
    private final ReportLocator locator;

    public SenderService() {
        super("ACRA SenderService");
        this.locator = new ReportLocator(this);
    }

    @Override // android.app.IntentService
    protected void onHandleIntent(@NonNull Intent intent) {
        boolean onlySendSilentReports = intent.getBooleanExtra(EXTRA_ONLY_SEND_SILENT_REPORTS, false);
        boolean approveReportsFirst = intent.getBooleanExtra(EXTRA_APPROVE_REPORTS_FIRST, false);
        List<Class<? extends ReportSenderFactory>> senderFactoryClasses = (List) intent.getSerializableExtra(EXTRA_REPORT_SENDER_FACTORIES);
        ACRAConfiguration config = (ACRAConfiguration) intent.getSerializableExtra(EXTRA_ACRA_CONFIG);
        if (ACRA.DEV_LOGGING) {
            ACRA.log.d(ACRA.LOG_TAG, "About to start sending reports from SenderService");
        }
        try {
            List<ReportSender> senderInstances = getSenderInstances(config, senderFactoryClasses);
            if (approveReportsFirst) {
                markReportsAsApproved();
            }
            File[] reports = this.locator.getApprovedReports();
            ReportDistributor reportDistributor = new ReportDistributor(this, config, senderInstances);
            int reportsSentCount = 0;
            CrashReportFileNameParser fileNameParser = new CrashReportFileNameParser();
            for (File report : reports) {
                if (!onlySendSilentReports || fileNameParser.isSilent(report.getName())) {
                    if (reportsSentCount >= 5) {
                        break;
                    }
                    reportDistributor.distribute(report);
                    reportsSentCount++;
                }
            }
        } catch (Exception e) {
            ACRA.log.e(ACRA.LOG_TAG, "", e);
        }
        if (ACRA.DEV_LOGGING) {
            ACRA.log.d(ACRA.LOG_TAG, "Finished sending reports from SenderService");
        }
    }

    @NonNull
    private List<ReportSender> getSenderInstances(@NonNull ACRAConfiguration config, @NonNull List<Class<? extends ReportSenderFactory>> factoryClasses) {
        List<ReportSender> reportSenders = new ArrayList<>();
        for (Class<? extends ReportSenderFactory> factoryClass : factoryClasses) {
            try {
                ReportSenderFactory factory = factoryClass.newInstance();
                ReportSender sender = factory.create(getApplication(), config);
                reportSenders.add(sender);
            } catch (IllegalAccessException e) {
                ACRA.log.w(ACRA.LOG_TAG, "Could not construct ReportSender from " + factoryClass, e);
            } catch (InstantiationException e2) {
                ACRA.log.w(ACRA.LOG_TAG, "Could not construct ReportSender from " + factoryClass, e2);
            }
        }
        return reportSenders;
    }

    private void markReportsAsApproved() {
        if (ACRA.DEV_LOGGING) {
            ACRA.log.d(ACRA.LOG_TAG, "Mark all pending reports as approved.");
        }
        for (File report : this.locator.getUnapprovedReports()) {
            File approvedReport = new File(this.locator.getApprovedFolder(), report.getName());
            if (!report.renameTo(approvedReport)) {
                ACRA.log.w(ACRA.LOG_TAG, "Could not rename approved report from " + report + " to " + approvedReport);
            }
        }
    }
}
