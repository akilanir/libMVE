package org.osmdroid.tileprovider.modules;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/tileprovider/modules/INetworkAvailablityCheck.class */
public interface INetworkAvailablityCheck {
    boolean getNetworkAvailable();

    boolean getWiFiNetworkAvailable();

    boolean getCellularDataNetworkAvailable();

    boolean getRouteToPathExists(int i);
}
