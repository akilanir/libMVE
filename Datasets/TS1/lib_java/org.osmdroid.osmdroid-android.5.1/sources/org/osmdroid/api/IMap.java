package org.osmdroid.api;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/api/IMap.class */
public interface IMap {
    float getZoomLevel();

    void setZoom(float f);

    IGeoPoint getCenter();

    void setCenter(double d, double d2);

    float getBearing();

    void setBearing(float f);

    void setPosition(IPosition iPosition);

    boolean zoomIn();

    boolean zoomOut();

    void setMyLocationEnabled(boolean z);

    boolean isMyLocationEnabled();

    IProjection getProjection();

    void addMarker(Marker marker);

    int addPolyline(Polyline polyline);

    void addPointsToPolyline(int i, IGeoPoint... iGeoPointArr);

    void clearPolyline(int i);

    void clear();

    void setOnCameraChangeListener(OnCameraChangeListener onCameraChangeListener);
}
