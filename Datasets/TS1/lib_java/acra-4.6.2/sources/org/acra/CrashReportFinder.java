package org.acra;

import android.content.Context;
import java.io.File;
import java.io.FilenameFilter;

/* loaded from: acra-4.6.2.jar:org/acra/CrashReportFinder.class */
final class CrashReportFinder {
    private final Context context;

    public CrashReportFinder(Context context) {
        this.context = context;
    }

    public String[] getCrashReportFiles() {
        if (this.context == null) {
            ACRA.log.e(ACRA.LOG_TAG, "Trying to get ACRA reports but ACRA is not initialized.");
            return new String[0];
        }
        File dir = this.context.getFilesDir();
        if (dir == null) {
            ACRA.log.w(ACRA.LOG_TAG, "Application files directory does not exist! The application may not be installed correctly. Please try reinstalling.");
            return new String[0];
        }
        ACRA.log.d(ACRA.LOG_TAG, "Looking for error files in " + dir.getAbsolutePath());
        FilenameFilter filter = new FilenameFilter() { // from class: org.acra.CrashReportFinder.1
            @Override // java.io.FilenameFilter
            public boolean accept(File dir2, String name) {
                return name.endsWith(ACRAConstants.REPORTFILE_EXTENSION);
            }
        };
        String[] result = dir.list(filter);
        return result == null ? new String[0] : result;
    }
}
