package org.osmdroid.views.overlay.mylocation;

import android.location.Location;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/views/overlay/mylocation/IMyLocationProvider.class */
public interface IMyLocationProvider {
    boolean startLocationProvider(IMyLocationConsumer iMyLocationConsumer);

    void stopLocationProvider();

    Location getLastKnownLocation();
}
