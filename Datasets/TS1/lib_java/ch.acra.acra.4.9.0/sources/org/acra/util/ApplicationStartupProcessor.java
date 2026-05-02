package org.acra.util;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.support.annotation.NonNull;
import java.io.File;
import org.acra.ACRA;
import org.acra.ReportingInteractionMode;
import org.acra.config.ACRAConfiguration;
import org.acra.file.BulkReportDeleter;
import org.acra.file.CrashReportFileNameParser;
import org.acra.file.ReportLocator;
import org.acra.prefs.PrefUtils;
import org.acra.prefs.SharedPreferencesFactory;
import org.acra.sender.SenderServiceStarter;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/util/ApplicationStartupProcessor.class */
public final class ApplicationStartupProcessor {
    private final Context context;
    private final ACRAConfiguration config;

    public ApplicationStartupProcessor(@NonNull Context context, @NonNull ACRAConfiguration config) {
        this.context = context;
        this.config = config;
    }

    public void deleteUnsentReportsFromOldAppVersion() {
        SharedPreferences prefs = new SharedPreferencesFactory(this.context, this.config).create();
        long lastVersionNr = prefs.getInt(ACRA.PREF_LAST_VERSION_NR, 0);
        int appVersion = getAppVersion();
        if (appVersion > lastVersionNr) {
            BulkReportDeleter reportDeleter = new BulkReportDeleter(this.context);
            reportDeleter.deleteReports(true, 0);
            reportDeleter.deleteReports(false, 0);
            SharedPreferences.Editor prefsEditor = prefs.edit();
            prefsEditor.putInt(ACRA.PREF_LAST_VERSION_NR, appVersion);
            PrefUtils.save(prefsEditor);
        }
    }

    public void deleteAllUnapprovedReportsBarOne() {
        new BulkReportDeleter(this.context).deleteReports(false, 1);
    }

    public void sendApprovedReports() {
        ReportLocator reportLocator = new ReportLocator(this.context);
        File[] reportFiles = reportLocator.getApprovedReports();
        if (reportFiles.length == 0) {
            return;
        }
        if (this.config.mode() == ReportingInteractionMode.TOAST && hasNonSilentApprovedReports(reportFiles)) {
            ToastSender.sendToast(this.context, this.config.resToastText(), 1);
        }
        SenderServiceStarter starter = new SenderServiceStarter(this.context, this.config);
        starter.startService(false, false);
    }

    private int getAppVersion() {
        PackageManagerWrapper packageManagerWrapper = new PackageManagerWrapper(this.context);
        PackageInfo packageInfo = packageManagerWrapper.getPackageInfo();
        if (packageInfo == null) {
            return 0;
        }
        return packageInfo.versionCode;
    }

    private boolean hasNonSilentApprovedReports(File[] reportFiles) {
        CrashReportFileNameParser fileNameParser = new CrashReportFileNameParser();
        for (File file : reportFiles) {
            if (!fileNameParser.isSilent(file.getName())) {
                return true;
            }
        }
        return false;
    }
}
