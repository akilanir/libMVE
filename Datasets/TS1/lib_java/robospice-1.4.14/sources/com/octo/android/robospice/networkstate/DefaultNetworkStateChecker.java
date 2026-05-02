package com.octo.android.robospice.networkstate;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;

/* loaded from: robospice-1.4.14.jar:com/octo/android/robospice/networkstate/DefaultNetworkStateChecker.class */
public class DefaultNetworkStateChecker implements NetworkStateChecker {
    @Override // com.octo.android.robospice.networkstate.NetworkStateChecker
    public boolean isNetworkAvailable(Context context) {
        ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService("connectivity");
        NetworkInfo[] allNetworkInfos = connectivityManager.getAllNetworkInfo();
        for (NetworkInfo networkInfo : allNetworkInfos) {
            if (networkInfo.getState() == NetworkInfo.State.CONNECTED || networkInfo.getState() == NetworkInfo.State.CONNECTING) {
                return true;
            }
        }
        return false;
    }

    @Override // com.octo.android.robospice.networkstate.NetworkStateChecker
    public void checkPermissions(Context context) {
        checkHasPermission(context, "android.permission.ACCESS_NETWORK_STATE");
        checkHasPermission(context, "android.permission.INTERNET");
    }

    private boolean checkHasPermission(Context context, String permissionName) {
        boolean hasPermission = context.getPackageManager().checkPermission(permissionName, context.getPackageName()) == 0;
        if (!hasPermission) {
            throw new SecurityException("Application doesn't declare <uses-permission android:name=\"" + permissionName + "\" />");
        }
        return true;
    }
}
