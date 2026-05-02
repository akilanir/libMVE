package com.mapzen.android.lost.internal;

import android.content.Context;
import android.location.Location;
import com.mapzen.android.lost.api.LocationRequest;

/* loaded from: lost-1.0.1.jar:com/mapzen/android/lost/internal/LocationEngine.class */
public abstract class LocationEngine {
    private final Context context;
    private final Callback callback;
    private LocationRequest request;

    /* loaded from: lost-1.0.1.jar:com/mapzen/android/lost/internal/LocationEngine$Callback.class */
    public interface Callback {
        void reportLocation(Location location);
    }

    public abstract Location getLastLocation();

    protected abstract void enable();

    protected abstract void disable();

    public LocationEngine(Context context, Callback callback) {
        this.context = context;
        this.callback = callback;
    }

    public void setRequest(LocationRequest request) {
        this.request = request;
        if (request != null) {
            enable();
        } else {
            disable();
        }
    }

    protected Context getContext() {
        return this.context;
    }

    protected Callback getCallback() {
        return this.callback;
    }

    protected LocationRequest getRequest() {
        return this.request;
    }
}
