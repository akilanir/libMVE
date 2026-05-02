package org.osmdroid.views.overlay.compass;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.Point;
import android.graphics.Rect;
import android.util.FloatMath;
import android.view.Display;
import android.view.Menu;
import android.view.MenuItem;
import android.view.WindowManager;
import org.osmdroid.DefaultResourceProxyImpl;
import org.osmdroid.ResourceProxy;
import org.osmdroid.views.MapView;
import org.osmdroid.views.Projection;
import org.osmdroid.views.overlay.IOverlayMenuProvider;
import org.osmdroid.views.overlay.Overlay;

/* loaded from: osmdroid-android-4.2.jar:org/osmdroid/views/overlay/compass/CompassOverlay.class */
public class CompassOverlay extends Overlay implements IOverlayMenuProvider, IOrientationConsumer {
    protected final MapView mMapView;
    private final Display mDisplay;
    public IOrientationProvider mOrientationProvider;
    protected final Paint mPaint;
    protected Bitmap mCompassFrameBitmap;
    protected Bitmap mCompassRoseBitmap;
    private final Matrix mCompassMatrix;
    private boolean mIsCompassEnabled;
    private float mAzimuth;
    private float mCompassCenterX;
    private float mCompassCenterY;
    private final float mCompassRadius = 20.0f;
    protected final float mCompassFrameCenterX;
    protected final float mCompassFrameCenterY;
    protected final float mCompassRoseCenterX;
    protected final float mCompassRoseCenterY;
    private boolean mOptionsMenuEnabled;
    private static final Paint sSmoothPaint = new Paint(2);
    public static final int MENU_COMPASS = getSafeMenuId();

    public CompassOverlay(Context context, MapView mapView) {
        this(context, new InternalCompassOrientationProvider(context), mapView);
    }

    public CompassOverlay(Context context, IOrientationProvider orientationProvider, MapView mapView) {
        this(context, orientationProvider, mapView, new DefaultResourceProxyImpl(context));
    }

    public CompassOverlay(Context context, IOrientationProvider orientationProvider, MapView mapView, ResourceProxy pResourceProxy) {
        super(pResourceProxy);
        this.mPaint = new Paint();
        this.mCompassMatrix = new Matrix();
        this.mAzimuth = Float.NaN;
        this.mCompassCenterX = 35.0f;
        this.mCompassCenterY = 35.0f;
        this.mCompassRadius = 20.0f;
        this.mOptionsMenuEnabled = true;
        this.mMapView = mapView;
        WindowManager windowManager = (WindowManager) context.getSystemService("window");
        this.mDisplay = windowManager.getDefaultDisplay();
        createCompassFramePicture();
        createCompassRosePicture();
        this.mCompassFrameCenterX = (this.mCompassFrameBitmap.getWidth() / 2) - 0.5f;
        this.mCompassFrameCenterY = (this.mCompassFrameBitmap.getHeight() / 2) - 0.5f;
        this.mCompassRoseCenterX = (this.mCompassRoseBitmap.getWidth() / 2) - 0.5f;
        this.mCompassRoseCenterY = (this.mCompassRoseBitmap.getHeight() / 2) - 0.5f;
        setOrientationProvider(orientationProvider);
    }

    @Override // org.osmdroid.views.overlay.Overlay
    public void onDetach(MapView mapView) {
        disableCompass();
        super.onDetach(mapView);
    }

    private void invalidateCompass() {
        Rect screenRect = this.mMapView.getProjection().getScreenRect();
        int frameLeft = screenRect.left + ((int) FloatMath.ceil((this.mCompassCenterX - this.mCompassFrameCenterX) * this.mScale));
        int frameTop = screenRect.top + ((int) FloatMath.ceil((this.mCompassCenterY - this.mCompassFrameCenterY) * this.mScale));
        int frameRight = screenRect.left + ((int) FloatMath.ceil((this.mCompassCenterX + this.mCompassFrameCenterX) * this.mScale));
        int frameBottom = screenRect.top + ((int) FloatMath.ceil((this.mCompassCenterY + this.mCompassFrameCenterY) * this.mScale));
        this.mMapView.postInvalidateMapCoordinates(frameLeft - 2, frameTop - 2, frameRight + 2, frameBottom + 2);
    }

    public void setCompassCenter(float x, float y) {
        this.mCompassCenterX = x;
        this.mCompassCenterY = y;
    }

    public IOrientationProvider getOrientationProvider() {
        return this.mOrientationProvider;
    }

    protected void setOrientationProvider(IOrientationProvider orientationProvider) {
        if (orientationProvider == null) {
            throw new RuntimeException("You must pass an IOrientationProvider to setOrientationProvider()");
        }
        if (isCompassEnabled()) {
            this.mOrientationProvider.stopOrientationProvider();
        }
        this.mOrientationProvider = orientationProvider;
    }

