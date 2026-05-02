package org.osmdroid.contributor.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Formatter;
import java.util.List;
import org.osmdroid.contributor.util.constants.OpenStreetMapContributorConstants;

/* loaded from: osmdroid-android-4.2.jar:org/osmdroid/contributor/util/RecordedRouteGPXFormatter.class */
public class RecordedRouteGPXFormatter implements OpenStreetMapContributorConstants {
    private static final String XML_VERSION = "<?xml version=\"1.0\"?>";
    private static final String GPX_VERSION = "1.1";
    private static final String GPX_TAG = "<gpx version=\"1.1\" creator=\"%s\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns=\"http://www.topografix.com/GPX/1/1\" xsi:schemaLocation=\"http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd\">";
    private static final String GPX_TAG_CLOSE = "</gpx>";
    private static final String GPX_TAG_TIME = "<time>%s</time>";
    private static final String GPX_TAG_TRACK = "<trk>";
    private static final String GPX_TAG_TRACK_CLOSE = "</trk>";
    private static final String GPX_TAG_TRACK_NAME = "<name>%s</name>";
    private static final String GPX_TAG_TRACK_SEGMENT = "<trkseg>";
    private static final String GPX_TAG_TRACK_SEGMENT_CLOSE = "</trkseg>";
    public static final String GPX_TAG_TRACK_SEGMENT_POINT = "<trkpt lat=\"%f\" lon=\"%f\">";
    public static final String GPX_TAG_TRACK_SEGMENT_POINT_CLOSE = "</trkpt>";
    public static final String GPX_TAG_TRACK_SEGMENT_POINT_TIME = "<time>%s</time>";
    public static final String GPX_TAG_TRACK_SEGMENT_POINT_SAT = "<sat>%d</sat>";
    public static final String GPX_TAG_TRACK_SEGMENT_POINT_ELE = "<ele>%d</ele>";
    private static final SimpleDateFormat formatterCompleteDateTime = new SimpleDateFormat("yyyyMMdd'_'HHmmss");

    public static String create(List<RecordedGeoPoint> someRecords) throws IllegalArgumentException {
        if (someRecords == null) {
            throw new IllegalArgumentException("Records may not be null.");
        }
        if (someRecords.size() == 0) {
            throw new IllegalArgumentException("Records size == 0");
        }
        StringBuilder sb = new StringBuilder();
        Formatter f = new Formatter(sb);
        sb.append(XML_VERSION);
        f.format(GPX_TAG, OpenStreetMapContributorConstants.OSM_CREATOR_INFO);
        f.format("<time>%s</time>", Util.convertTimestampToUTCString(System.currentTimeMillis()));
        sb.append(GPX_TAG_TRACK);
        f.format(GPX_TAG_TRACK_NAME, "PUT_YOUR_USERNAME_HERE--" + formatterCompleteDateTime.format(Long.valueOf(new Date(someRecords.get(0).getTimeStamp()).getTime())) + "-" + formatterCompleteDateTime.format(Long.valueOf(new Date(someRecords.get(someRecords.size() - 1).getTimeStamp()).getTime())));
        sb.append(GPX_TAG_TRACK_SEGMENT);
        for (RecordedGeoPoint rgp : someRecords) {
            f.format(GPX_TAG_TRACK_SEGMENT_POINT, Double.valueOf(rgp.getLatitudeAsDouble()), Double.valueOf(rgp.getLongitudeAsDouble()));
            f.format("<time>%s</time>", Util.convertTimestampToUTCString(rgp.getTimeStamp()));
            if (rgp.mNumSatellites != Integer.MIN_VALUE) {
                f.format(GPX_TAG_TRACK_SEGMENT_POINT_SAT, Integer.valueOf(rgp.mNumSatellites));
            }
            sb.append(GPX_TAG_TRACK_SEGMENT_POINT_CLOSE);
        }
        sb.append(GPX_TAG_TRACK_SEGMENT_CLOSE).append(GPX_TAG_TRACK_CLOSE).append(GPX_TAG_CLOSE);
        return sb.toString();
    }
}
