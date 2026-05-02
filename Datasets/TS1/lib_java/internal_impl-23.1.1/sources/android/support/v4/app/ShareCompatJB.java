package android.support.v4.app;

import android.text.Html;

/* loaded from: internal_impl-23.1.1.jar:android/support/v4/app/ShareCompatJB.class */
class ShareCompatJB {
    ShareCompatJB() {
    }

    public static String escapeHtml(CharSequence html) {
        return Html.escapeHtml(html);
    }
}
