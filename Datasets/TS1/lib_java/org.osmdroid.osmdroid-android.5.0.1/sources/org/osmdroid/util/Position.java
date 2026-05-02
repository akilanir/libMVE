package org.osmdroid.util;

import org.osmdroid.api.IPosition;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/util/Position.class */
public class Position implements IPosition {
    private final double mLatitude;
    private final double mLongitude;
    private boolean mHasBearing;
    private float mBearing;
    private boolean mHasZoomLevel;
    private float mZoomLevel;

    public Position(double aLatitude, double aLongitude) {
        this.mLatitude = aLatitude;
        this.mLongitude = aLongitude;
    }

    @Override // org.osmdroid.api.IPosition
    public double getLatitude() {
        return this.mLatitude;
    }

    @Override // org.osmdroid.api.IPosition
    public double getLongitude() {
        return this.mLongitude;
    }

    @Override // org.osmdroid.api.IPosition
    public boolean hasBearing() {
        return this.mHasBearing;
    }

    @Override // org.osmdroid.api.IPosition
    public float getBearing() {
        return this.mBearing;
    }

    public void setBearing(float aBearing) {
        this.mHasBearing = true;
        this.mBearing = aBearing;
    }

    @Override // org.osmdroid.api.IPosition
    public boolean hasZoomLevel() {
        return this.mHasZoomLevel;
    }

    @Override // org.osmdroid.api.IPosition
    public float getZoomLevel() {
        return this.mZoomLevel;
    }

    public void setZoomLevel(float aZoomLevel) {
        this.mHasZoomLevel = true;
        this.mZoomLevel = aZoomLevel;
    }
}
