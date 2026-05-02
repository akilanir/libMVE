package org.osmdroid.views.overlay;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Picture;
import android.graphics.Point;
import android.graphics.PointF;
import android.graphics.Rect;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Bundle;
import android.view.Display;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.WindowManager;
import java.util.Iterator;
import java.util.LinkedList;
import org.osmdroid.DefaultResourceProxyImpl;
import org.osmdroid.LocationListenerProxy;
import org.osmdroid.ResourceProxy;
import org.osmdroid.SensorEventListenerProxy;
import org.osmdroid.api.IMapController;
import org.osmdroid.api.IMapView;
import org.osmdroid.api.IMyLocationOverlay;
import org.osmdroid.util.GeoPoint;
import org.osmdroid.util.LocationUtils;
import org.osmdroid.util.NetworkLocationIgnorer;
import org.osmdroid.util.TileSystem;
import org.osmdroid.views.MapView;
import org.osmdroid.views.Projection;
import org.osmdroid.views.overlay.Overlay;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/* loaded from: osmdroid-android-4.2.jar:org/osmdroid/views/overlay/MyLocationOverlay.class */
public class MyLocationOverlay extends Overlay implements IMyLocationOverlay, IOverlayMenuProvider, SensorEventListener, LocationListener, Overlay.Snappable {
    protected final Paint mPaint;
    protected final Paint mCirclePaint;
    protected final Bitmap PERSON_ICON;
    protected final Bitmap DIRECTION_ARROW;
    protected final MapView mMapView;
    private final IMapController mMapController;
    private final LocationManager mLocationManager;
    private final SensorManager mSensorManager;
    private final Display mDisplay;
    public LocationListenerProxy mLocationListener;
    public SensorEventListenerProxy mSensorListener;
    private final LinkedList<Runnable> mRunOnFirstFix;
    private final Point mMapCoords;
    private Location mLocation;
    private final GeoPoint mGeoPoint;
    private long mLocationUpdateMinTime;
    private float mLocationUpdateMinDistance;
    protected boolean mFollow;
    protected boolean mDrawAccuracyEnabled;
    private final NetworkLocationIgnorer mIgnorer;
    private final Matrix directionRotater;
    protected final PointF PERSON_HOTSPOT;
    protected final float DIRECTION_ARROW_CENTER_X;
    protected final float DIRECTION_ARROW_CENTER_Y;
    protected final Picture mCompassFrame;
    protected final Picture mCompassRose;
    private final Matrix mCompassMatrix;
    private float mAzimuth;
    private float mCompassCenterX;
    private float mCompassCenterY;
    private final float mCompassRadius = 20.0f;
    protected final float COMPASS_FRAME_CENTER_X;
    protected final float COMPASS_FRAME_CENTER_Y;
    protected final float COMPASS_ROSE_CENTER_X;
    protected final float COMPASS_ROSE_CENTER_Y;
    private boolean mOptionsMenuEnabled;
    private final float[] mMatrixValues;
    private final Matrix mMatrix;
    private final Rect mMyLocationRect;
    private final Rect mMyLocationPreviousRect;
    private static final Logger logger = LoggerFactory.getLogger(MyLocationOverlay.class);
    public static final int MENU_MY_LOCATION = getSafeMenuId();
    public static final int MENU_COMPASS = getSafeMenuId();

    public MyLocationOverlay(Context ctx, MapView mapView) {
        this(ctx, mapView, new DefaultResourceProxyImpl(ctx));
    }

