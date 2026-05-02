package org.osmdroid.views.overlay.mylocation;

import android.location.Location;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/views/overlay/mylocation/IMyLocationConsumer.class */
public interface IMyLocationConsumer {
    void onLocationChanged(Location location, IMyLocationProvider iMyLocationProvider);
}
