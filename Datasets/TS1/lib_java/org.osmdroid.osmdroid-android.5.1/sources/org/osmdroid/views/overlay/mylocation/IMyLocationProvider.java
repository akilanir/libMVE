package org.osmdroid.views.overlay.mylocation;

import android.location.Location;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/views/overlay/mylocation/IMyLocationProvider.class */
public interface IMyLocationProvider {
    boolean startLocationProvider(IMyLocationConsumer iMyLocationConsumer);

    void stopLocationProvider();

    Location getLastKnownLocation();
}
