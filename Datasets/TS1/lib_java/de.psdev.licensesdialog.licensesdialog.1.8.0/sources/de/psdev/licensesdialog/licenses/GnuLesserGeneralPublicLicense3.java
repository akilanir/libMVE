package de.psdev.licensesdialog.licenses;

import android.content.Context;
import de.psdev.licensesdialog.R;

/* loaded from: de.psdev.licensesdialog.licensesdialog.1.8.0.jar:de/psdev/licensesdialog/licenses/GnuLesserGeneralPublicLicense3.class */
public class GnuLesserGeneralPublicLicense3 extends License {
    @Override // de.psdev.licensesdialog.licenses.License
    public String getName() {
        return "GNU Lesser General Public License 3";
    }

    @Override // de.psdev.licensesdialog.licenses.License
    public String readSummaryTextFromResources(Context context) {
        return getContent(context, R.raw.lgpl_3_summary);
    }

    @Override // de.psdev.licensesdialog.licenses.License
    public String readFullTextFromResources(Context context) {
        return getContent(context, R.raw.lgpl_3_full);
    }

    @Override // de.psdev.licensesdialog.licenses.License
    public String getVersion() {
        return "3";
    }

    @Override // de.psdev.licensesdialog.licenses.License
    public String getUrl() {
        return "http://www.gnu.org/licenses/lgpl.html";
    }
}
