package org.osmdroid.views;

import android.graphics.Matrix;
import android.graphics.Point;
import android.graphics.Rect;
import org.osmdroid.api.IGeoPoint;
import org.osmdroid.api.IProjection;
import org.osmdroid.util.BoundingBoxE6;
import org.osmdroid.util.GeoPoint;
import org.osmdroid.util.TileSystem;
import org.osmdroid.views.util.constants.MapViewConstants;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/views/Projection.class */
public class Projection implements IProjection, MapViewConstants {
    private final int mMapViewWidth;
    private final int mMapViewHeight;
    protected final int mOffsetX;
    protected final int mOffsetY;
    protected final float mMultiTouchScale;
    private final Matrix mRotateAndScaleMatrix = new Matrix();
    private final Matrix mUnrotateAndScaleMatrix = new Matrix();
    private final float[] mRotateScalePoints = new float[2];
    private final BoundingBoxE6 mBoundingBoxProjection;
    private final int mZoomLevelProjection;
    private final Rect mScreenRectProjection;
    private final Rect mIntrinsicScreenRectProjection;
    private final float mMapOrientation;

    Projection(MapView mapView) {
        this.mZoomLevelProjection = mapView.getZoomLevel(false);
        this.mScreenRectProjection = mapView.getScreenRect(null);
        this.mIntrinsicScreenRectProjection = mapView.getIntrinsicScreenRect(null);
        this.mMapOrientation = mapView.getMapOrientation();
        this.mMapViewWidth = mapView.getWidth();
        this.mMapViewHeight = mapView.getHeight();
        this.mOffsetX = -mapView.getScrollX();
        this.mOffsetY = -mapView.getScrollY();
        this.mRotateAndScaleMatrix.set(mapView.mRotateScaleMatrix);
        this.mRotateAndScaleMatrix.invert(this.mUnrotateAndScaleMatrix);
        this.mMultiTouchScale = mapView.mMultiTouchScale;
        IGeoPoint neGeoPoint = fromPixels(this.mMapViewWidth, 0, null);
        IGeoPoint swGeoPoint = fromPixels(0, this.mMapViewHeight, null);
        this.mBoundingBoxProjection = new BoundingBoxE6(neGeoPoint.getLatitudeE6(), neGeoPoint.getLongitudeE6(), swGeoPoint.getLatitudeE6(), swGeoPoint.getLongitudeE6());
    }

    public int getZoomLevel() {
        return this.mZoomLevelProjection;
    }

    public BoundingBoxE6 getBoundingBox() {
        return this.mBoundingBoxProjection;
    }

    public Rect getScreenRect() {
        return this.mScreenRectProjection;
    }

    public Rect getIntrinsicScreenRect() {
        return this.mIntrinsicScreenRectProjection;
    }

    public float getMapOrientation() {
        return this.mMapOrientation;
    }

    @Override // org.osmdroid.api.IProjection
    public IGeoPoint fromPixels(int x, int y) {
        return fromPixels(x, y, null);
    }

    public IGeoPoint fromPixels(int x, int y, GeoPoint reuse) {
        return TileSystem.PixelXYToLatLong(x - this.mOffsetX, y - this.mOffsetY, this.mZoomLevelProjection, reuse);
    }

    @Override // org.osmdroid.api.IProjection
    public Point toPixels(IGeoPoint in, Point reuse) {
        Point out = TileSystem.LatLongToPixelXY(in.getLatitude(), in.getLongitude(), getZoomLevel(), reuse);
        Point out2 = toPixelsFromMercator(out.x, out.y, out);
        return adjustForDateLine(out2.x, out2.y, out2);
    }