    public MyLocationOverlay(Context ctx, MapView mapView, ResourceProxy pResourceProxy) {
        super(pResourceProxy);
        this.mPaint = new Paint();
        this.mCirclePaint = new Paint();
        this.mLocationListener = null;
        this.mSensorListener = null;
        this.mRunOnFirstFix = new LinkedList<>();
        this.mMapCoords = new Point();
        this.mGeoPoint = new GeoPoint(0, 0);
        this.mLocationUpdateMinTime = 0L;
        this.mLocationUpdateMinDistance = 0.0f;
        this.mFollow = false;
        this.mDrawAccuracyEnabled = true;
        this.mIgnorer = new NetworkLocationIgnorer();
        this.directionRotater = new Matrix();
        this.mCompassFrame = new Picture();
        this.mCompassRose = new Picture();
        this.mCompassMatrix = new Matrix();
        this.mAzimuth = Float.NaN;
        this.mCompassCenterX = 35.0f;
        this.mCompassCenterY = 35.0f;
        this.mCompassRadius = 20.0f;
        this.mOptionsMenuEnabled = true;
        this.mMatrixValues = new float[9];
        this.mMatrix = new Matrix();
        this.mMyLocationRect = new Rect();
        this.mMyLocationPreviousRect = new Rect();
        this.mMapView = mapView;
        this.mLocationManager = (LocationManager) ctx.getSystemService("location");
        this.mSensorManager = (SensorManager) ctx.getSystemService("sensor");
        WindowManager windowManager = (WindowManager) ctx.getSystemService("window");
        this.mDisplay = windowManager.getDefaultDisplay();
        this.mMapController = mapView.getController();
        this.mCirclePaint.setARGB(0, 100, 100, 255);
        this.mCirclePaint.setAntiAlias(true);
        this.PERSON_ICON = this.mResourceProxy.getBitmap(ResourceProxy.bitmap.person);
        this.DIRECTION_ARROW = this.mResourceProxy.getBitmap(ResourceProxy.bitmap.direction_arrow);
        this.DIRECTION_ARROW_CENTER_X = (this.DIRECTION_ARROW.getWidth() / 2) - 0.5f;
        this.DIRECTION_ARROW_CENTER_Y = (this.DIRECTION_ARROW.getHeight() / 2) - 0.5f;
        this.PERSON_HOTSPOT = new PointF((24.0f * this.mScale) + 0.5f, (39.0f * this.mScale) + 0.5f);
        createCompassFramePicture();
        createCompassRosePicture();
        this.COMPASS_FRAME_CENTER_X = (this.mCompassFrame.getWidth() / 2) - 0.5f;
        this.COMPASS_FRAME_CENTER_Y = (this.mCompassFrame.getHeight() / 2) - 0.5f;
        this.COMPASS_ROSE_CENTER_X = (this.mCompassRose.getWidth() / 2) - 0.5f;
        this.COMPASS_ROSE_CENTER_Y = (this.mCompassRose.getHeight() / 2) - 0.5f;
    }

    private void invalidateCompass() {
        Rect screenRect = this.mMapView.getProjection().getScreenRect();
        int frameLeft = screenRect.left + (this.mMapView.getWidth() / 2) + ((int) Math.ceil((this.mCompassCenterX - this.COMPASS_FRAME_CENTER_X) * this.mScale));
        int frameTop = screenRect.top + (this.mMapView.getHeight() / 2) + ((int) Math.ceil((this.mCompassCenterY - this.COMPASS_FRAME_CENTER_Y) * this.mScale));
        int frameRight = screenRect.left + (this.mMapView.getWidth() / 2) + ((int) Math.ceil((this.mCompassCenterX + this.COMPASS_FRAME_CENTER_X) * this.mScale));
        int frameBottom = screenRect.top + (this.mMapView.getHeight() / 2) + ((int) Math.ceil((this.mCompassCenterY + this.COMPASS_FRAME_CENTER_Y) * this.mScale));
        this.mMapView.postInvalidate(frameLeft - 2, frameTop - 2, frameRight + 2, frameBottom + 2);
    }

    public long getLocationUpdateMinTime() {
        return this.mLocationUpdateMinTime;
    }

    public void setLocationUpdateMinTime(long milliSeconds) {
        this.mLocationUpdateMinTime = milliSeconds;
    }

    public float getLocationUpdateMinDistance() {
        return this.mLocationUpdateMinDistance;
    }

    public void setLocationUpdateMinDistance(float meters) {
        this.mLocationUpdateMinDistance = meters;
    }

