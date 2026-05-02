package com.mapzen.android.lost.api;

import android.app.PendingIntent;
import java.util.List;

/* loaded from: lost-1.0.1.jar:com/mapzen/android/lost/api/GeofencingApi.class */
public interface GeofencingApi {
    void addGeofences(List<Geofence> list, PendingIntent pendingIntent);

    void removeGeofences(List<String> list);

    void removeGeofences(PendingIntent pendingIntent);
}
