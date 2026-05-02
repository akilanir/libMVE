package org.osmdroid.views.overlay.mylocation;

import android.location.Location;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/views/overlay/mylocation/IMyLocationConsumer.class */
public interface IMyLocationConsumer {
    void onLocationChanged(Location location, IMyLocationProvider iMyLocationProvider);
}
