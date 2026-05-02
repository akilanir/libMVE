package org.acra;

import android.os.Bundle;

/* loaded from: ch.acra.acra.4.9.0.jar:org/acra/CrashReportDialog.class */
public final class CrashReportDialog extends org.acra.dialog.CrashReportDialog {
    @Override // org.acra.dialog.CrashReportDialog
    protected void buildAndShowDialog(Bundle savedInstanceState) {
        ACRA.log.w(ACRA.LOG_TAG, "org.acra.CrashReportDialog has been deprecated. Please use org.acra.dialog.CrashReportDialog instead");
        super.buildAndShowDialog(savedInstanceState);
    }
}
