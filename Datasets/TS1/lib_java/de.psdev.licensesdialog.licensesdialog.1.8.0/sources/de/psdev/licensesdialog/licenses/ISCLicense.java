package de.psdev.licensesdialog.licenses;

import android.content.Context;
import de.psdev.licensesdialog.R;

/* loaded from: de.psdev.licensesdialog.licensesdialog.1.8.0.jar:de/psdev/licensesdialog/licenses/ISCLicense.class */
public class ISCLicense extends License {
    private static final long serialVersionUID = -4636435634132169860L;

    @Override // de.psdev.licensesdialog.licenses.License
    public String getName() {
        return "ISC License";
    }

    @Override // de.psdev.licensesdialog.licenses.License
    public String readSummaryTextFromResources(Context context) {
        return getContent(context, R.raw.isc_summary);
    }

    @Override // de.psdev.licensesdialog.licenses.License
    public String readFullTextFromResources(Context context) {
        return getContent(context, R.raw.isc_full);
    }

    @Override // de.psdev.licensesdialog.licenses.License
    public String getVersion() {
        return "";
    }

    @Override // de.psdev.licensesdialog.licenses.License
    public String getUrl() {
        return "http://opensource.org/licenses/isc-license.txt";
    }
}