    protected Point adjustForDateLine(int x, int y, Point reuse) {
        Point out = reuse != null ? reuse : new Point();
        out.set(x, y);
        out.offset((-this.mMapViewWidth) / 2, (-this.mMapViewHeight) / 2);
        int mapSize = TileSystem.MapSize(getZoomLevel());
        int absX = Math.abs(out.x);
        int absY = Math.abs(out.y);
        if (absX > Math.abs(out.x - mapSize)) {
            out.x -= mapSize;
        }
        if (absX > Math.abs(out.x + mapSize)) {
            out.x += mapSize;
        }
        if (absY > Math.abs(out.y - mapSize)) {
            out.y -= mapSize;
        }
        if (absY > Math.abs(out.y + mapSize)) {
            out.y += mapSize;
        }
        out.offset(this.mMapViewWidth / 2, this.mMapViewHeight / 2);
        return out;
    }

    public Point toProjectedPixels(GeoPoint geoPoint, Point reuse) {
        return toProjectedPixels(geoPoint.getLatitudeE6(), geoPoint.getLongitudeE6(), reuse);
    }

    public Point toProjectedPixels(int latituteE6, int longitudeE6, Point reuse) {
        return TileSystem.LatLongToPixelXY(latituteE6 * 1.0E-6d, longitudeE6 * 1.0E-6d, microsoft.mappoint.TileSystem.getMaximumZoomLevel(), reuse);
    }

    public Point toPixelsFromProjected(Point in, Point reuse) {
        Point out = reuse != null ? reuse : new Point();
        int zoomDifference = microsoft.mappoint.TileSystem.getMaximumZoomLevel() - getZoomLevel();
        out.set(in.x >> zoomDifference, in.y >> zoomDifference);
        Point out2 = toPixelsFromMercator(out.x, out.y, out);
        return adjustForDateLine(out2.x, out2.y, out2);
    }

    public Point toPixelsFromMercator(int x, int y, Point reuse) {
        Point out = reuse != null ? reuse : new Point();
        out.set(x, y);
        out.offset(this.mOffsetX, this.mOffsetY);
        return out;
    }

    public Point toMercatorPixels(int x, int y, Point reuse) {
        Point out = reuse != null ? reuse : new Point();
        out.set(x, y);
        out.offset(-this.mOffsetX, -this.mOffsetY);
        return out;
    }

    @Override // org.osmdroid.api.IProjection
    public float metersToEquatorPixels(float meters) {
        return meters / ((float) TileSystem.GroundResolution(0.0d, this.mZoomLevelProjection));
    }

    public float metersToPixels(float meters) {
        return meters / ((float) TileSystem.GroundResolution(getBoundingBox().getCenter().getLatitude(), this.mZoomLevelProjection));
    }

    @Override // org.osmdroid.api.IProjection
    public IGeoPoint getNorthEast() {
        return fromPixels(this.mMapViewWidth, 0, null);
    }

    @Override // org.osmdroid.api.IProjection
    public IGeoPoint getSouthWest() {
        return fromPixels(0, this.mMapViewHeight, null);
    }

    public Matrix getInvertedScaleRotateCanvasMatrix() {
        return this.mUnrotateAndScaleMatrix;
    }

    public Point unrotateAndScalePoint(int x, int y, Point reuse) {
        if (reuse == null) {
            reuse = new Point();
        }
        if (getMapOrientation() != 0.0f || this.mMultiTouchScale != 1.0f) {
            this.mRotateScalePoints[0] = x;
            this.mRotateScalePoints[1] = y;
            this.mUnrotateAndScaleMatrix.mapPoints(this.mRotateScalePoints);
            reuse.set((int) this.mRotateScalePoints[0], (int) this.mRotateScalePoints[1]);
        } else {
            reuse.set(x, y);
        }
        return reuse;
    }

    public Point rotateAndScalePoint(int x, int y, Point reuse) {
        if (reuse == null) {
            reuse = new Point();
        }
        if (getMapOrientation() != 0.0f || this.mMultiTouchScale != 1.0f) {
            this.mRotateScalePoints[0] = x;
            this.mRotateScalePoints[1] = y;
            this.mRotateAndScaleMatrix.mapPoints(this.mRotateScalePoints);
            reuse.set((int) this.mRotateScalePoints[0], (int) this.mRotateScalePoints[1]);
        } else {
            reuse.set(x, y);
        }
        return reuse;
    }
}
