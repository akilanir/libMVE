package org.osmdroid;

import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/LocationListenerProxy.class */
public class LocationListenerProxy implements LocationListener {
    private final LocationManager mLocationManager;
    private LocationListener mListener = null;

    public LocationListenerProxy(LocationManager pLocationManager) {
        this.mLocationManager = pLocationManager;
    }

    public boolean startListening(LocationListener pListener, long pUpdateTime, float pUpdateDistance) {
        boolean result = false;
        this.mListener = pListener;
        for (String provider : this.mLocationManager.getProviders(true)) {
            if ("gps".equals(provider) || "network".equals(provider)) {
                result = true;
                this.mLocationManager.requestLocationUpdates(provider, pUpdateTime, pUpdateDistance, this);
            }
        }
        return result;
    }

    public void stopListening() {
        this.mListener = null;
        this.mLocationManager.removeUpdates(this);
    }

    @Override // android.location.LocationListener
    public void onLocationChanged(Location arg0) {
        if (this.mListener != null) {
            this.mListener.onLocationChanged(arg0);
        }
    }

    @Override // android.location.LocationListener
    public void onProviderDisabled(String arg0) {
        if (this.mListener != null) {
            this.mListener.onProviderDisabled(arg0);
        }
    }

    @Override // android.location.LocationListener
    public void onProviderEnabled(String arg0) {
        if (this.mListener != null) {
            this.mListener.onProviderEnabled(arg0);
        }
    }

    @Override // android.location.LocationListener
    public void onStatusChanged(String arg0, int arg1, Bundle arg2) {
        if (this.mListener != null) {
            this.mListener.onStatusChanged(arg0, arg1, arg2);
        }
    }
}
