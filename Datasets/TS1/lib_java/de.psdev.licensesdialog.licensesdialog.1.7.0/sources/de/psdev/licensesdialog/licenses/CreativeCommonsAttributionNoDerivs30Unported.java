package de.psdev.licensesdialog.licenses;

import android.content.Context;
import de.psdev.licensesdialog.R;

/* loaded from: de.psdev.licensesdialog.licensesdialog.1.7.0.jar:de/psdev/licensesdialog/licenses/CreativeCommonsAttributionNoDerivs30Unported.class */
public class CreativeCommonsAttributionNoDerivs30Unported extends License {
    @Override // de.psdev.licensesdialog.licenses.License
    public String getName() {
        return "Creative Commons Attribution-NoDerivs 3.0 Unported";
    }

    @Override // de.psdev.licensesdialog.licenses.License
    public String readSummaryTextFromResources(Context context) {
        return getContent(context, R.raw.ccand_30_summary);
    }

    @Override // de.psdev.licensesdialog.licenses.License
    public String readFullTextFromResources(Context context) {
        return getContent(context, R.raw.ccand_30_full);
    }

    @Override // de.psdev.licensesdialog.licenses.License
    public String getVersion() {
        return "3.0";
    }

    @Override // de.psdev.licensesdialog.licenses.License
    public String getUrl() {
        return "http://creativecommons.org/licenses/by-nd/3.0/";
    }
}
