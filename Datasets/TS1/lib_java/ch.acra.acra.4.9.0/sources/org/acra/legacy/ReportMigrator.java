package org.acra.legacy;

import android.content.Context;
import android.support.annotation.NonNull;
import java.io.File;
import java.io.FilenameFilter;
import org.acra.ACRA;
import org.acra.ACRAConstants;
import org.acra.file.CrashReportFileNameParser;
import org.acra.file.ReportLocator;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/legacy/ReportMigrator.class */
public final class ReportMigrator {
    private final Context context;
    private final CrashReportFileNameParser fileNameParser = new CrashReportFileNameParser();

    @NonNull
    private final ReportLocator reportLocator;

    public ReportMigrator(@NonNull Context context) {
        this.context = context;
        this.reportLocator = new ReportLocator(context);
    }

    public void migrate() {
        ACRA.log.i(ACRA.LOG_TAG, "Migrating unsent ACRA reports to new file locations");
        File[] reportFiles = getCrashReportFiles();
        for (File file : reportFiles) {
            String fileName = file.getName();
            if (this.fileNameParser.isApproved(fileName)) {
                if (file.renameTo(new File(this.reportLocator.getApprovedFolder(), fileName)) && ACRA.DEV_LOGGING) {
                    ACRA.log.d(ACRA.LOG_TAG, "Cold not migrate unsent ACRA crash report : " + fileName);
                }
            } else if (file.renameTo(new File(this.reportLocator.getUnapprovedFolder(), fileName)) && ACRA.DEV_LOGGING) {
                ACRA.log.d(ACRA.LOG_TAG, "Cold not migrate unsent ACRA crash report : " + fileName);
            }
        }
        ACRA.log.i(ACRA.LOG_TAG, "Migrated " + reportFiles.length + " unsent reports");
    }

    @NonNull
    private File[] getCrashReportFiles() {
        File dir = this.context.getFilesDir();
        if (dir == null) {
            ACRA.log.w(ACRA.LOG_TAG, "Application files directory does not exist! The application may not be installed correctly. Please try reinstalling.");
            return new File[0];
        }
        if (ACRA.DEV_LOGGING) {
            ACRA.log.d(ACRA.LOG_TAG, "Looking for error files in " + dir.getAbsolutePath());
        }
        FilenameFilter filter = new FilenameFilter() { // from class: org.acra.legacy.ReportMigrator.1
            @Override // java.io.FilenameFilter
            public boolean accept(File dir2, @NonNull String name) {
                return name.endsWith(ACRAConstants.REPORTFILE_EXTENSION);
            }
        };
        File[] result = dir.listFiles(filter);
        return result == null ? new File[0] : result;
    }
}
