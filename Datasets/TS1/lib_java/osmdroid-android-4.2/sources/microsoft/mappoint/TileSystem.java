package microsoft.mappoint;

import android.graphics.Point;
import org.osmdroid.util.GeoPoint;

/* loaded from: osmdroid-android-4.2.jar:microsoft/mappoint/TileSystem.class */
public final class TileSystem {
    protected static int mTileSize = 256;
    private static final double EarthRadius = 6378137.0d;
    private static final double MinLatitude = -85.05112878d;
    private static final double MaxLatitude = 85.05112878d;
    private static final double MinLongitude = -180.0d;
    private static final double MaxLongitude = 180.0d;

    public static void setTileSize(int tileSize) {
        mTileSize = tileSize;
    }

    public static int getTileSize() {
        return mTileSize;
    }

    private static double Clip(double n, double minValue, double maxValue) {
        return Math.min(Math.max(n, minValue), maxValue);
    }

    public static int MapSize(int levelOfDetail) {
        return mTileSize << levelOfDetail;
    }

    public static double GroundResolution(double latitude, int levelOfDetail) {
        return (((Math.cos((Clip(latitude, MinLatitude, MaxLatitude) * 3.141592653589793d) / MaxLongitude) * 2.0d) * 3.141592653589793d) * EarthRadius) / MapSize(levelOfDetail);
    }

    public static double MapScale(double latitude, int levelOfDetail, int screenDpi) {
        return (GroundResolution(latitude, levelOfDetail) * screenDpi) / 0.0254d;
    }

    public static Point LatLongToPixelXY(double latitude, double longitude, int levelOfDetail, Point reuse) {
        Point out = reuse == null ? new Point() : reuse;
        double latitude2 = Clip(latitude, MinLatitude, MaxLatitude);
        double x = (Clip(longitude, MinLongitude, MaxLongitude) + MaxLongitude) / 360.0d;
        double sinLatitude = Math.sin((latitude2 * 3.141592653589793d) / MaxLongitude);
        double y = 0.5d - (Math.log((1.0d + sinLatitude) / (1.0d - sinLatitude)) / 12.566370614359172d);
        int mapSize = MapSize(levelOfDetail);
        out.x = (int) Clip((x * mapSize) + 0.5d, 0.0d, mapSize - 1);
        out.y = (int) Clip((y * mapSize) + 0.5d, 0.0d, mapSize - 1);
        return out;
    }

    public static GeoPoint PixelXYToLatLong(int pixelX, int pixelY, int levelOfDetail, GeoPoint reuse) {
        GeoPoint out = reuse == null ? new GeoPoint(0, 0) : reuse;
        double mapSize = MapSize(levelOfDetail);
        double x = (Clip(pixelX, 0.0d, mapSize - 1.0d) / mapSize) - 0.5d;
        double y = 0.5d - (Clip(pixelY, 0.0d, mapSize - 1.0d) / mapSize);
        double latitude = 90.0d - ((360.0d * Math.atan(Math.exp(((-y) * 2.0d) * 3.141592653589793d))) / 3.141592653589793d);
        double longitude = 360.0d * x;
        out.setLatitudeE6((int) (latitude * 1000000.0d));
        out.setLongitudeE6((int) (longitude * 1000000.0d));
        return out;
    }

    public static Point PixelXYToTileXY(int pixelX, int pixelY, Point reuse) {
        Point out = reuse == null ? new Point() : reuse;
        out.x = pixelX / mTileSize;
        out.y = pixelY / mTileSize;
        return out;
    }

    public static Point TileXYToPixelXY(int tileX, int tileY, Point reuse) {
        Point out = reuse == null ? new Point() : reuse;
        out.x = tileX * mTileSize;
        out.y = tileY * mTileSize;
        return out;
    }

    public static String TileXYToQuadKey(int tileX, int tileY, int levelOfDetail) {
        StringBuilder quadKey = new StringBuilder();
        for (int i = levelOfDetail; i > 0; i--) {
            char digit = '0';
            int mask = 1 << (i - 1);
            if ((tileX & mask) != 0) {
                digit = (char) (48 + 1);
            }
            if ((tileY & mask) != 0) {
                digit = (char) (((char) (digit + 1)) + 1);
            }
            quadKey.append(digit);
        }
        return quadKey.toString();
    }

    public static Point QuadKeyToTileXY(String quadKey, Point reuse) {
        Point out = reuse == null ? new Point() : reuse;
        int tileX = 0;
        int tileY = 0;
        int levelOfDetail = quadKey.length();
        for (int i = levelOfDetail; i > 0; i--) {
            int mask = 1 << (i - 1);
            switch (quadKey.charAt(levelOfDetail - i)) {
                case '0':
                    break;
                case '1':
                    tileX |= mask;
                    break;
                case '2':
                    tileY |= mask;
                    break;
                case '3':
                    tileX |= mask;
                    tileY |= mask;
                    break;
                default:
                    throw new IllegalArgumentException("Invalid QuadKey digit sequence.");
            }
        }
        out.set(tileX, tileY);
        return out;
    }
}
