package org.osmdroid.util;

import android.graphics.Point;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/util/TileSystem.class */
public final class TileSystem {
    public static void setTileSize(int tileSize) {
        microsoft.mappoint.TileSystem.setTileSize(tileSize);
    }

    public static int getTileSize() {
        return microsoft.mappoint.TileSystem.getTileSize();
    }

    public static int MapSize(int levelOfDetail) {
        return microsoft.mappoint.TileSystem.MapSize(levelOfDetail);
    }

    public static double GroundResolution(double latitude, int levelOfDetail) {
        return microsoft.mappoint.TileSystem.GroundResolution(wrap(latitude, -90.0d, 90.0d, 180.0d), levelOfDetail);
    }

    public static double MapScale(double latitude, int levelOfDetail, int screenDpi) {
        return microsoft.mappoint.TileSystem.MapScale(latitude, levelOfDetail, screenDpi);
    }

    public static Point LatLongToPixelXY(double latitude, double longitude, int levelOfDetail, Point reuse) {
        return microsoft.mappoint.TileSystem.LatLongToPixelXY(wrap(latitude, -90.0d, 90.0d, 180.0d), wrap(longitude, -180.0d, 180.0d, 360.0d), levelOfDetail, reuse);
    }

    public static GeoPoint PixelXYToLatLong(int pixelX, int pixelY, int levelOfDetail, GeoPoint reuse) {
        int mapSize = MapSize(levelOfDetail);
        return microsoft.mappoint.TileSystem.PixelXYToLatLong((int) wrap(pixelX, 0.0d, mapSize - 1, mapSize), (int) wrap(pixelY, 0.0d, mapSize - 1, mapSize), levelOfDetail, reuse);
    }

    public static Point PixelXYToTileXY(int pixelX, int pixelY, Point reuse) {
        return microsoft.mappoint.TileSystem.PixelXYToTileXY(pixelX, pixelY, reuse);
    }

    public static Point TileXYToPixelXY(int tileX, int tileY, Point reuse) {
        return microsoft.mappoint.TileSystem.TileXYToPixelXY(tileX, tileY, reuse);
    }

    public static String TileXYToQuadKey(int tileX, int tileY, int levelOfDetail) {
        return microsoft.mappoint.TileSystem.TileXYToQuadKey(tileX, tileY, levelOfDetail);
    }

    public static Point QuadKeyToTileXY(String quadKey, Point reuse) {
        return microsoft.mappoint.TileSystem.QuadKeyToTileXY(quadKey, reuse);
    }

    private static double wrap(double n, double minValue, double maxValue, double interval) {
        if (minValue > maxValue) {
            throw new IllegalArgumentException("minValue must be smaller than maxValue: " + minValue + ">" + maxValue);
        }
        if (interval > (maxValue - minValue) + 1.0d) {
            throw new IllegalArgumentException("interval must be equal or smaller than maxValue-minValue: min: " + minValue + " max:" + maxValue + " int:" + interval);
        }
        while (n < minValue) {
            n += interval;
        }
        while (n > maxValue) {
            n -= interval;
        }
        return n;
    }
}
