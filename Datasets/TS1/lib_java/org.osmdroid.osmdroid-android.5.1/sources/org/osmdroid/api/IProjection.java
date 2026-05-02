package org.osmdroid.api;

import android.graphics.Point;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/api/IProjection.class */
public interface IProjection {
    Point toPixels(IGeoPoint iGeoPoint, Point point);

    IGeoPoint fromPixels(int i, int i2);

    float metersToEquatorPixels(float f);

    IGeoPoint getNorthEast();

    IGeoPoint getSouthWest();
}
