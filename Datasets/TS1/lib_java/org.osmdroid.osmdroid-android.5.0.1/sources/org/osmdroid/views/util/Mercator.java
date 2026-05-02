package org.osmdroid.views.util;

import android.graphics.Point;
import org.osmdroid.api.IGeoPoint;
import org.osmdroid.util.BoundingBoxE6;
import org.osmdroid.util.GeoPoint;
import org.osmdroid.views.util.constants.MapViewConstants;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/views/util/Mercator.class */
public class Mercator implements MapViewConstants {
    static final double DEG2RAD = 0.017453292519943295d;

    private Mercator() {
    }

    public static Point projectGeoPoint(int aLatE6, int aLonE6, int aZoom, Point aReuse) {
        return projectGeoPoint(aLatE6 * 1.0E-6d, aLonE6 * 1.0E-6d, aZoom, aReuse);
    }

    public static Point projectGeoPoint(IGeoPoint aGeoPoint, int aZoom, Point aReuse) {
        return projectGeoPoint(aGeoPoint.getLatitudeE6() * 1.0E-6d, aGeoPoint.getLongitudeE6() * 1.0E-6d, aZoom, aReuse);
    }

    public static Point projectGeoPoint(double aLat, double aLon, int aZoom, Point aReuse) {
        Point p = aReuse != null ? aReuse : new Point(0, 0);
        p.x = (int) Math.floor(((aLon + 180.0d) / 360.0d) * (1 << aZoom));
        p.y = (int) Math.floor(((1.0d - (Math.log(Math.tan(aLat * 0.017453292519943295d) + (1.0d / Math.cos(aLat * 0.017453292519943295d))) / 3.141592653589793d)) / 2.0d) * (1 << aZoom));
        return p;
    }

    public static BoundingBoxE6 getBoundingBoxFromCoords(int left, int top, int right, int bottom, int zoom) {
        return new BoundingBoxE6(tile2lat(top, zoom), tile2lon(right, zoom), tile2lat(bottom, zoom), tile2lon(left, zoom));
    }

    public static BoundingBoxE6 getBoundingBoxFromPointInMapTile(Point aMapTile, int aZoom) {
        return new BoundingBoxE6(tile2lat(aMapTile.y, aZoom), tile2lon(aMapTile.x + 1, aZoom), tile2lat(aMapTile.y + 1, aZoom), tile2lon(aMapTile.x, aZoom));
    }

    public static GeoPoint projectPoint(int x, int y, int aZoom) {
        return new GeoPoint((int) (tile2lat(y, aZoom) * 1000000.0d), (int) (tile2lon(x, aZoom) * 1000000.0d));
    }

    public static double tile2lon(int x, int aZoom) {
        return ((x / (1 << aZoom)) * 360.0d) - 180.0d;
    }

    public static double tile2lat(int y, int aZoom) {
        double n = 3.141592653589793d - ((6.283185307179586d * y) / (1 << aZoom));
        return 57.29577951308232d * Math.atan(0.5d * (Math.exp(n) - Math.exp(-n)));
    }
}
