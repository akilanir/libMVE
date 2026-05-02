package org.osmdroid.util;

import android.location.Location;
import android.location.LocationManager;
import org.osmdroid.util.constants.UtilConstants;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/util/LocationUtils.class */
public class LocationUtils implements UtilConstants {
    private LocationUtils() {
    }

    public static Location getLastKnownLocation(LocationManager pLocationManager) {
        if (pLocationManager == null) {
            return null;
        }
        Location gpsLocation = getLastKnownLocation(pLocationManager, "gps");
        Location networkLocation = getLastKnownLocation(pLocationManager, "network");
        if (gpsLocation == null) {
            return networkLocation;
        }
        if (networkLocation == null) {
            return gpsLocation;
        }
        if (networkLocation.getTime() > gpsLocation.getTime() + UtilConstants.GPS_WAIT_TIME) {
            return networkLocation;
        }
        return gpsLocation;
    }

    private static Location getLastKnownLocation(LocationManager pLocationManager, String pProvider) {
        try {
            if (!pLocationManager.isProviderEnabled(pProvider)) {
                return null;
            }
            return pLocationManager.getLastKnownLocation(pProvider);
        } catch (IllegalArgumentException e) {
            return null;
        }
    }
}
