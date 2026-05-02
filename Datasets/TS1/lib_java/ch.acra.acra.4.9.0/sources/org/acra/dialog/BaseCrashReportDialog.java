package org.acra.dialog;

import android.app.Activity;
import android.os.Bundle;
import android.support.annotation.Nullable;
import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import org.acra.ACRA;
import org.acra.ACRAConstants;
import org.acra.ReportField;
import org.acra.collector.CrashReportData;
import org.acra.config.ACRAConfiguration;
import org.acra.file.BulkReportDeleter;
import org.acra.file.CrashReportPersister;
import org.acra.sender.SenderServiceStarter;
import org.acra.util.ToastSender;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/dialog/BaseCrashReportDialog.class */
public abstract class BaseCrashReportDialog extends Activity {
    private File reportFile;
    private ACRAConfiguration config;
    private Throwable exception;

    @Override // android.app.Activity
    protected final void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (ACRA.DEV_LOGGING) {
            ACRA.log.d(ACRA.LOG_TAG, "CrashReportDialog extras=" + getIntent().getExtras());
        }
        Serializable sConfig = getIntent().getSerializableExtra(ACRAConstants.EXTRA_REPORT_CONFIG);
        Serializable sReportFile = getIntent().getSerializableExtra(ACRAConstants.EXTRA_REPORT_FILE);
        Serializable sException = getIntent().getSerializableExtra(ACRAConstants.EXTRA_REPORT_EXCEPTION);
        boolean forceCancel = getIntent().getBooleanExtra(ACRAConstants.EXTRA_FORCE_CANCEL, false);
        if (forceCancel) {
            if (ACRA.DEV_LOGGING) {
                ACRA.log.d(ACRA.LOG_TAG, "Forced reports deletion.");
            }
            cancelReports();
            finish();
            return;
        }
        if ((sConfig instanceof ACRAConfiguration) && (sReportFile instanceof File) && ((sException instanceof Throwable) || sException == null)) {
            this.config = (ACRAConfiguration) sConfig;
            this.reportFile = (File) sReportFile;
            this.exception = (Throwable) sException;
            init(savedInstanceState);
            return;
        }
        ACRA.log.w(ACRA.LOG_TAG, "Illegal or incomplete call of BaseCrashReportDialog.");
        finish();
    }

    protected void init(@Nullable Bundle savedInstanceState) {
    }

    protected final void cancelReports() {
        new BulkReportDeleter(getApplicationContext()).deleteReports(false, 0);
    }

    protected final void sendCrash(@Nullable String comment, @Nullable String userEmail) {
        CrashReportPersister persister = new CrashReportPersister();
        try {
            if (ACRA.DEV_LOGGING) {
                ACRA.log.d(ACRA.LOG_TAG, "Add user comment to " + this.reportFile);
            }
            CrashReportData crashData = persister.load(this.reportFile);
            crashData.put((CrashReportData) ReportField.USER_COMMENT, (ReportField) (comment == null ? "" : comment));
            crashData.put((CrashReportData) ReportField.USER_EMAIL, (ReportField) (userEmail == null ? "" : userEmail));
            persister.store(crashData, this.reportFile);
        } catch (IOException e) {
            ACRA.log.w(ACRA.LOG_TAG, "User comment not added: ", e);
        }
        SenderServiceStarter starter = new SenderServiceStarter(getApplicationContext(), this.config);
        starter.startService(false, true);
        int toastId = this.config.resDialogOkToast();
        if (toastId != 0) {
            ToastSender.sendToast(getApplicationContext(), toastId, 1);
        }
    }

    protected final ACRAConfiguration getConfig() {
        return this.config;
    }

    protected final Throwable getException() {
        return this.exception;
    }
}
