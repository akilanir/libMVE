package org.osmdroid.api;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/api/IPosition.class */
public interface IPosition {
    double getLatitude();

    double getLongitude();

    boolean hasBearing();

    float getBearing();

    boolean hasZoomLevel();

    float getZoomLevel();
}
