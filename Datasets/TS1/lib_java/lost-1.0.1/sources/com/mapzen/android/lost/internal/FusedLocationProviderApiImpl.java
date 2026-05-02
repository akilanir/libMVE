package com.mapzen.android.lost.internal;

import android.app.PendingIntent;
import android.content.Context;
import android.location.Location;
import android.os.Looper;
import com.mapzen.android.lost.api.FusedLocationProviderApi;
import com.mapzen.android.lost.api.LocationListener;
import com.mapzen.android.lost.api.LocationRequest;
import com.mapzen.android.lost.internal.LocationEngine;
import java.io.File;

/* loaded from: lost-1.0.1.jar:com/mapzen/android/lost/internal/FusedLocationProviderApiImpl.class */
public class FusedLocationProviderApiImpl implements FusedLocationProviderApi, LocationEngine.Callback {
    private final Context context;
    private LocationEngine locationEngine;
    private LocationListener locationListener;
    private boolean mockMode;

    public FusedLocationProviderApiImpl(Context context) {
        this.context = context;
        this.locationEngine = new FusionEngine(context, this);
    }

    @Override // com.mapzen.android.lost.api.FusedLocationProviderApi
    public Location getLastLocation() {
        return this.locationEngine.getLastLocation();
    }

    @Override // com.mapzen.android.lost.api.FusedLocationProviderApi
    public void requestLocationUpdates(LocationRequest request, LocationListener listener) {
        this.locationListener = listener;
        this.locationEngine.setRequest(request);
    }

    @Override // com.mapzen.android.lost.api.FusedLocationProviderApi
    public void requestLocationUpdates(LocationRequest request, LocationListener listener, Looper looper) {
        throw new RuntimeException("Sorry, not yet implemented");
    }

    @Override // com.mapzen.android.lost.api.FusedLocationProviderApi
    public void requestLocationUpdates(LocationRequest request, PendingIntent callbackIntent) {
        throw new RuntimeException("Sorry, not yet implemented");
    }

    @Override // com.mapzen.android.lost.api.FusedLocationProviderApi
    public void removeLocationUpdates(LocationListener listener) {
        this.locationEngine.setRequest(null);
    }

    @Override // com.mapzen.android.lost.api.FusedLocationProviderApi
    public void removeLocationUpdates(PendingIntent callbackIntent) {
        throw new RuntimeException("Sorry, not yet implemented");
    }

    @Override // com.mapzen.android.lost.api.FusedLocationProviderApi
    public void setMockMode(boolean isMockMode) {
        if (this.mockMode != isMockMode) {
            toggleMockMode();
        }
    }

    private void toggleMockMode() {
        this.mockMode = !this.mockMode;
        this.locationEngine.setRequest(null);
        if (this.mockMode) {
            this.locationEngine = new MockEngine(this.context, this);
        } else {
            this.locationEngine = new FusionEngine(this.context, this);
        }
    }

    @Override // com.mapzen.android.lost.api.FusedLocationProviderApi
    public void setMockLocation(Location mockLocation) {
        if (this.locationEngine instanceof MockEngine) {
            ((MockEngine) this.locationEngine).setLocation(mockLocation);
        }
    }

    @Override // com.mapzen.android.lost.api.FusedLocationProviderApi
    public void setMockTrace(File file) {
        if (this.locationEngine instanceof MockEngine) {
            ((MockEngine) this.locationEngine).setTrace(file);
        }
    }

    @Override // com.mapzen.android.lost.internal.LocationEngine.Callback
    public void reportLocation(Location location) {
        if (this.locationListener != null) {
            this.locationListener.onLocationChanged(location);
        }
    }
}
