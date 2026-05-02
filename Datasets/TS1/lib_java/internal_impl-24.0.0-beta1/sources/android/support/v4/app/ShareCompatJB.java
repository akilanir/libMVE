package android.support.v4.app;

import android.text.Html;

/* loaded from: internal_impl-24.0.0-beta1.jar:android/support/v4/app/ShareCompatJB.class */
class ShareCompatJB {
    ShareCompatJB() {
    }

    public static String escapeHtml(CharSequence html) {
        return Html.escapeHtml(html);
    }
}
