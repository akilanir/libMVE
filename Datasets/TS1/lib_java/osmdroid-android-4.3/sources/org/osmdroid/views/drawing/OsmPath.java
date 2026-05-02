package org.osmdroid.views.drawing;

import android.graphics.Path;
import android.graphics.Point;
import org.osmdroid.util.GeoPoint;
import org.osmdroid.views.Projection;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/views/drawing/OsmPath.class */
public class OsmPath extends Path {
    private static final GeoPoint sReferenceGeoPoint = new GeoPoint(0, 0);
    protected final Point mReferencePoint;
    private int mLastZoomLevel;

    public OsmPath() {
        this.mReferencePoint = new Point();
        this.mLastZoomLevel = -1;
    }

    public OsmPath(Path src) {
        super(src);
        this.mReferencePoint = new Point();
        this.mLastZoomLevel = -1;
    }

    public void onDrawCycle(Projection proj) {
        if (this.mLastZoomLevel != proj.getZoomLevel()) {
            proj.toPixels(sReferenceGeoPoint, this.mReferencePoint);
            this.mLastZoomLevel = proj.getZoomLevel();
        }
        int x = this.mReferencePoint.x;
        int y = this.mReferencePoint.y;
        proj.toPixels(sReferenceGeoPoint, this.mReferencePoint);
        int deltaX = this.mReferencePoint.x - x;
        int deltaY = this.mReferencePoint.y - y;
        offset(deltaX, deltaY);
    }
}
