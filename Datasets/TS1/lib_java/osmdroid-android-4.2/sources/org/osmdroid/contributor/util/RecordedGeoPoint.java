package org.osmdroid.contributor.util;

import org.osmdroid.contributor.util.constants.OpenStreetMapContributorConstants;
import org.osmdroid.util.GeoPoint;

/* loaded from: osmdroid-android-4.2.jar:org/osmdroid/contributor/util/RecordedGeoPoint.class */
public class RecordedGeoPoint extends GeoPoint implements OpenStreetMapContributorConstants {
    private static final long serialVersionUID = 7304941424576720318L;
    protected final long mTimeStamp;
    protected final int mNumSatellites;

    public RecordedGeoPoint(int latitudeE6, int longitudeE6) {
        this(latitudeE6, longitudeE6, System.currentTimeMillis(), Integer.MIN_VALUE);
    }

    public RecordedGeoPoint(int latitudeE6, int longitudeE6, long aTimeStamp, int aNumSatellites) {
        super(latitudeE6, longitudeE6);
        this.mTimeStamp = aTimeStamp;
        this.mNumSatellites = aNumSatellites;
    }

    public long getTimeStamp() {
        return this.mTimeStamp;
    }

    public double getLatitudeAsDouble() {
        return getLatitudeE6() / 1000000.0d;
    }

    public double getLongitudeAsDouble() {
        return getLongitudeE6() / 1000000.0d;
    }

    public int getNumSatellites() {
        return this.mNumSatellites;
    }
}
