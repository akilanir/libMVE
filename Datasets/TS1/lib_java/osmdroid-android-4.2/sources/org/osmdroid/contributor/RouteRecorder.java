package org.osmdroid.contributor;

import android.location.Location;
import java.util.ArrayList;
import org.osmdroid.contributor.util.RecordedGeoPoint;
import org.osmdroid.util.GeoPoint;

/* loaded from: osmdroid-android-4.2.jar:org/osmdroid/contributor/RouteRecorder.class */
public class RouteRecorder {
    protected final ArrayList<RecordedGeoPoint> mRecords = new ArrayList<>();

    public ArrayList<RecordedGeoPoint> getRecordedGeoPoints() {
        return this.mRecords;
    }

    public void add(Location aLocation, int aNumSatellites) {
        this.mRecords.add(new RecordedGeoPoint((int) (aLocation.getLatitude() * 1000000.0d), (int) (aLocation.getLongitude() * 1000000.0d), System.currentTimeMillis(), aNumSatellites));
    }

    public void add(GeoPoint aGeoPoint, int aNumSatellites) {
        this.mRecords.add(new RecordedGeoPoint(aGeoPoint.getLatitudeE6(), aGeoPoint.getLongitudeE6(), System.currentTimeMillis(), aNumSatellites));
    }
}
