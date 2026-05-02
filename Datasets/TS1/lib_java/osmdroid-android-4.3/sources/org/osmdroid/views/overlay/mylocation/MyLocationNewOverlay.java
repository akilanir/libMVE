package org.osmdroid.views.overlay.mylocation;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Point;
import android.graphics.PointF;
import android.graphics.Rect;
import android.location.Location;
import android.os.Handler;
import android.os.Looper;
import android.util.FloatMath;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import java.util.Iterator;
import java.util.LinkedList;
import org.osmdroid.DefaultResourceProxyImpl;
import org.osmdroid.ResourceProxy;
import org.osmdroid.api.IMapController;
import org.osmdroid.api.IMapView;
import org.osmdroid.util.GeoPoint;
import org.osmdroid.util.TileSystem;
import org.osmdroid.views.MapView;
import org.osmdroid.views.Projection;
import org.osmdroid.views.overlay.IOverlayMenuProvider;
import org.osmdroid.views.overlay.Overlay;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/views/overlay/mylocation/MyLocationNewOverlay.class */
public class MyLocationNewOverlay extends Overlay implements IMyLocationConsumer, IOverlayMenuProvider, Overlay.Snappable {
    protected final Paint mPaint;
    protected final Paint mCirclePaint;
    protected final Bitmap mPersonBitmap;
    protected final Bitmap mDirectionArrowBitmap;
    protected final MapView mMapView;
    private final IMapController mMapController;
    public IMyLocationProvider mMyLocationProvider;
    private final LinkedList<Runnable> mRunOnFirstFix;
    private final Point mMapCoordsProjected;
    private final Point mMapCoordsTranslated;
    private final Handler mHandler;
    private final Object mHandlerToken;
    private Location mLocation;
    private final GeoPoint mGeoPoint;
    private boolean mIsLocationEnabled;
    protected boolean mIsFollowing;
    protected boolean mDrawAccuracyEnabled;
    protected final PointF mPersonHotspot;
    protected final float mDirectionArrowCenterX;
    protected final float mDirectionArrowCenterY;
    private boolean mOptionsMenuEnabled;
    private final float[] mMatrixValues;
    private final Matrix mMatrix;
    private final Rect mMyLocationRect;
    private final Rect mMyLocationPreviousRect;
    private static final Logger logger = LoggerFactory.getLogger(MyLocationNewOverlay.class);
    public static final int MENU_MY_LOCATION = getSafeMenuId();

    public MyLocationNewOverlay(Context context, MapView mapView) {
        this(context, new GpsMyLocationProvider(context), mapView);
    }

    public MyLocationNewOverlay(Context context, IMyLocationProvider myLocationProvider, MapView mapView) {
        this(myLocationProvider, mapView, new DefaultResourceProxyImpl(context));
    }

    public MyLocationNewOverlay(IMyLocationProvider myLocationProvider, MapView mapView, ResourceProxy resourceProxy) {
        super(resourceProxy);
        this.mPaint = new Paint();
        this.mCirclePaint = new Paint();
        this.mRunOnFirstFix = new LinkedList<>();
        this.mMapCoordsProjected = new Point();
        this.mMapCoordsTranslated = new Point();
        this.mHandlerToken = new Object();
        this.mGeoPoint = new GeoPoint(0, 0);
        this.mIsLocationEnabled = false;
        this.mIsFollowing = false;
        this.mDrawAccuracyEnabled = true;
        this.mOptionsMenuEnabled = true;
        this.mMatrixValues = new float[9];
        this.mMatrix = new Matrix();
        this.mMyLocationRect = new Rect();
        this.mMyLocationPreviousRect = new Rect();
        this.mMapView = mapView;
        this.mMapController = mapView.getController();
        this.mCirclePaint.setARGB(0, 100, 100, 255);
        this.mCirclePaint.setAntiAlias(true);
        this.mPaint.setFilterBitmap(true);
        this.mPersonBitmap = this.mResourceProxy.getBitmap(ResourceProxy.bitmap.person);
        this.mDirectionArrowBitmap = this.mResourceProxy.getBitmap(ResourceProxy.bitmap.direction_arrow);
        this.mDirectionArrowCenterX = (this.mDirectionArrowBitmap.getWidth() / 2.0f) - 0.5f;
        this.mDirectionArrowCenterY = (this.mDirectionArrowBitmap.getHeight() / 2.0f) - 0.5f;
        this.mPersonHotspot = new PointF((24.0f * this.mScale) + 0.5f, (39.0f * this.mScale) + 0.5f);
        this.mHandler = new Handler(Looper.getMainLooper());
        setMyLocationProvider(myLocationProvider);
    }

