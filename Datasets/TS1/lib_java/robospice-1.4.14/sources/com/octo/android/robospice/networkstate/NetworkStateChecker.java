package com.octo.android.robospice.networkstate;

import android.content.Context;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/networkstate/NetworkStateChecker.class */
public interface NetworkStateChecker {
    boolean isNetworkAvailable(Context context);

    void checkPermissions(Context context);
}
