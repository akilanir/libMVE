package org.osmdroid.api;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/api/IMapController.class */
public interface IMapController {
    void animateTo(IGeoPoint iGeoPoint);

    void scrollBy(int i, int i2);

    void setCenter(IGeoPoint iGeoPoint);

    int setZoom(int i);

    void stopAnimation(boolean z);

    void stopPanning();

    boolean zoomIn();

    boolean zoomInFixing(int i, int i2);

    boolean zoomOut();

    boolean zoomOutFixing(int i, int i2);

    void zoomToSpan(int i, int i2);

    boolean isInvertedTiles();

    void setInvertedTiles(boolean z);
}