    public void setCompassCenter(float x, float y) {
        this.mCompassCenterX = x;
        this.mCompassCenterY = y;
    }

    public void setDrawAccuracyEnabled(boolean drawAccuracyEnabled) {
        this.mDrawAccuracyEnabled = drawAccuracyEnabled;
    }

    public boolean isDrawAccuracyEnabled() {
        return this.mDrawAccuracyEnabled;
    }

    protected void drawMyLocation(Canvas canvas, MapView mapView, Location lastFix) {
        Projection pj = mapView.getProjection();
        int zoomDiff = 22 - pj.getZoomLevel();
        if (this.mDrawAccuracyEnabled) {
            float radius = lastFix.getAccuracy() / ((float) TileSystem.GroundResolution(lastFix.getLatitude(), mapView.getZoomLevel()));
            this.mCirclePaint.setAlpha(50);
            this.mCirclePaint.setStyle(Paint.Style.FILL);
            canvas.drawCircle(this.mMapCoords.x >> zoomDiff, this.mMapCoords.y >> zoomDiff, radius, this.mCirclePaint);
            this.mCirclePaint.setAlpha(150);
            this.mCirclePaint.setStyle(Paint.Style.STROKE);
            canvas.drawCircle(this.mMapCoords.x >> zoomDiff, this.mMapCoords.y >> zoomDiff, radius, this.mCirclePaint);
        }
        canvas.getMatrix(this.mMatrix);
        this.mMatrix.getValues(this.mMatrixValues);
        if (lastFix.hasBearing()) {
            this.directionRotater.setRotate(lastFix.getBearing(), this.DIRECTION_ARROW_CENTER_X, this.DIRECTION_ARROW_CENTER_Y);
            this.directionRotater.postTranslate(-this.DIRECTION_ARROW_CENTER_X, -this.DIRECTION_ARROW_CENTER_Y);
            this.directionRotater.postScale(1.0f / this.mMatrixValues[0], 1.0f / this.mMatrixValues[4]);
            this.directionRotater.postTranslate(this.mMapCoords.x >> zoomDiff, this.mMapCoords.y >> zoomDiff);
            canvas.drawBitmap(this.DIRECTION_ARROW, this.directionRotater, this.mPaint);
            return;
        }
        this.directionRotater.setTranslate(-this.PERSON_HOTSPOT.x, -this.PERSON_HOTSPOT.y);
        this.directionRotater.postScale(1.0f / this.mMatrixValues[0], 1.0f / this.mMatrixValues[4]);
        this.directionRotater.postTranslate(this.mMapCoords.x >> zoomDiff, this.mMapCoords.y >> zoomDiff);
        canvas.drawBitmap(this.PERSON_ICON, this.directionRotater, this.mPaint);
    }

    protected Rect getMyLocationDrawingBounds(int zoomLevel, Location lastFix, Rect reuse) {
        if (reuse == null) {
            reuse = new Rect();
        }
        int zoomDiff = 22 - zoomLevel;
        int posX = this.mMapCoords.x >> zoomDiff;
        int posY = this.mMapCoords.y >> zoomDiff;
        if (lastFix.hasBearing()) {
            int widestEdge = (int) Math.ceil(Math.max(this.DIRECTION_ARROW.getWidth(), this.DIRECTION_ARROW.getHeight()) * Math.sqrt(2.0d));
            reuse.set(posX, posY, posX + widestEdge, posY + widestEdge);
            reuse.offset((-widestEdge) / 2, (-widestEdge) / 2);
        } else {
            reuse.set(posX, posY, posX + this.PERSON_ICON.getWidth(), posY + this.PERSON_ICON.getHeight());
            reuse.offset((int) (-this.PERSON_HOTSPOT.x), (int) (-this.PERSON_HOTSPOT.y));
        }
        if (this.mDrawAccuracyEnabled) {
            int radius = (int) Math.ceil(lastFix.getAccuracy() / ((float) TileSystem.GroundResolution(lastFix.getLatitude(), zoomLevel)));
            reuse.union(posX - radius, posY - radius, posX + radius, posY + radius);
            int strokeWidth = (int) Math.ceil(this.mCirclePaint.getStrokeWidth() == 0.0f ? 1.0d : this.mCirclePaint.getStrokeWidth());
            reuse.inset(-strokeWidth, -strokeWidth);
        }
        reuse.offset(this.mMapView.getWidth() / 2, this.mMapView.getHeight() / 2);
        return reuse;
    }

