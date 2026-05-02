package org.osmdroid.tileprovider.modules;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/tileprovider/modules/NetworkAvailabliltyCheck.class */
public class NetworkAvailabliltyCheck implements INetworkAvailablityCheck {
    private final ConnectivityManager mConnectionManager;
    final boolean isX86 = "Android-x86".equalsIgnoreCase(Build.BRAND);

    public NetworkAvailabliltyCheck(Context aContext) {
        this.mConnectionManager = (ConnectivityManager) aContext.getSystemService("connectivity");
    }

    @Override // org.osmdroid.tileprovider.modules.INetworkAvailablityCheck
    public boolean getNetworkAvailable() {
        NetworkInfo networkInfo = this.mConnectionManager.getActiveNetworkInfo();
        return networkInfo != null && (networkInfo.isAvailable() || (networkInfo.getType() == 9 && this.isX86));
    }

    @Override // org.osmdroid.tileprovider.modules.INetworkAvailablityCheck
    public boolean getWiFiNetworkAvailable() {
        NetworkInfo wifi = this.mConnectionManager.getNetworkInfo(1);
        return wifi != null && wifi.isAvailable();
    }

    @Override // org.osmdroid.tileprovider.modules.INetworkAvailablityCheck
    public boolean getCellularDataNetworkAvailable() {
        NetworkInfo mobile = this.mConnectionManager.getNetworkInfo(0);
        return mobile != null && mobile.isAvailable();
    }

    @Override // org.osmdroid.tileprovider.modules.INetworkAvailablityCheck
    public boolean getRouteToPathExists(int hostAddress) {
        return this.mConnectionManager.requestRouteToHost(1, hostAddress) || this.mConnectionManager.requestRouteToHost(0, hostAddress);
    }
}
