package org.osmdroid.api;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/api/IPosition.class */
public interface IPosition {
    double getLatitude();

    double getLongitude();

    boolean hasBearing();

    float getBearing();

    boolean hasZoomLevel();

    float getZoomLevel();
}
