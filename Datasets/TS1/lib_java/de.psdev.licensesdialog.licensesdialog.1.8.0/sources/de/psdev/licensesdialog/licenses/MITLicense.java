package de.psdev.licensesdialog.licenses;

import android.content.Context;
import de.psdev.licensesdialog.R;

/* loaded from: de.psdev.licensesdialog.licensesdialog.1.8.0.jar:de/psdev/licensesdialog/licenses/MITLicense.class */
public class MITLicense extends License {
    private static final long serialVersionUID = 5673599951781482594L;

    @Override // de.psdev.licensesdialog.licenses.License
    public String getName() {
        return "MIT License";
    }

    @Override // de.psdev.licensesdialog.licenses.License
    public String readSummaryTextFromResources(Context context) {
        return getContent(context, R.raw.mit_summary);
    }

    @Override // de.psdev.licensesdialog.licenses.License
    public String readFullTextFromResources(Context context) {
        return getContent(context, R.raw.mit_full);
    }

    @Override // de.psdev.licensesdialog.licenses.License
    public String getVersion() {
        return "";
    }

    @Override // de.psdev.licensesdialog.licenses.License
    public String getUrl() {
        return "http://opensource.org/licenses/MIT";
    }
}
