package org.acra.util;

import android.content.Context;
import android.widget.Toast;
import org.acra.ACRA;

/* loaded from: acra-4.6.2.jar:org/acra/util/ToastSender.class */
public final class ToastSender {
    public static void sendToast(Context context, int toastResourceId, int toastLength) {
        try {
            Toast.makeText(context, toastResourceId, toastLength).show();
        } catch (RuntimeException e) {
            ACRA.log.e(ACRA.LOG_TAG, "Could not send crash Toast", e);
        }
    }
}
