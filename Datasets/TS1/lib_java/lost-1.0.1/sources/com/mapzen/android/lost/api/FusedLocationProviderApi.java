package com.mapzen.android.lost.api;

import android.app.PendingIntent;
import android.location.Location;
import android.os.Looper;
import java.io.File;

/* loaded from: lost-1.0.1.jar:com/mapzen/android/lost/api/FusedLocationProviderApi.class */
public interface FusedLocationProviderApi {
    Location getLastLocation();

    void removeLocationUpdates(LocationListener locationListener);

    void removeLocationUpdates(PendingIntent pendingIntent);

    void requestLocationUpdates(LocationRequest locationRequest, LocationListener locationListener, Looper looper);

    void requestLocationUpdates(LocationRequest locationRequest, LocationListener locationListener);

    void requestLocationUpdates(LocationRequest locationRequest, PendingIntent pendingIntent);

    void setMockLocation(Location location);

    void setMockMode(boolean z);

    void setMockTrace(File file);
}