    @Override // org.osmdroid.views.overlay.Overlay
    public void onDetach(MapView mapView) {
        disableMyLocation();
        super.onDetach(mapView);
    }

    public void setDrawAccuracyEnabled(boolean drawAccuracyEnabled) {
        this.mDrawAccuracyEnabled = drawAccuracyEnabled;
    }

    public boolean isDrawAccuracyEnabled() {
        return this.mDrawAccuracyEnabled;
    }

    public IMyLocationProvider getMyLocationProvider() {
        return this.mMyLocationProvider;
    }

    protected void setMyLocationProvider(IMyLocationProvider myLocationProvider) {
        if (myLocationProvider == null) {
            throw new RuntimeException("You must pass an IMyLocationProvider to setMyLocationProvider()");
        }
        if (isMyLocationEnabled()) {
            stopLocationProvider();
        }
        this.mMyLocationProvider = myLocationProvider;
    }

    public void setPersonHotspot(float x, float y) {
        this.mPersonHotspot.set(x, y);
    }

    protected void drawMyLocation(Canvas canvas, MapView mapView, Location lastFix) {
        Projection pj = mapView.getProjection();
        pj.toPixelsFromProjected(this.mMapCoordsProjected, this.mMapCoordsTranslated);
        if (this.mDrawAccuracyEnabled) {
            float radius = lastFix.getAccuracy() / ((float) TileSystem.GroundResolution(lastFix.getLatitude(), mapView.getZoomLevel()));
            this.mCirclePaint.setAlpha(50);
            this.mCirclePaint.setStyle(Paint.Style.FILL);
            canvas.drawCircle(this.mMapCoordsTranslated.x, this.mMapCoordsTranslated.y, radius, this.mCirclePaint);
            this.mCirclePaint.setAlpha(150);
            this.mCirclePaint.setStyle(Paint.Style.STROKE);
            canvas.drawCircle(this.mMapCoordsTranslated.x, this.mMapCoordsTranslated.y, radius, this.mCirclePaint);
        }
        canvas.getMatrix(this.mMatrix);
        this.mMatrix.getValues(this.mMatrixValues);
        float scaleX = (float) Math.sqrt((this.mMatrixValues[0] * this.mMatrixValues[0]) + (this.mMatrixValues[3] * this.mMatrixValues[3]));
        float scaleY = (float) Math.sqrt((this.mMatrixValues[4] * this.mMatrixValues[4]) + (this.mMatrixValues[1] * this.mMatrixValues[1]));
        if (lastFix.hasBearing()) {
            canvas.save();
            canvas.rotate(lastFix.getBearing(), this.mMapCoordsTranslated.x, this.mMapCoordsTranslated.y);
            canvas.scale(1.0f / scaleX, 1.0f / scaleY, this.mMapCoordsTranslated.x, this.mMapCoordsTranslated.y);
            canvas.drawBitmap(this.mDirectionArrowBitmap, this.mMapCoordsTranslated.x - this.mDirectionArrowCenterX, this.mMapCoordsTranslated.y - this.mDirectionArrowCenterY, this.mPaint);
            canvas.restore();
            return;
        }
        canvas.save();
        canvas.rotate(-this.mMapView.getMapOrientation(), this.mMapCoordsTranslated.x, this.mMapCoordsTranslated.y);
        canvas.scale(1.0f / scaleX, 1.0f / scaleY, this.mMapCoordsTranslated.x, this.mMapCoordsTranslated.y);
        canvas.drawBitmap(this.mPersonBitmap, this.mMapCoordsTranslated.x - this.mPersonHotspot.x, this.mMapCoordsTranslated.y - this.mPersonHotspot.y, this.mPaint);
        canvas.restore();
    }