    protected void drawCompass(Canvas canvas, float bearing, Rect screenRect) {
        Projection proj = this.mMapView.getProjection();
        float centerX = this.mCompassCenterX * this.mScale;
        float centerY = this.mCompassCenterY * this.mScale;
        this.mCompassMatrix.setTranslate(-this.mCompassFrameCenterX, -this.mCompassFrameCenterY);
        this.mCompassMatrix.postTranslate(centerX, centerY);
        canvas.save();
        canvas.concat(proj.getInvertedScaleRotateCanvasMatrix());
        canvas.concat(this.mCompassMatrix);
        canvas.drawBitmap(this.mCompassFrameBitmap, 0.0f, 0.0f, sSmoothPaint);
        canvas.restore();
        this.mCompassMatrix.setRotate(-bearing, this.mCompassRoseCenterX, this.mCompassRoseCenterY);
        this.mCompassMatrix.postTranslate(-this.mCompassRoseCenterX, -this.mCompassRoseCenterY);
        this.mCompassMatrix.postTranslate(centerX, centerY);
        canvas.save();
        canvas.concat(proj.getInvertedScaleRotateCanvasMatrix());
        canvas.concat(this.mCompassMatrix);
        canvas.drawBitmap(this.mCompassRoseBitmap, 0.0f, 0.0f, sSmoothPaint);
        canvas.restore();
    }

    @Override // org.osmdroid.views.overlay.Overlay
    protected void draw(Canvas c, MapView mapView, boolean shadow) {
        if (!shadow && isCompassEnabled() && !Float.isNaN(this.mAzimuth)) {
            drawCompass(c, this.mAzimuth + getDisplayOrientation(), mapView.getProjection().getScreenRect());
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
        pMenu.add(0, MENU_COMPASS + pMenuIdOffset, 0, this.mResourceProxy.getString(ResourceProxy.string.compass)).setIcon(this.mResourceProxy.getDrawable(ResourceProxy.bitmap.ic_menu_compass)).setCheckable(true);
        return true;
    }

    @Override // org.osmdroid.views.overlay.IOverlayMenuProvider
    public boolean onPrepareOptionsMenu(Menu pMenu, int pMenuIdOffset, MapView pMapView) {
        pMenu.findItem(MENU_COMPASS + pMenuIdOffset).setChecked(isCompassEnabled());
        return false;
    }

    @Override // org.osmdroid.views.overlay.IOverlayMenuProvider
    public boolean onOptionsItemSelected(MenuItem pItem, int pMenuIdOffset, MapView pMapView) {
        int menuId = pItem.getItemId() - pMenuIdOffset;
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

    @Override // org.osmdroid.views.overlay.compass.IOrientationConsumer
    public void onOrientationChanged(float orientation, IOrientationProvider source) {
        this.mAzimuth = orientation;
        invalidateCompass();
    }

    public boolean enableCompass(IOrientationProvider orientationProvider) {
        setOrientationProvider(orientationProvider);
        boolean success = this.mOrientationProvider.startOrientationProvider(this);
        this.mIsCompassEnabled = success;
        if (this.mMapView != null) {
            invalidateCompass();
        }
        return success;
    }

    public boolean enableCompass() {
        return enableCompass(this.mOrientationProvider);
    }

    public void disableCompass() {
        this.mIsCompassEnabled = false;
        if (this.mOrientationProvider != null) {
            this.mOrientationProvider.stopOrientationProvider();
        }
        this.mAzimuth = Float.NaN;
        if (this.mMapView != null) {
            invalidateCompass();
        }
    }

    public boolean isCompassEnabled() {
        return this.mIsCompassEnabled;
    }

    public float getOrientation() {
        return this.mAzimuth;
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
        int picBorderWidthAndHeight = (int) (50.0f * this.mScale);
        int center = picBorderWidthAndHeight / 2;
        this.mCompassFrameBitmap = Bitmap.createBitmap(picBorderWidthAndHeight, picBorderWidthAndHeight, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(this.mCompassFrameBitmap);
        canvas.drawCircle(center, center, 20.0f * this.mScale, innerPaint);
        canvas.drawCircle(center, center, 20.0f * this.mScale, outerPaint);
        drawTriangle(canvas, center, center, 20.0f * this.mScale, 0.0f, outerPaint);
        drawTriangle(canvas, center, center, 20.0f * this.mScale, 90.0f, outerPaint);
        drawTriangle(canvas, center, center, 20.0f * this.mScale, 180.0f, outerPaint);
        drawTriangle(canvas, center, center, 20.0f * this.mScale, 270.0f, outerPaint);
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
        int picBorderWidthAndHeight = (int) (50.0f * this.mScale);
        int center = picBorderWidthAndHeight / 2;
        this.mCompassRoseBitmap = Bitmap.createBitmap(picBorderWidthAndHeight, picBorderWidthAndHeight, Bitmap.Config.ARGB_8888);
        Canvas canvas = new Canvas(this.mCompassRoseBitmap);
        Path pathNorth = new Path();
        pathNorth.moveTo(center, center - (17.0f * this.mScale));
        pathNorth.lineTo(center + (4.0f * this.mScale), center);
        pathNorth.lineTo(center - (4.0f * this.mScale), center);
        pathNorth.lineTo(center, center - (17.0f * this.mScale));
        pathNorth.close();
        canvas.drawPath(pathNorth, northPaint);
        Path pathSouth = new Path();
        pathSouth.moveTo(center, center + (17.0f * this.mScale));
        pathSouth.lineTo(center + (4.0f * this.mScale), center);
        pathSouth.lineTo(center - (4.0f * this.mScale), center);
        pathSouth.lineTo(center, center + (17.0f * this.mScale));
        pathSouth.close();
        canvas.drawPath(pathSouth, southPaint);
        canvas.drawCircle(center, center, 2.0f, centerPaint);
    }
}
