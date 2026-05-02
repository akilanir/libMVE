package org.osmdroid.api;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/api/IMapView.class */
public interface IMapView {
    public static final String LOGTAG = "OsmDroid";

    IMapController getController();

    IProjection getProjection();

    int getZoomLevel();

    int getMaxZoomLevel();

    int getLatitudeSpan();

    int getLongitudeSpan();

    IGeoPoint getMapCenter();

    void setBackgroundColor(int i);
}
