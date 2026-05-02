package org.osmdroid.api;

import android.graphics.Point;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/api/IProjection.class */
public interface IProjection {
    Point toPixels(IGeoPoint iGeoPoint, Point point);

    IGeoPoint fromPixels(int i, int i2);

    float metersToEquatorPixels(float f);

    IGeoPoint getNorthEast();

    IGeoPoint getSouthWest();
}
