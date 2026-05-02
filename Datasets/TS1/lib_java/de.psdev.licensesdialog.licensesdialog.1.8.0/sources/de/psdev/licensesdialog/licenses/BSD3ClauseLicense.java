package de.psdev.licensesdialog.licenses;

import android.content.Context;
import de.psdev.licensesdialog.R;

/* loaded from: de.psdev.licensesdialog.licensesdialog.1.8.0.jar:de/psdev/licensesdialog/licenses/BSD3ClauseLicense.class */
public class BSD3ClauseLicense extends License {
    private static final long serialVersionUID = -5205394619884057474L;

    @Override // de.psdev.licensesdialog.licenses.License
    public String getName() {
        return "BSD 3-Clause License";
    }

    @Override // de.psdev.licensesdialog.licenses.License
    public String readSummaryTextFromResources(Context context) {
        return getContent(context, R.raw.bsd3_summary);
    }

    @Override // de.psdev.licensesdialog.licenses.License
    public String readFullTextFromResources(Context context) {
        return getContent(context, R.raw.bsd3_full);
    }

    @Override // de.psdev.licensesdialog.licenses.License
    public String getVersion() {
        return "";
    }

    @Override // de.psdev.licensesdialog.licenses.License
    public String getUrl() {
        return "http://opensource.org/licenses/BSD-3-Clause";
    }
}
