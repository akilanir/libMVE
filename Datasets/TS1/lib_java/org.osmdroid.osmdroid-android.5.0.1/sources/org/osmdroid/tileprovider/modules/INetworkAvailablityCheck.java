package org.osmdroid.tileprovider.modules;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/tileprovider/modules/INetworkAvailablityCheck.class */
public interface INetworkAvailablityCheck {
    boolean getNetworkAvailable();

    boolean getWiFiNetworkAvailable();

    boolean getCellularDataNetworkAvailable();

    boolean getRouteToPathExists(int i);
}
