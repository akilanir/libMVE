package org.androidannotations.api;

import android.os.Build;

/* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/api/SdkVersionHelper.class */
public class SdkVersionHelper {
    private SdkVersionHelper() {
    }

    public static int getSdkInt() {
        if (Build.VERSION.RELEASE.startsWith("1.5")) {
            return 3;
        }
        return HelperInternal.getSdkIntInternal();
    }

    /* loaded from: androidannotations-api-3.3.2.jar:org/androidannotations/api/SdkVersionHelper$HelperInternal.class */
    private static class HelperInternal {
        private HelperInternal() {
        }

        /* JADX INFO: Access modifiers changed from: private */
        public static int getSdkIntInternal() {
            return Build.VERSION.SDK_INT;
        }
    }
}