    protected void drawCompass(Canvas canvas, float bearing, Rect screenRect) {
        float centerX = this.mCompassCenterX * this.mScale;
        float centerY = (this.mCompassCenterY * this.mScale) + (canvas.getHeight() - this.mMapView.getHeight());
        this.mCompassMatrix.setTranslate(-this.COMPASS_FRAME_CENTER_X, -this.COMPASS_FRAME_CENTER_Y);
        this.mCompassMatrix.postTranslate(centerX, centerY);
        canvas.save();
        canvas.setMatrix(this.mCompassMatrix);
        canvas.drawPicture(this.mCompassFrame);
        this.mCompassMatrix.setRotate(-bearing, this.COMPASS_ROSE_CENTER_X, this.COMPASS_ROSE_CENTER_Y);
        this.mCompassMatrix.postTranslate(-this.COMPASS_ROSE_CENTER_X, -this.COMPASS_ROSE_CENTER_Y);
        this.mCompassMatrix.postTranslate(centerX, centerY);
        canvas.setMatrix(this.mCompassMatrix);
        canvas.drawPicture(this.mCompassRose);
        canvas.restore();
    }

    @Override // org.osmdroid.views.overlay.Overlay
    public void draw(Canvas canvas, MapView mapView, boolean shadow) {
        if (shadow) {
            return;
        }
        if (this.mLocation != null) {
            drawMyLocation(canvas, mapView, this.mLocation);
        }
        if (isCompassEnabled() && !Float.isNaN(this.mAzimuth)) {
            drawCompass(canvas, this.mAzimuth + getDisplayOrientation(), mapView.getProjection().getScreenRect());
        }
    }

    @Override // android.location.LocationListener
    public void onLocationChanged(Location location) {
        if (this.mIgnorer.shouldIgnore(location.getProvider(), System.currentTimeMillis())) {
            logger.debug("Ignore temporary non-gps location");
            return;
        }
        Location oldLocation = this.mLocation;
        if (oldLocation != null) {
            getMyLocationDrawingBounds(this.mMapView.getZoomLevel(), oldLocation, this.mMyLocationPreviousRect);
        }
        this.mLocation = location;
        TileSystem.LatLongToPixelXY(location.getLatitude(), location.getLongitude(), 22, this.mMapCoords);
        int worldSize_2 = TileSystem.MapSize(22) / 2;
        this.mMapCoords.offset(-worldSize_2, -worldSize_2);
        if (this.mFollow) {
            this.mGeoPoint.setLatitudeE6((int) (this.mLocation.getLatitude() * 1000000.0d));
            this.mGeoPoint.setLongitudeE6((int) (this.mLocation.getLongitude() * 1000000.0d));
            this.mMapController.animateTo(this.mGeoPoint);
        } else if (this.mLocation != null) {
            getMyLocationDrawingBounds(this.mMapView.getZoomLevel(), this.mLocation, this.mMyLocationRect);
            if (oldLocation != null) {
                this.mMyLocationRect.union(this.mMyLocationPreviousRect);
            }
            this.mMapView.postInvalidate(this.mMyLocationRect.left, this.mMyLocationRect.top, this.mMyLocationRect.right, this.mMyLocationRect.bottom);
        }
        Iterator i$ = this.mRunOnFirstFix.iterator();
        while (i$.hasNext()) {
            Runnable runnable = i$.next();
            new Thread(runnable).start();
        }
        this.mRunOnFirstFix.clear();
    }

    @Override // android.location.LocationListener
    public void onProviderDisabled(String provider) {
    }

    @Override // android.location.LocationListener
    public void onProviderEnabled(String provider) {
    }

