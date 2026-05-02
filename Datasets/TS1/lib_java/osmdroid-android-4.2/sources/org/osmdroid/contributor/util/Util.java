package org.osmdroid.contributor.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.TimeZone;
import org.osmdroid.contributor.util.constants.OpenStreetMapContributorConstants;
import org.osmdroid.util.BoundingBoxE6;

/* loaded from: osmdroid-android-4.2.jar:org/osmdroid/contributor/util/Util.class */
public class Util implements OpenStreetMapContributorConstants {
    public static final SimpleDateFormat UTCSimpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");

    private Util() {
        UTCSimpleDateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
    }

    public static final String convertTimestampToUTCString(long aTimestamp) {
        return UTCSimpleDateFormat.format(new Date(aTimestamp));
    }

    public static boolean isSufficienDataForUpload(ArrayList<RecordedGeoPoint> recordedGeoPoints) {
        if (recordedGeoPoints == null || recordedGeoPoints.size() < 100) {
            return false;
        }
        BoundingBoxE6 bb = BoundingBoxE6.fromGeoPoints(recordedGeoPoints);
        int diagMeters = bb.getDiagonalLengthInMeters();
        if (diagMeters < 300) {
            return false;
        }
        return true;
    }
}