    protected Rect getMyLocationDrawingBounds(int zoomLevel, Location lastFix, Rect reuse) {
        if (reuse == null) {
            reuse = new Rect();
        }
        Projection pj = this.mMapView.getProjection();
        pj.toPixelsFromProjected(this.mMapCoordsProjected, this.mMapCoordsTranslated);
        if (lastFix.hasBearing()) {
            int widestEdge = (int) Math.ceil(Math.max(this.mDirectionArrowBitmap.getWidth(), this.mDirectionArrowBitmap.getHeight()) * Math.sqrt(2.0d));
            reuse.set(this.mMapCoordsTranslated.x, this.mMapCoordsTranslated.y, this.mMapCoordsTranslated.x + widestEdge, this.mMapCoordsTranslated.y + widestEdge);
            reuse.offset((-widestEdge) / 2, (-widestEdge) / 2);
        } else {
            reuse.set(this.mMapCoordsTranslated.x, this.mMapCoordsTranslated.y, this.mMapCoordsTranslated.x + this.mPersonBitmap.getWidth(), this.mMapCoordsTranslated.y + this.mPersonBitmap.getHeight());
            reuse.offset((int) ((-this.mPersonHotspot.x) + 0.5f), (int) ((-this.mPersonHotspot.y) + 0.5f));
        }
        if (this.mDrawAccuracyEnabled) {
            int radius = (int) FloatMath.ceil(lastFix.getAccuracy() / ((float) TileSystem.GroundResolution(lastFix.getLatitude(), zoomLevel)));
            reuse.union(this.mMapCoordsTranslated.x - radius, this.mMapCoordsTranslated.y - radius, this.mMapCoordsTranslated.x + radius, this.mMapCoordsTranslated.y + radius);
            int strokeWidth = (int) FloatMath.ceil(this.mCirclePaint.getStrokeWidth() == 0.0f ? 1.0f : this.mCirclePaint.getStrokeWidth());
            reuse.inset(-strokeWidth, -strokeWidth);
        }
        return reuse;
    }

    @Override // org.osmdroid.views.overlay.Overlay
    protected void draw(Canvas c, MapView mapView, boolean shadow) {
        if (!shadow && this.mLocation != null && isMyLocationEnabled()) {
            drawMyLocation(c, mapView, this.mLocation);
        }
    }

