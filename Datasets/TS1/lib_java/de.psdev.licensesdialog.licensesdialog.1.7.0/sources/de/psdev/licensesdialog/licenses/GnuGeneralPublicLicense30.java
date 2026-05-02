package de.psdev.licensesdialog.licenses;

import android.content.Context;
import de.psdev.licensesdialog.R;

/* loaded from: de.psdev.licensesdialog.licensesdialog.1.7.0.jar:de/psdev/licensesdialog/licenses/GnuGeneralPublicLicense30.class */
public class GnuGeneralPublicLicense30 extends License {
    @Override // de.psdev.licensesdialog.licenses.License
    public String getName() {
        return "GNU General Public License 3.0";
    }

    @Override // de.psdev.licensesdialog.licenses.License
    public String readSummaryTextFromResources(Context context) {
        return getContent(context, R.raw.gpl_30_summary);
    }

    @Override // de.psdev.licensesdialog.licenses.License
    public String readFullTextFromResources(Context context) {
        return getContent(context, R.raw.gpl_30_full);
    }

    @Override // de.psdev.licensesdialog.licenses.License
    public String getVersion() {
        return "3.0";
    }

    @Override // de.psdev.licensesdialog.licenses.License
    public String getUrl() {
        return "http://www.gnu.org/licenses/";
    }
}
