package org.osmdroid.views.overlay;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Point;
import android.graphics.Rect;
import java.util.ArrayList;
import java.util.List;
import org.osmdroid.DefaultResourceProxyImpl;
import org.osmdroid.ResourceProxy;
import org.osmdroid.api.IGeoPoint;
import org.osmdroid.util.BoundingBoxE6;
import org.osmdroid.util.GeoPoint;
import org.osmdroid.views.MapView;
import org.osmdroid.views.Projection;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/views/overlay/PathOverlay.class */
public class PathOverlay extends Overlay {
    private ArrayList<Point> mPoints;
    private int mPointsPrecomputed;
    protected Paint mPaint;
    private final Path mPath;
    private final Point mTempPoint1;
    private final Point mTempPoint2;
    private final Rect mLineBounds;

    public PathOverlay(int color, Context ctx) {
        this(color, 2.0f, new DefaultResourceProxyImpl(ctx));
    }

    public PathOverlay(int color, ResourceProxy resourceProxy) {
        this(color, 2.0f, resourceProxy);
    }

    public PathOverlay(int color, float width, ResourceProxy resourceProxy) {
        super(resourceProxy);
        this.mPaint = new Paint();
        this.mPath = new Path();
        this.mTempPoint1 = new Point();
        this.mTempPoint2 = new Point();
        this.mLineBounds = new Rect();
        this.mPaint.setColor(color);
        this.mPaint.setStrokeWidth(width);
        this.mPaint.setStyle(Paint.Style.STROKE);
        clearPath();
    }

    public void setColor(int color) {
        this.mPaint.setColor(color);
    }

    public void setAlpha(int a) {
        this.mPaint.setAlpha(a);
    }

    public void addGreatCircle(GeoPoint startPoint, GeoPoint endPoint) {
        int greatCircleLength = startPoint.distanceTo(endPoint);
        int numberOfPoints = greatCircleLength / 100000;
        addGreatCircle(startPoint, endPoint, numberOfPoints);
    }

    public void addGreatCircle(GeoPoint startPoint, GeoPoint endPoint, int numberOfPoints) {
        double lat1 = (startPoint.getLatitude() * 3.141592653589793d) / 180.0d;
        double lon1 = (startPoint.getLongitude() * 3.141592653589793d) / 180.0d;
        double lat2 = (endPoint.getLatitude() * 3.141592653589793d) / 180.0d;
        double lon2 = (endPoint.getLongitude() * 3.141592653589793d) / 180.0d;
        double d = 2.0d * Math.asin(Math.sqrt(Math.pow(Math.sin((lat1 - lat2) / 2.0d), 2.0d) + (Math.cos(lat1) * Math.cos(lat2) * Math.pow(Math.sin((lon1 - lon2) / 2.0d), 2.0d))));
        double bearing = Math.atan2(Math.sin(lon1 - lon2) * Math.cos(lat2), (Math.cos(lat1) * Math.sin(lat2)) - ((Math.sin(lat1) * Math.cos(lat2)) * Math.cos(lon1 - lon2))) / (-0.017453292519943295d);
        double d2 = bearing < 0.0d ? 360.0d + bearing : bearing;
        int j = numberOfPoints + 1;
        for (int i = 0; i < j; i++) {
            double f = (1.0d / numberOfPoints) * i;
            double A = Math.sin((1.0d - f) * d) / Math.sin(d);
            double B = Math.sin(f * d) / Math.sin(d);
            double x = (A * Math.cos(lat1) * Math.cos(lon1)) + (B * Math.cos(lat2) * Math.cos(lon2));
            double y = (A * Math.cos(lat1) * Math.sin(lon1)) + (B * Math.cos(lat2) * Math.sin(lon2));
            double z = (A * Math.sin(lat1)) + (B * Math.sin(lat2));
            double latN = Math.atan2(z, Math.sqrt(Math.pow(x, 2.0d) + Math.pow(y, 2.0d)));
            double lonN = Math.atan2(y, x);
            addPoint((int) ((latN / 0.017453292519943295d) * 1000000.0d), (int) ((lonN / 0.017453292519943295d) * 1000000.0d));
        }
    }