    @Override // org.osmdroid.api.IMyLocationOverlay, android.location.LocationListener
    public void onStatusChanged(String provider, int status, Bundle extras) {
    }

    @Override // org.osmdroid.views.overlay.Overlay.Snappable
    public boolean onSnapToItem(int x, int y, Point snapPoint, IMapView mapView) {
        if (this.mLocation != null) {
            snapPoint.x = this.mMapCoords.x;
            snapPoint.y = this.mMapCoords.y;
            double xDiff = x - this.mMapCoords.x;
            double yDiff = y - this.mMapCoords.y;
            boolean snap = (xDiff * xDiff) + (yDiff * yDiff) < 64.0d;
            return snap;
        }
        return false;
    }

    @Override // org.osmdroid.views.overlay.Overlay
    public boolean onTouchEvent(MotionEvent event, MapView mapView) {
        if (event.getAction() == 2) {
            disableFollowLocation();
        }
        return super.onTouchEvent(event, mapView);
    }

    @Override // android.hardware.SensorEventListener
    public void onAccuracyChanged(Sensor arg0, int arg1) {
    }

    @Override // android.hardware.SensorEventListener
    public void onSensorChanged(SensorEvent event) {
        if (event.sensor.getType() == 3 && event.values != null) {
            this.mAzimuth = event.values[0];
            invalidateCompass();
        }
    }

    @Override // org.osmdroid.views.overlay.IOverlayMenuProvider
    public void setOptionsMenuEnabled(boolean pOptionsMenuEnabled) {
        this.mOptionsMenuEnabled = pOptionsMenuEnabled;
    }

    @Override // org.osmdroid.views.overlay.IOverlayMenuProvider
    public boolean isOptionsMenuEnabled() {
        return this.mOptionsMenuEnabled;
    }

    @Override // org.osmdroid.views.overlay.IOverlayMenuProvider
    public boolean onCreateOptionsMenu(Menu pMenu, int pMenuIdOffset, MapView pMapView) {
        pMenu.add(0, MENU_MY_LOCATION + pMenuIdOffset, 0, this.mResourceProxy.getString(ResourceProxy.string.my_location)).setIcon(this.mResourceProxy.getDrawable(ResourceProxy.bitmap.ic_menu_mylocation));
        pMenu.add(0, MENU_COMPASS + pMenuIdOffset, 0, this.mResourceProxy.getString(ResourceProxy.string.compass)).setIcon(this.mResourceProxy.getDrawable(ResourceProxy.bitmap.ic_menu_compass));
        return true;
    }

    @Override // org.osmdroid.views.overlay.IOverlayMenuProvider
    public boolean onPrepareOptionsMenu(Menu pMenu, int pMenuIdOffset, MapView pMapView) {
        return false;
    }

    @Override // org.osmdroid.views.overlay.IOverlayMenuProvider
    public boolean onOptionsItemSelected(MenuItem pItem, int pMenuIdOffset, MapView pMapView) {
        int menuId = pItem.getItemId() - pMenuIdOffset;
        if (menuId == MENU_MY_LOCATION) {
            if (isMyLocationEnabled()) {
                disableFollowLocation();
                disableMyLocation();
                return true;
            }
            enableFollowLocation();
            enableMyLocation();
            return true;
        }
        if (menuId == MENU_COMPASS) {
            if (isCompassEnabled()) {
                disableCompass();
                return true;
            }
            enableCompass();
            return true;
        }
        return false;
    }

    public GeoPoint getMyLocation() {
        if (this.mLocation == null) {
            return null;
        }
        return new GeoPoint(this.mLocation);
    }

    @Override // org.osmdroid.api.IMyLocationOverlay
    public Location getLastFix() {
        return this.mLocation;
    }

    @Deprecated
    public void followLocation(boolean follow) {
        if (follow) {
            enableFollowLocation();
        } else {
            disableFollowLocation();
        }
    }

