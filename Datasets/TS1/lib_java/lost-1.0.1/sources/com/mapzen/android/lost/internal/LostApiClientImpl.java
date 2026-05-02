package com.mapzen.android.lost.internal;

import android.content.Context;
import com.mapzen.android.lost.api.LocationListener;
import com.mapzen.android.lost.api.LocationServices;
import com.mapzen.android.lost.api.LostApiClient;

/* loaded from: lost-1.0.1.jar:com/mapzen/android/lost/internal/LostApiClientImpl.class */
public class LostApiClientImpl implements LostApiClient {
    private final Context context;

    public LostApiClientImpl(Context context) {
        this.context = context;
    }

    @Override // com.mapzen.android.lost.api.LostApiClient
    public void connect() {
        LocationServices.FusedLocationApi = new FusedLocationProviderApiImpl(this.context);
        LocationServices.GeofencingApi = new GeofencingApiImpl();
    }

    @Override // com.mapzen.android.lost.api.LostApiClient
    public void disconnect() {
        if (LocationServices.FusedLocationApi != null) {
            LocationServices.FusedLocationApi.removeLocationUpdates((LocationListener) null);
        }
        LocationServices.FusedLocationApi = null;
        LocationServices.GeofencingApi = null;
    }

    @Override // com.mapzen.android.lost.api.LostApiClient
    public boolean isConnected() {
        return (LocationServices.FusedLocationApi == null || LocationServices.GeofencingApi == null) ? false : true;
    }
}
