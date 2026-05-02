package com.mapzen.android.lost.internal;

import android.content.Context;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.util.Log;
import com.mapzen.android.lost.api.LocationRequest;
import com.mapzen.android.lost.internal.LocationEngine;
import java.util.List;

/* loaded from: lost-1.0.1.jar:com/mapzen/android/lost/internal/FusionEngine.class */
public class FusionEngine extends LocationEngine implements LocationListener {
    public static final long RECENT_UPDATE_THRESHOLD_IN_MILLIS = 60000;
    public static final long RECENT_UPDATE_THRESHOLD_IN_NANOS = 60000000000L;
    private final LocationManager locationManager;
    private Location gpsLocation;
    private Location networkLocation;
    private static final String TAG = FusionEngine.class.getSimpleName();
    static Clock clock = new SystemClock();

    public FusionEngine(Context context, LocationEngine.Callback callback) {
        super(context, callback);
        this.locationManager = (LocationManager) context.getSystemService("location");
    }

    @Override // com.mapzen.android.lost.internal.LocationEngine
    public Location getLastLocation() {
        List<String> providers = this.locationManager.getAllProviders();
        long minTime = clock.getCurrentTimeInMillis() - RECENT_UPDATE_THRESHOLD_IN_MILLIS;
        Location bestLocation = null;
        float bestAccuracy = Float.MAX_VALUE;
        long bestTime = Long.MIN_VALUE;
        for (String provider : providers) {
            Location location = this.locationManager.getLastKnownLocation(provider);
            if (location != null) {
                float accuracy = location.getAccuracy();
                long time = location.getTime();
                if (time > minTime && accuracy < bestAccuracy) {
                    bestLocation = location;
                    bestAccuracy = accuracy;
                    bestTime = time;
                } else if (time < minTime && bestAccuracy == Float.MAX_VALUE && time > bestTime) {
                    bestLocation = location;
                    bestTime = time;
                }
            }
        }
        return bestLocation;
    }

    @Override // com.mapzen.android.lost.internal.LocationEngine
    protected void enable() {
        switch (getRequest().getPriority()) {
            case LocationRequest.PRIORITY_HIGH_ACCURACY /* 100 */:
                enableGps();
                enableNetwork();
                break;
            case LocationRequest.PRIORITY_BALANCED_POWER_ACCURACY /* 102 */:
                enableNetwork();
                break;
            case LocationRequest.PRIORITY_LOW_POWER /* 104 */:
                enableNetwork();
                break;
            case LocationRequest.PRIORITY_NO_POWER /* 105 */:
                enablePassive();
                break;
        }
    }

    @Override // com.mapzen.android.lost.internal.LocationEngine
    protected void disable() {
        if (this.locationManager != null) {
            this.locationManager.removeUpdates(this);
        }
    }

    private void enableGps() {
        try {
            this.locationManager.requestLocationUpdates("gps", getRequest().getFastestInterval(), getRequest().getSmallestDisplacement(), this);
        } catch (IllegalArgumentException e) {
            Log.e(TAG, "Unable to register for GPS updates.", e);
        }
    }

    private void enableNetwork() {
        try {
            this.locationManager.requestLocationUpdates("network", getRequest().getFastestInterval(), getRequest().getSmallestDisplacement(), this);
        } catch (IllegalArgumentException e) {
            Log.e(TAG, "Unable to register for network updates.", e);
        }
    }

    private void enablePassive() {
        try {
            this.locationManager.requestLocationUpdates("passive", getRequest().getFastestInterval(), getRequest().getSmallestDisplacement(), this);
        } catch (IllegalArgumentException e) {
            Log.e(TAG, "Unable to register for passive updates.", e);
        }
    }

    @Override // android.location.LocationListener
    public void onLocationChanged(Location location) {
        if ("gps".equals(location.getProvider())) {
            this.gpsLocation = location;
            if (getCallback() != null && isBetterThan(this.gpsLocation, this.networkLocation)) {
                getCallback().reportLocation(location);
                return;
            }
            return;
        }
        if ("network".equals(location.getProvider())) {
            this.networkLocation = location;
            if (getCallback() != null && isBetterThan(this.networkLocation, this.gpsLocation)) {
                getCallback().reportLocation(location);
            }
        }
    }

    @Override // android.location.LocationListener
    public void onStatusChanged(String provider, int status, Bundle extras) {
    }

    @Override // android.location.LocationListener
    public void onProviderEnabled(String provider) {
    }

    @Override // android.location.LocationListener
    public void onProviderDisabled(String provider) {
    }

    public static boolean isBetterThan(Location locationA, Location locationB) {
        if (locationA == null) {
            return false;
        }
        if (locationB == null || SystemClock.getTimeInNanos(locationA) > SystemClock.getTimeInNanos(locationB) + RECENT_UPDATE_THRESHOLD_IN_NANOS) {
            return true;
        }
        if (locationA.hasAccuracy()) {
            return !locationB.hasAccuracy() || locationA.getAccuracy() < locationB.getAccuracy();
        }
        return false;
    }
}
