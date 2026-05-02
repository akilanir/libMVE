package org.osmdroid.api;

/* loaded from: osmdroid-android-4.2.jar:org/osmdroid/api/IMapView.class */
public interface IMapView {
    IMapController getController();

    IProjection getProjection();

    int getZoomLevel();

    int getMaxZoomLevel();

    int getLatitudeSpan();

    int getLongitudeSpan();

    IGeoPoint getMapCenter();

    void setBackgroundColor(int i);
}
