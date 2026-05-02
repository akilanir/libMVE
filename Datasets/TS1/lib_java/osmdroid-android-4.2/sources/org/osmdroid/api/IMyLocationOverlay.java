package org.osmdroid.api;

import android.location.Location;
import android.os.Bundle;

/* loaded from: osmdroid-android-4.2.jar:org/osmdroid/api/IMyLocationOverlay.class */
public interface IMyLocationOverlay {
    boolean enableMyLocation();

    void disableMyLocation();

    boolean isMyLocationEnabled();

    boolean enableCompass();

    void disableCompass();

    boolean isCompassEnabled();

    float getOrientation();

    boolean runOnFirstFix(Runnable runnable);

    void onStatusChanged(String str, int i, Bundle bundle);

    Location getLastFix();
}
