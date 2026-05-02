package com.mapzen.android.lost.internal;

import android.app.PendingIntent;
import com.mapzen.android.lost.api.Geofence;
import com.mapzen.android.lost.api.GeofencingApi;
import java.util.List;

/* loaded from: lost-1.0.1.jar:com/mapzen/android/lost/internal/GeofencingApiImpl.class */
public class GeofencingApiImpl implements GeofencingApi {
    @Override // com.mapzen.android.lost.api.GeofencingApi
    public void addGeofences(List<Geofence> geofences, PendingIntent pendingIntent) {
        throw new RuntimeException("Sorry, not yet implemented");
    }

    @Override // com.mapzen.android.lost.api.GeofencingApi
    public void removeGeofences(List<String> geofenceRequestIds) {
        throw new RuntimeException("Sorry, not yet implemented");
    }

    @Override // com.mapzen.android.lost.api.GeofencingApi
    public void removeGeofences(PendingIntent pendingIntent) {
        throw new RuntimeException("Sorry, not yet implemented");
    }
}
