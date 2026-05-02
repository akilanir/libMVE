package de.psdev.licensesdialog.licenses;

import android.content.Context;
import de.psdev.licensesdialog.R;

/* loaded from: de.psdev.licensesdialog.licensesdialog.1.8.0.jar:de/psdev/licensesdialog/licenses/ApacheSoftwareLicense20.class */
public class ApacheSoftwareLicense20 extends License {
    private static final long serialVersionUID = 4854000061990891449L;

    @Override // de.psdev.licensesdialog.licenses.License
    public String getName() {
        return "Apache Software License 2.0";
    }

    @Override // de.psdev.licensesdialog.licenses.License
    public String readSummaryTextFromResources(Context context) {
        return getContent(context, R.raw.asl_20_summary);
    }

    @Override // de.psdev.licensesdialog.licenses.License
    public String readFullTextFromResources(Context context) {
        return getContent(context, R.raw.asl_20_full);
    }

    @Override // de.psdev.licensesdialog.licenses.License
    public String getVersion() {
        return "2.0";
    }

    @Override // de.psdev.licensesdialog.licenses.License
    public String getUrl() {
        return "http://www.apache.org/licenses/LICENSE-2.0.txt";
    }
}