    public Paint getPaint() {
        return this.mPaint;
    }

    public void setPaint(Paint pPaint) {
        if (pPaint == null) {
            throw new IllegalArgumentException("pPaint argument cannot be null");
        }
        this.mPaint = pPaint;
    }

    public void clearPath() {
        this.mPoints = new ArrayList<>();
        this.mPointsPrecomputed = 0;
    }

    public void addPoint(IGeoPoint aPoint) {
        addPoint(aPoint.getLatitudeE6(), aPoint.getLongitudeE6());
    }

    public void addPoint(int aLatitudeE6, int aLongitudeE6) {
        this.mPoints.add(new Point(aLatitudeE6, aLongitudeE6));
    }

    public void addPoints(IGeoPoint... aPoints) {
        for (IGeoPoint point : aPoints) {
            addPoint(point);
        }
    }

    public void addPoints(List<IGeoPoint> aPoints) {
        for (IGeoPoint point : aPoints) {
            addPoint(point);
        }
    }

    public int getNumberOfPoints() {
        return this.mPoints.size();
    }

    @Override // org.osmdroid.views.overlay.Overlay
    protected void draw(Canvas canvas, MapView mapView, boolean shadow) {
        int size;
        if (shadow || (size = this.mPoints.size()) < 2) {
            return;
        }
        Projection pj = mapView.getProjection();
        while (this.mPointsPrecomputed < size) {
            Point pt = this.mPoints.get(this.mPointsPrecomputed);
            pj.toProjectedPixels(pt.x, pt.y, pt);
            this.mPointsPrecomputed++;
        }
        Point screenPoint0 = null;
        BoundingBoxE6 boundingBox = pj.getBoundingBox();
        Point topLeft = pj.toProjectedPixels(boundingBox.getLatNorthE6(), boundingBox.getLonWestE6(), null);
        Point bottomRight = pj.toProjectedPixels(boundingBox.getLatSouthE6(), boundingBox.getLonEastE6(), null);
        Rect clipBounds = new Rect(topLeft.x, topLeft.y, bottomRight.x, bottomRight.y);
        this.mPath.rewind();
        Point projectedPoint0 = this.mPoints.get(size - 1);
        this.mLineBounds.set(projectedPoint0.x, projectedPoint0.y, projectedPoint0.x, projectedPoint0.y);
        for (int i = size - 2; i >= 0; i--) {
            Point projectedPoint1 = this.mPoints.get(i);
            this.mLineBounds.union(projectedPoint1.x, projectedPoint1.y);
            if (!Rect.intersects(clipBounds, this.mLineBounds)) {
                projectedPoint0 = projectedPoint1;
                screenPoint0 = null;
            } else {
                if (screenPoint0 == null) {
                    screenPoint0 = pj.toPixelsFromProjected(projectedPoint0, this.mTempPoint1);
                    this.mPath.moveTo(screenPoint0.x, screenPoint0.y);
                }
                Point screenPoint1 = pj.toPixelsFromProjected(projectedPoint1, this.mTempPoint2);
                if (Math.abs(screenPoint1.x - screenPoint0.x) + Math.abs(screenPoint1.y - screenPoint0.y) > 1) {
                    this.mPath.lineTo(screenPoint1.x, screenPoint1.y);
                    projectedPoint0 = projectedPoint1;
                    screenPoint0.x = screenPoint1.x;
                    screenPoint0.y = screenPoint1.y;
                    this.mLineBounds.set(projectedPoint0.x, projectedPoint0.y, projectedPoint0.x, projectedPoint0.y);
                }
            }
        }
        canvas.drawPath(this.mPath, this.mPaint);
    }
}
