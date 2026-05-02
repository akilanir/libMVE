package org.osmdroid.views.overlay;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Point;
import org.osmdroid.DefaultResourceProxyImpl;
import org.osmdroid.ResourceProxy;
import org.osmdroid.util.GeoPoint;
import org.osmdroid.views.MapView;
import org.osmdroid.views.Projection;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/views/overlay/DirectedLocationOverlay.class */
public class DirectedLocationOverlay extends Overlay {
    protected final Paint mPaint;
    protected final Paint mAccuracyPaint;
    protected final Bitmap DIRECTION_ARROW;
    protected GeoPoint mLocation;
    protected float mBearing;
    private final Matrix directionRotater;
    private final Point screenCoords;
    private final float DIRECTION_ARROW_CENTER_X;
    private final float DIRECTION_ARROW_CENTER_Y;
    private final int DIRECTION_ARROW_WIDTH;
    private final int DIRECTION_ARROW_HEIGHT;
    private int mAccuracy;
    private boolean mShowAccuracy;

    public DirectedLocationOverlay(Context ctx) {
        this(ctx, new DefaultResourceProxyImpl(ctx));
    }

    public DirectedLocationOverlay(Context ctx, ResourceProxy pResourceProxy) {
        super(pResourceProxy);
        this.mPaint = new Paint();
        this.mAccuracyPaint = new Paint();
        this.directionRotater = new Matrix();
        this.screenCoords = new Point();
        this.mAccuracy = 0;
        this.mShowAccuracy = true;
        this.DIRECTION_ARROW = this.mResourceProxy.getBitmap(ResourceProxy.bitmap.direction_arrow);
        this.DIRECTION_ARROW_CENTER_X = (this.DIRECTION_ARROW.getWidth() / 2) - 0.5f;
        this.DIRECTION_ARROW_CENTER_Y = (this.DIRECTION_ARROW.getHeight() / 2) - 0.5f;
        this.DIRECTION_ARROW_HEIGHT = this.DIRECTION_ARROW.getHeight();
        this.DIRECTION_ARROW_WIDTH = this.DIRECTION_ARROW.getWidth();
        this.mAccuracyPaint.setStrokeWidth(2.0f);
        this.mAccuracyPaint.setColor(-16776961);
        this.mAccuracyPaint.setAntiAlias(true);
    }

    public void setShowAccuracy(boolean pShowIt) {
        this.mShowAccuracy = pShowIt;
    }

    public void setLocation(GeoPoint mp) {
        this.mLocation = mp;
    }

    public GeoPoint getLocation() {
        return this.mLocation;
    }

    public void setAccuracy(int pAccuracy) {
        this.mAccuracy = pAccuracy;
    }

    public void setBearing(float aHeading) {
        this.mBearing = aHeading;
    }

    @Override // org.osmdroid.views.overlay.Overlay
    public void draw(Canvas c, MapView osmv, boolean shadow) {
        if (!shadow && this.mLocation != null) {
            Projection pj = osmv.getProjection();
            pj.toPixels(this.mLocation, this.screenCoords);
            if (this.mShowAccuracy && this.mAccuracy > 10) {
                float accuracyRadius = pj.metersToEquatorPixels(this.mAccuracy);
                if (accuracyRadius > 8.0f) {
                    this.mAccuracyPaint.setAntiAlias(false);
                    this.mAccuracyPaint.setAlpha(30);
                    this.mAccuracyPaint.setStyle(Paint.Style.FILL);
                    c.drawCircle(this.screenCoords.x, this.screenCoords.y, accuracyRadius, this.mAccuracyPaint);
                    this.mAccuracyPaint.setAntiAlias(true);
                    this.mAccuracyPaint.setAlpha(150);
                    this.mAccuracyPaint.setStyle(Paint.Style.STROKE);
                    c.drawCircle(this.screenCoords.x, this.screenCoords.y, accuracyRadius, this.mAccuracyPaint);
                }
            }
            this.directionRotater.setRotate(this.mBearing, this.DIRECTION_ARROW_CENTER_X, this.DIRECTION_ARROW_CENTER_Y);
            Bitmap rotatedDirection = Bitmap.createBitmap(this.DIRECTION_ARROW, 0, 0, this.DIRECTION_ARROW_WIDTH, this.DIRECTION_ARROW_HEIGHT, this.directionRotater, false);
            c.drawBitmap(rotatedDirection, this.screenCoords.x - (rotatedDirection.getWidth() / 2), this.screenCoords.y - (rotatedDirection.getHeight() / 2), this.mPaint);
        }
    }
}