    public void enableFollowLocation() {
        this.mFollow = true;
        if (isMyLocationEnabled()) {
            this.mLocation = LocationUtils.getLastKnownLocation(this.mLocationManager);
            if (this.mLocation != null) {
                TileSystem.LatLongToPixelXY(this.mLocation.getLatitude(), this.mLocation.getLongitude(), 22, this.mMapCoords);
                int worldSize_2 = TileSystem.MapSize(22) / 2;
                this.mMapCoords.offset(-worldSize_2, -worldSize_2);
                this.mMapController.animateTo(new GeoPoint(this.mLocation));
            }
        }
        if (this.mMapView != null) {
            this.mMapView.postInvalidate();
        }
    }

    public void disableFollowLocation() {
        this.mFollow = false;
    }

    public boolean isFollowLocationEnabled() {
        return this.mFollow;
    }

    @Override // org.osmdroid.api.IMyLocationOverlay
    public boolean enableMyLocation() {
        boolean result = true;
        if (this.mLocationListener == null) {
            this.mLocationListener = new LocationListenerProxy(this.mLocationManager);
            result = this.mLocationListener.startListening(this, this.mLocationUpdateMinTime, this.mLocationUpdateMinDistance);
        }
        if (isFollowLocationEnabled()) {
            this.mLocation = LocationUtils.getLastKnownLocation(this.mLocationManager);
            if (this.mLocation != null) {
                TileSystem.LatLongToPixelXY(this.mLocation.getLatitude(), this.mLocation.getLongitude(), 22, this.mMapCoords);
                int worldSize_2 = TileSystem.MapSize(22) / 2;
                this.mMapCoords.offset(-worldSize_2, -worldSize_2);
                this.mMapController.animateTo(new GeoPoint(this.mLocation));
            }
        }
        if (this.mMapView != null) {
            this.mMapView.postInvalidate();
        }
        return result;
    }

    @Override // org.osmdroid.api.IMyLocationOverlay
    public void disableMyLocation() {
        if (this.mLocationListener != null) {
            this.mLocationListener.stopListening();
        }
        this.mLocationListener = null;
        if (this.mMapView != null) {
            this.mMapView.postInvalidate();
        }
    }

    @Override // org.osmdroid.api.IMyLocationOverlay
    public boolean isMyLocationEnabled() {
        return this.mLocationListener != null;
    }

    @Override // org.osmdroid.api.IMyLocationOverlay
    public boolean enableCompass() {
        boolean result = true;
        if (this.mSensorListener == null) {
            this.mSensorListener = new SensorEventListenerProxy(this.mSensorManager);
            result = this.mSensorListener.startListening(this, 3, 2);
        }
        if (this.mMapView != null) {
            invalidateCompass();
        }
        return result;
    }

    @Override // org.osmdroid.api.IMyLocationOverlay
    public void disableCompass() {
        if (this.mSensorListener != null) {
            this.mSensorListener.stopListening();
        }
        this.mSensorListener = null;
        this.mAzimuth = Float.NaN;
        if (this.mMapView != null) {
            invalidateCompass();
        }
    }

    @Override // org.osmdroid.api.IMyLocationOverlay
    public boolean isCompassEnabled() {
        return this.mSensorListener != null;
    }

    @Override // org.osmdroid.api.IMyLocationOverlay
    public float getOrientation() {
        return this.mAzimuth;
    }

    @Override // org.osmdroid.api.IMyLocationOverlay
    public boolean runOnFirstFix(Runnable runnable) {
        if (this.mLocationListener != null && this.mLocation != null) {
            new Thread(runnable).start();
            return true;
        }
        this.mRunOnFirstFix.addLast(runnable);
        return false;
    }

    private Point calculatePointOnCircle(float centerX, float centerY, float radius, float degrees) {
        double dblRadians = Math.toRadians((-degrees) + 90.0f);
        int intX = (int) (radius * Math.cos(dblRadians));
        int intY = (int) (radius * Math.sin(dblRadians));
        return new Point(((int) centerX) + intX, ((int) centerY) - intY);
    }

