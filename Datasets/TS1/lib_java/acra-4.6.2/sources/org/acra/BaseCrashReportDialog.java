package org.acra;

import android.app.Activity;
import android.os.Bundle;
import java.io.IOException;
import org.acra.collector.CrashReportData;
import org.acra.util.ToastSender;

/* loaded from: acra-4.6.2.jar:org/acra/BaseCrashReportDialog.class */
public abstract class BaseCrashReportDialog extends Activity {
    private String mReportFileName;

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ACRA.log.d(ACRA.LOG_TAG, "CrashReportDialog extras=" + getIntent().getExtras());
        boolean forceCancel = getIntent().getBooleanExtra("FORCE_CANCEL", false);
        if (forceCancel) {
            ACRA.log.d(ACRA.LOG_TAG, "Forced reports deletion.");
            cancelReports();
            finish();
        } else {
            this.mReportFileName = getIntent().getStringExtra(ACRAConstants.EXTRA_REPORT_FILE_NAME);
            ACRA.log.d(ACRA.LOG_TAG, "Opening CrashReportDialog for " + this.mReportFileName);
            if (this.mReportFileName == null) {
                finish();
            }
        }
    }

    protected void cancelReports() {
        ACRA.getErrorReporter().deletePendingNonApprovedReports(false);
    }

    protected void sendCrash(String comment, String userEmail) {
        CrashReportPersister persister = new CrashReportPersister(getApplicationContext());
        try {
            ACRA.log.d(ACRA.LOG_TAG, "Add user comment to " + this.mReportFileName);
            CrashReportData crashData = persister.load(this.mReportFileName);
            crashData.put((CrashReportData) ReportField.USER_COMMENT, (ReportField) (comment == null ? "" : comment));
            crashData.put((CrashReportData) ReportField.USER_EMAIL, (ReportField) (userEmail == null ? "" : userEmail));
            persister.store(crashData, this.mReportFileName);
        } catch (IOException e) {
            ACRA.log.w(ACRA.LOG_TAG, "User comment not added: ", e);
        }
        ACRA.log.v(ACRA.LOG_TAG, "About to start SenderWorker from CrashReportDialog");
        ACRA.getErrorReporter().startSendingReports(false, true);
        int toastId = ACRA.getConfig().resDialogOkToast();
        if (toastId != 0) {
            ToastSender.sendToast(getApplicationContext(), toastId, 1);
        }
    }
}
