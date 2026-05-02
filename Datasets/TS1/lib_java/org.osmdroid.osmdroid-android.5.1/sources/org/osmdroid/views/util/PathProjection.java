package org.osmdroid.views.util;

import android.graphics.Path;
import android.graphics.Point;
import android.graphics.PointF;
import android.graphics.Rect;
import java.util.List;
import org.osmdroid.util.BoundingBoxE6;
import org.osmdroid.util.GeoPoint;
import org.osmdroid.util.TileSystem;
import org.osmdroid.views.Projection;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/views/util/PathProjection.class */
public class PathProjection {
    public static Path toPixels(Projection projection, List<? extends GeoPoint> in, Path reuse) {
        return toPixels(projection, in, reuse, true);
    }

    public static Path toPixels(Projection projection, List<? extends GeoPoint> in, Path reuse, boolean doGudermann) throws IllegalArgumentException {
        PointF relativePositionInCenterMapTile;
        if (in.size() < 2) {
            throw new IllegalArgumentException("List of GeoPoints needs to be at least 2.");
        }
        Path out = reuse != null ? reuse : new Path();
        out.incReserve(in.size());
        boolean first = true;
        for (GeoPoint gp : in) {
            Point underGeopointTileCoords = TileSystem.LatLongToPixelXY(gp.getLatitudeE6() / 1000000.0d, gp.getLongitudeE6() / 1000000.0d, projection.getZoomLevel(), null);
            TileSystem.PixelXYToTileXY(underGeopointTileCoords.x, underGeopointTileCoords.y, underGeopointTileCoords);
            Point upperRight = TileSystem.TileXYToPixelXY(underGeopointTileCoords.x, underGeopointTileCoords.y, null);
            Point lowerLeft = TileSystem.TileXYToPixelXY(underGeopointTileCoords.x + TileSystem.getTileSize(), underGeopointTileCoords.y + TileSystem.getTileSize(), null);
            GeoPoint neGeoPoint = TileSystem.PixelXYToLatLong(upperRight.x, upperRight.y, projection.getZoomLevel(), null);
            GeoPoint swGeoPoint = TileSystem.PixelXYToLatLong(lowerLeft.x, lowerLeft.y, projection.getZoomLevel(), null);
            BoundingBoxE6 bb = new BoundingBoxE6(neGeoPoint.getLatitudeE6(), neGeoPoint.getLongitudeE6(), swGeoPoint.getLatitudeE6(), swGeoPoint.getLongitudeE6());
            if (doGudermann && projection.getZoomLevel() < 7) {
                relativePositionInCenterMapTile = bb.getRelativePositionOfGeoPointInBoundingBoxWithExactGudermannInterpolation(gp.getLatitudeE6(), gp.getLongitudeE6(), null);
            } else {
                relativePositionInCenterMapTile = bb.getRelativePositionOfGeoPointInBoundingBoxWithLinearInterpolation(gp.getLatitudeE6(), gp.getLongitudeE6(), null);
            }
            Rect screenRect = projection.getScreenRect();
            Point centerMapTileCoords = TileSystem.PixelXYToTileXY(screenRect.centerX(), screenRect.centerY(), null);
            Point upperLeftCornerOfCenterMapTile = TileSystem.TileXYToPixelXY(centerMapTileCoords.x, centerMapTileCoords.y, null);
            int tileDiffX = centerMapTileCoords.x - underGeopointTileCoords.x;
            int tileDiffY = centerMapTileCoords.y - underGeopointTileCoords.y;
            int underGeopointTileScreenLeft = upperLeftCornerOfCenterMapTile.x - (TileSystem.getTileSize() * tileDiffX);
            int underGeopointTileScreenTop = upperLeftCornerOfCenterMapTile.y - (TileSystem.getTileSize() * tileDiffY);
            int x = underGeopointTileScreenLeft + ((int) (relativePositionInCenterMapTile.x * TileSystem.getTileSize()));
            int y = underGeopointTileScreenTop + ((int) (relativePositionInCenterMapTile.y * TileSystem.getTileSize()));
            if (first) {
                out.moveTo(x, y);
            } else {
                out.lineTo(x, y);
            }
            first = false;
        }
        return out;
    }
}