    private void drawTriangle(Canvas canvas, float x, float y, float radius, float degrees, Paint paint) {
        canvas.save();
        Point point = calculatePointOnCircle(x, y, radius, degrees);
        canvas.rotate(degrees, point.x, point.y);
        Path p = new Path();
        p.moveTo(point.x - (2.0f * this.mScale), point.y);
        p.lineTo(point.x + (2.0f * this.mScale), point.y);
        p.lineTo(point.x, point.y - (5.0f * this.mScale));
        p.close();
        canvas.drawPath(p, paint);
        canvas.restore();
    }

    private int getDisplayOrientation() {
        switch (this.mDisplay.getOrientation()) {
            case 1:
                return 90;
            case 2:
                return 180;
            case 3:
                return 270;
            default:
                return 0;
        }
    }

    private void createCompassFramePicture() {
        Paint innerPaint = new Paint();
        innerPaint.setColor(-1);
        innerPaint.setAntiAlias(true);
        innerPaint.setStyle(Paint.Style.FILL);
        innerPaint.setAlpha(200);
        Paint outerPaint = new Paint();
        outerPaint.setColor(-7829368);
        outerPaint.setAntiAlias(true);
        outerPaint.setStyle(Paint.Style.STROKE);
        outerPaint.setStrokeWidth(2.0f);
        outerPaint.setAlpha(200);
        Canvas canvas = this.mCompassFrame.beginRecording(50, 50);
        canvas.drawCircle(25.0f, 25.0f, 20.0f * this.mScale, innerPaint);
        canvas.drawCircle(25.0f, 25.0f, 20.0f * this.mScale, outerPaint);
        drawTriangle(canvas, 25.0f, 25.0f, 20.0f * this.mScale, 0.0f, outerPaint);
        drawTriangle(canvas, 25.0f, 25.0f, 20.0f * this.mScale, 90.0f, outerPaint);
        drawTriangle(canvas, 25.0f, 25.0f, 20.0f * this.mScale, 180.0f, outerPaint);
        drawTriangle(canvas, 25.0f, 25.0f, 20.0f * this.mScale, 270.0f, outerPaint);
        this.mCompassFrame.endRecording();
    }

    private void createCompassRosePicture() {
        Paint northPaint = new Paint();
        northPaint.setColor(-6291456);
        northPaint.setAntiAlias(true);
        northPaint.setStyle(Paint.Style.FILL);
        northPaint.setAlpha(220);
        Paint southPaint = new Paint();
        southPaint.setColor(-16777216);
        southPaint.setAntiAlias(true);
        southPaint.setStyle(Paint.Style.FILL);
        southPaint.setAlpha(220);
        Paint centerPaint = new Paint();
        centerPaint.setColor(-1);
        centerPaint.setAntiAlias(true);
        centerPaint.setStyle(Paint.Style.FILL);
        centerPaint.setAlpha(220);
        Canvas canvas = this.mCompassRose.beginRecording(50, 50);
        Path pathNorth = new Path();
        pathNorth.moveTo(25.0f, 25.0f - (17.0f * this.mScale));
        pathNorth.lineTo(25.0f + (4.0f * this.mScale), 25.0f);
        pathNorth.lineTo(25.0f - (4.0f * this.mScale), 25.0f);
        pathNorth.lineTo(25.0f, 25.0f - (17.0f * this.mScale));
        pathNorth.close();
        canvas.drawPath(pathNorth, northPaint);
        Path pathSouth = new Path();
        pathSouth.moveTo(25.0f, 25.0f + (17.0f * this.mScale));
        pathSouth.lineTo(25.0f + (4.0f * this.mScale), 25.0f);
        pathSouth.lineTo(25.0f - (4.0f * this.mScale), 25.0f);
        pathSouth.lineTo(25.0f, 25.0f + (17.0f * this.mScale));
        pathSouth.close();
        canvas.drawPath(pathSouth, southPaint);
        canvas.drawCircle(25.0f, 25.0f, 2.0f, centerPaint);
        this.mCompassRose.endRecording();
    }
}
