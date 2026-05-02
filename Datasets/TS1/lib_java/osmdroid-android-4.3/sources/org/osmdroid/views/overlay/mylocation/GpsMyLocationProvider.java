package org.osmdroid.views.overlay.mylocation;

import android.content.Context;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import org.osmdroid.util.NetworkLocationIgnorer;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/views/overlay/mylocation/GpsMyLocationProvider.class */
public class GpsMyLocationProvider implements IMyLocationProvider, LocationListener {
    private final LocationManager mLocationManager;
    private Location mLocation;
    private IMyLocationConsumer mMyLocationConsumer;
    private long mLocationUpdateMinTime = 0;
    private float mLocationUpdateMinDistance = 0.0f;
    private final NetworkLocationIgnorer mIgnorer = new NetworkLocationIgnorer();

    public GpsMyLocationProvider(Context context) {
        this.mLocationManager = (LocationManager) context.getSystemService("location");
    }

    public long getLocationUpdateMinTime() {
        return this.mLocationUpdateMinTime;
    }

    public void setLocationUpdateMinTime(long milliSeconds) {
        this.mLocationUpdateMinTime = milliSeconds;
    }

    public float getLocationUpdateMinDistance() {
        return this.mLocationUpdateMinDistance;
    }

    public void setLocationUpdateMinDistance(float meters) {
        this.mLocationUpdateMinDistance = meters;
    }

    @Override // org.osmdroid.views.overlay.mylocation.IMyLocationProvider
    public boolean startLocationProvider(IMyLocationConsumer myLocationConsumer) {
        this.mMyLocationConsumer = myLocationConsumer;
        boolean result = false;
        for (String provider : this.mLocationManager.getProviders(true)) {
            if ("gps".equals(provider) || "network".equals(provider)) {
                result = true;
                this.mLocationManager.requestLocationUpdates(provider, this.mLocationUpdateMinTime, this.mLocationUpdateMinDistance, this);
            }
        }
        return result;
    }

    @Override // org.osmdroid.views.overlay.mylocation.IMyLocationProvider
    public void stopLocationProvider() {
        this.mMyLocationConsumer = null;
        this.mLocationManager.removeUpdates(this);
    }

    @Override // org.osmdroid.views.overlay.mylocation.IMyLocationProvider
    public Location getLastKnownLocation() {
        return this.mLocation;
    }

    @Override // android.location.LocationListener
    public void onLocationChanged(Location location) {
        if (this.mIgnorer.shouldIgnore(location.getProvider(), System.currentTimeMillis())) {
            return;
        }
        this.mLocation = location;
        if (this.mMyLocationConsumer != null) {
            this.mMyLocationConsumer.onLocationChanged(this.mLocation, this);
        }
    }

    @Override // android.location.LocationListener
    public void onProviderDisabled(String provider) {
    }

    @Override // android.location.LocationListener
    public void onProviderEnabled(String provider) {
    }

    @Override // android.location.LocationListener
    public void onStatusChanged(String provider, int status, Bundle extras) {
    }
}