    @Override // org.osmdroid.views.overlay.Overlay.Snappable
    public boolean onSnapToItem(int x, int y, Point snapPoint, IMapView mapView) {
        if (this.mLocation != null) {
            Projection pj = this.mMapView.getProjection();
            pj.toPixelsFromProjected(this.mMapCoordsProjected, this.mMapCoordsTranslated);
            snapPoint.x = this.mMapCoordsTranslated.x;
            snapPoint.y = this.mMapCoordsTranslated.y;
            double xDiff = x - this.mMapCoordsTranslated.x;
            double yDiff = y - this.mMapCoordsTranslated.y;
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
        pMenu.add(0, MENU_MY_LOCATION + pMenuIdOffset, 0, this.mResourceProxy.getString(ResourceProxy.string.my_location)).setIcon(this.mResourceProxy.getDrawable(ResourceProxy.bitmap.ic_menu_mylocation)).setCheckable(true);
        return true;
    }

    @Override // org.osmdroid.views.overlay.IOverlayMenuProvider
    public boolean onPrepareOptionsMenu(Menu pMenu, int pMenuIdOffset, MapView pMapView) {
        pMenu.findItem(MENU_MY_LOCATION + pMenuIdOffset).setChecked(isMyLocationEnabled());
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
        return false;
    }

    public GeoPoint getMyLocation() {
        if (this.mLocation == null) {
            return null;
        }
        return new GeoPoint(this.mLocation);
    }

    public Location getLastFix() {
        return this.mLocation;
    }

    public void enableFollowLocation() {
        Location location;
        this.mIsFollowing = true;
        if (isMyLocationEnabled() && (location = this.mMyLocationProvider.getLastKnownLocation()) != null) {
            setLocation(location);
        }
        if (this.mMapView != null) {
            this.mMapView.postInvalidate();
        }
    }

    public void disableFollowLocation() {
        this.mIsFollowing = false;
    }

    public boolean isFollowLocationEnabled() {
        return this.mIsFollowing;
    }

    @Override // org.osmdroid.views.overlay.mylocation.IMyLocationConsumer
    public void onLocationChanged(final Location location, IMyLocationProvider source) {
        if (location != null) {
            this.mHandler.postAtTime(new Runnable() { // from class: org.osmdroid.views.overlay.mylocation.MyLocationNewOverlay.1
                @Override // java.lang.Runnable
                public void run() {
                    MyLocationNewOverlay.this.setLocation(location);
                    Iterator i$ = MyLocationNewOverlay.this.mRunOnFirstFix.iterator();
                    while (i$.hasNext()) {
                        Runnable runnable = (Runnable) i$.next();
                        new Thread(runnable).start();
                    }
                    MyLocationNewOverlay.this.mRunOnFirstFix.clear();
                }
            }, this.mHandlerToken, 0L);
        }
    }

    protected void setLocation(Location location) {
        Location oldLocation = this.mLocation;
        if (oldLocation != null) {
            getMyLocationDrawingBounds(this.mMapView.getZoomLevel(), oldLocation, this.mMyLocationPreviousRect);
        }
        this.mLocation = location;
        this.mMapView.getProjection().toProjectedPixels((int) (this.mLocation.getLatitude() * 1000000.0d), (int) (this.mLocation.getLongitude() * 1000000.0d), this.mMapCoordsProjected);
        if (this.mIsFollowing) {
            this.mGeoPoint.setLatitudeE6((int) (this.mLocation.getLatitude() * 1000000.0d));
            this.mGeoPoint.setLongitudeE6((int) (this.mLocation.getLongitude() * 1000000.0d));
            this.mMapController.animateTo(this.mGeoPoint);
            return;
        }
        getMyLocationDrawingBounds(this.mMapView.getZoomLevel(), this.mLocation, this.mMyLocationRect);
        if (oldLocation != null) {
            this.mMyLocationRect.union(this.mMyLocationPreviousRect);
        }
        int left = this.mMyLocationRect.left;
        int top = this.mMyLocationRect.top;
        int right = this.mMyLocationRect.right;
        int bottom = this.mMyLocationRect.bottom;
        this.mMapView.invalidateMapCoordinates(left, top, right, bottom);
    }

    public boolean enableMyLocation(IMyLocationProvider myLocationProvider) {
        Location location;
        setMyLocationProvider(myLocationProvider);
        boolean success = this.mMyLocationProvider.startLocationProvider(this);
        this.mIsLocationEnabled = success;
        if (success && (location = this.mMyLocationProvider.getLastKnownLocation()) != null) {
            setLocation(location);
        }
        if (this.mMapView != null) {
            this.mMapView.postInvalidate();
        }
        return success;
    }

    public boolean enableMyLocation() {
        return enableMyLocation(this.mMyLocationProvider);
    }

    public void disableMyLocation() {
        this.mIsLocationEnabled = false;
        stopLocationProvider();
        if (this.mMapView != null) {
            this.mMapView.postInvalidate();
        }
    }

    protected void stopLocationProvider() {
        if (this.mMyLocationProvider != null) {
            this.mMyLocationProvider.stopLocationProvider();
        }
        this.mHandler.removeCallbacksAndMessages(this.mHandlerToken);
    }

    public boolean isMyLocationEnabled() {
        return this.mIsLocationEnabled;
    }

    public boolean runOnFirstFix(Runnable runnable) {
        if (this.mMyLocationProvider != null && this.mLocation != null) {
            new Thread(runnable).start();
            return true;
        }
        this.mRunOnFirstFix.addLast(runnable);
        return false;
    }
}
