package org.osmdroid.views;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Point;
import android.graphics.PointF;
import android.graphics.Rect;
import android.os.Build;
import android.os.Handler;
import android.util.AttributeSet;
import android.util.Log;
import android.view.GestureDetector;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Scroller;
import android.widget.ZoomButtonsController;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import microsoft.mappoint.TileSystem;
import org.metalev.multitouch.controller.MultiTouchController;
import org.osmdroid.DefaultResourceProxyImpl;
import org.osmdroid.ResourceProxy;
import org.osmdroid.api.IGeoPoint;
import org.osmdroid.api.IMapController;
import org.osmdroid.api.IMapView;
import org.osmdroid.events.MapListener;
import org.osmdroid.events.ScrollEvent;
import org.osmdroid.events.ZoomEvent;
import org.osmdroid.tileprovider.MapTileProviderArray;
import org.osmdroid.tileprovider.MapTileProviderBase;
import org.osmdroid.tileprovider.MapTileProviderBasic;
import org.osmdroid.tileprovider.modules.MapTileModuleProviderBase;
import org.osmdroid.tileprovider.tilesource.IStyledTileSource;
import org.osmdroid.tileprovider.tilesource.ITileSource;
import org.osmdroid.tileprovider.tilesource.TileSourceFactory;
import org.osmdroid.tileprovider.util.SimpleInvalidationHandler;
import org.osmdroid.util.BoundingBoxE6;
import org.osmdroid.util.GeoPoint;
import org.osmdroid.util.GeometryMath;
import org.osmdroid.views.overlay.DefaultOverlayManager;
import org.osmdroid.views.overlay.Overlay;
import org.osmdroid.views.overlay.OverlayManager;
import org.osmdroid.views.overlay.TilesOverlay;
import org.osmdroid.views.util.constants.MapViewConstants;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/views/MapView.class */
public class MapView extends ViewGroup implements IMapView, MapViewConstants, MultiTouchController.MultiTouchObjectCanvas<Object> {
    private static final double ZOOM_SENSITIVITY = 1.0d;
    private static final double ZOOM_LOG_BASE_INV = ZOOM_SENSITIVITY / Math.log(2.0d);
    private static Method sMotionEventTransformMethod;
    private int mZoomLevel;
    private OverlayManager mOverlayManager;
    private Projection mProjection;
    private TilesOverlay mMapOverlay;
    private final GestureDetector mGestureDetector;
    private final Scroller mScroller;
    protected boolean mIsFlinging;
    protected final AtomicInteger mTargetZoomLevel;
    protected final AtomicBoolean mIsAnimating;
    protected Integer mMinimumZoomLevel;
    protected Integer mMaximumZoomLevel;
    private final MapController mController;
    private final ZoomButtonsController mZoomController;
    private boolean mEnableZoomController;
    private final ResourceProxy mResourceProxy;
    private MultiTouchController<Object> mMultiTouchController;
    protected float mMultiTouchScale;
    protected PointF mMultiTouchScalePoint;
    protected MapListener mListener;
    private float mapOrientation;
    private final Rect mInvalidateRect;
    protected BoundingBoxE6 mScrollableAreaBoundingBox;
    protected Rect mScrollableAreaLimit;
    private MapTileProviderBase mTileProvider;
    private final Handler mTileRequestCompleteHandler;
    private boolean mTilesScaledToDpi;
    final Matrix mRotateScaleMatrix;
    final Point mRotateScalePoint;
    private final Point mLayoutPoint;
    private final LinkedList<OnFirstLayoutListener> mOnFirstLayoutListeners;
    private boolean mLayoutOccurred;
    private boolean enableFling;

    /* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/views/MapView$OnFirstLayoutListener.class */
    public interface OnFirstLayoutListener {
        void onFirstLayout(View view, int i, int i2, int i3, int i4);
    }

    protected MapView(Context context, ResourceProxy resourceProxy, MapTileProviderBase tileProvider, Handler tileRequestCompleteHandler, AttributeSet attrs) {
        super(context, attrs);
        this.mZoomLevel = 0;
        this.mTargetZoomLevel = new AtomicInteger();
        this.mIsAnimating = new AtomicBoolean(false);
        this.mEnableZoomController = false;
        this.mMultiTouchScale = 1.0f;
        this.mMultiTouchScalePoint = new PointF();
        this.mapOrientation = 0.0f;
        this.mInvalidateRect = new Rect();
        this.mTilesScaledToDpi = false;
        this.mRotateScaleMatrix = new Matrix();
        this.mRotateScalePoint = new Point();
        this.mLayoutPoint = new Point();
        this.mOnFirstLayoutListeners = new LinkedList<>();
        this.mLayoutOccurred = false;
        this.enableFling = true;
        this.mResourceProxy = resourceProxy;
        this.mController = new MapController(this);
        this.mScroller = new Scroller(context);
        if (tileProvider == null) {
            ITileSource tileSource = getTileSourceFromAttributes(attrs);
            tileProvider = isInEditMode() ? new MapTileProviderArray(tileSource, null, new MapTileModuleProviderBase[0]) : new MapTileProviderBasic(context, tileSource);
        }
        this.mTileRequestCompleteHandler = tileRequestCompleteHandler == null ? new SimpleInvalidationHandler(this) : tileRequestCompleteHandler;
        this.mTileProvider = tileProvider;
        this.mTileProvider.setTileRequestCompleteHandler(this.mTileRequestCompleteHandler);
        updateTileSizeForDensity(this.mTileProvider.getTileSource());
        this.mMapOverlay = new TilesOverlay(this.mTileProvider, this.mResourceProxy);
        this.mOverlayManager = new DefaultOverlayManager(this.mMapOverlay);
        if (isInEditMode()) {
            this.mZoomController = null;
        } else {
            this.mZoomController = new ZoomButtonsController(this);
            this.mZoomController.setOnZoomListener(new MapViewZoomListener());
        }
        this.mGestureDetector = new GestureDetector(context, new MapViewGestureDetectorListener());
        this.mGestureDetector.setOnDoubleTapListener(new MapViewDoubleClickListener());
    }

    public MapView(Context context, AttributeSet attrs) {
        this(context, new DefaultResourceProxyImpl(context), null, null, attrs);
    }

    public MapView(Context context) {
        this(context, new DefaultResourceProxyImpl(context));
    }

    public MapView(Context context, ResourceProxy resourceProxy) {
        this(context, resourceProxy, null);
    }

    public MapView(Context context, ResourceProxy resourceProxy, MapTileProviderBase aTileProvider) {
        this(context, resourceProxy, aTileProvider, null);
    }

    public MapView(Context context, ResourceProxy resourceProxy, MapTileProviderBase aTileProvider, Handler tileRequestCompleteHandler) {
        this(context, resourceProxy, aTileProvider, tileRequestCompleteHandler, null);
    }

    @Override // org.osmdroid.api.IMapView
    public IMapController getController() {
        return this.mController;
    }

    public List<Overlay> getOverlays() {
        return getOverlayManager().overlays();
    }

    public OverlayManager getOverlayManager() {
        return this.mOverlayManager;
    }

    public void setOverlayManager(OverlayManager overlayManager) {
        this.mOverlayManager = overlayManager;
    }

    public MapTileProviderBase getTileProvider() {
        return this.mTileProvider;
    }

    public Scroller getScroller() {
        return this.mScroller;
    }

    public Handler getTileRequestCompleteHandler() {
        return this.mTileRequestCompleteHandler;
    }

    @Override // org.osmdroid.api.IMapView
    public int getLatitudeSpan() {
        return getBoundingBox().getLatitudeSpanE6();
    }

    @Override // org.osmdroid.api.IMapView
    public int getLongitudeSpan() {
        return getBoundingBox().getLongitudeSpanE6();
    }

    public BoundingBoxE6 getBoundingBox() {
        return getProjection().getBoundingBox();
    }

    public Rect getScreenRect(Rect reuse) {
        Rect out = getIntrinsicScreenRect(reuse);
        if (getMapOrientation() != 0.0f && getMapOrientation() != 180.0f) {
            GeometryMath.getBoundingBoxForRotatatedRectangle(out, out.centerX(), out.centerY(), getMapOrientation(), out);
        }
        return out;
    }

    public Rect getIntrinsicScreenRect(Rect reuse) {
        Rect out = reuse == null ? new Rect() : reuse;
        out.set(0, 0, getWidth(), getHeight());
        return out;
    }

    @Override // org.osmdroid.api.IMapView
    public Projection getProjection() {
        if (this.mProjection == null) {
            this.mProjection = new Projection(this);
        }
        return this.mProjection;
    }

    void setMapCenter(IGeoPoint aCenter) {
        getController().animateTo(aCenter);
    }

    void setMapCenter(int aLatitudeE6, int aLongitudeE6) {
        setMapCenter(new GeoPoint(aLatitudeE6, aLongitudeE6));
    }

    public boolean isTilesScaledToDpi() {
        return this.mTilesScaledToDpi;
    }

    public void setTilesScaledToDpi(boolean tilesScaledToDpi) {
        this.mTilesScaledToDpi = tilesScaledToDpi;
        updateTileSizeForDensity(getTileProvider().getTileSource());
    }

    private void updateTileSizeForDensity(ITileSource aTileSource) {
        float density = isTilesScaledToDpi() ? getResources().getDisplayMetrics().density : 1.0f;
        TileSystem.setTileSize((int) (aTileSource.getTileSizePixels() * density));
    }

    public void setTileSource(ITileSource aTileSource) {
        this.mTileProvider.setTileSource(aTileSource);
        updateTileSizeForDensity(aTileSource);
        checkZoomButtons();
        setZoomLevel(this.mZoomLevel);
        postInvalidate();
    }

    int setZoomLevel(int aZoomLevel) {
        int minZoomLevel = getMinZoomLevel();
        int maxZoomLevel = getMaxZoomLevel();
        int newZoomLevel = Math.max(minZoomLevel, Math.min(maxZoomLevel, aZoomLevel));
        int curZoomLevel = this.mZoomLevel;
        if (newZoomLevel != curZoomLevel) {
            this.mScroller.forceFinished(true);
            this.mIsFlinging = false;
        }
        IGeoPoint centerGeoPoint = getMapCenter();
        this.mZoomLevel = newZoomLevel;
        this.mProjection = null;
        checkZoomButtons();
        if (isLayoutOccurred()) {
            getController().setCenter(centerGeoPoint);
            Point snapPoint = new Point();
            Projection pj = getProjection();
            if (getOverlayManager().onSnapToItem((int) this.mMultiTouchScalePoint.x, (int) this.mMultiTouchScalePoint.y, snapPoint, this)) {
                IGeoPoint geoPoint = pj.fromPixels(snapPoint.x, snapPoint.y, null);
                getController().animateTo(geoPoint);
            }
            this.mTileProvider.rescaleCache(pj, newZoomLevel, curZoomLevel, getScreenRect(null));
        }
        if (newZoomLevel != curZoomLevel && this.mListener != null) {
            ZoomEvent event = new ZoomEvent(this, newZoomLevel);
            this.mListener.onZoom(event);
        }
        requestLayout();
        return this.mZoomLevel;
    }

    public void zoomToBoundingBox(BoundingBoxE6 boundingBox) {
        BoundingBoxE6 currentBox = getBoundingBox();
        double maxZoomLatitudeSpan = this.mZoomLevel == getMaxZoomLevel() ? currentBox.getLatitudeSpanE6() : currentBox.getLatitudeSpanE6() / Math.pow(2.0d, getMaxZoomLevel() - this.mZoomLevel);
        double requiredLatitudeZoom = getMaxZoomLevel() - Math.ceil(Math.log(boundingBox.getLatitudeSpanE6() / maxZoomLatitudeSpan) / Math.log(2.0d));
        double maxZoomLongitudeSpan = this.mZoomLevel == getMaxZoomLevel() ? currentBox.getLongitudeSpanE6() : currentBox.getLongitudeSpanE6() / Math.pow(2.0d, getMaxZoomLevel() - this.mZoomLevel);
        double requiredLongitudeZoom = getMaxZoomLevel() - Math.ceil(Math.log(boundingBox.getLongitudeSpanE6() / maxZoomLongitudeSpan) / Math.log(2.0d));
        getController().setZoom((int) (requiredLatitudeZoom < requiredLongitudeZoom ? requiredLatitudeZoom : requiredLongitudeZoom));
        getController().setCenter(new GeoPoint(boundingBox.getCenter().getLatitudeE6(), boundingBox.getCenter().getLongitudeE6()));
    }

    @Override // org.osmdroid.api.IMapView
    public int getZoomLevel() {
        return getZoomLevel(true);
    }

    public int getZoomLevel(boolean aPending) {
        if (aPending && isAnimating()) {
            return this.mTargetZoomLevel.get();
        }
        return this.mZoomLevel;
    }

    public int getMinZoomLevel() {
        return this.mMinimumZoomLevel == null ? this.mMapOverlay.getMinimumZoomLevel() : this.mMinimumZoomLevel.intValue();
    }

    @Override // org.osmdroid.api.IMapView
    public int getMaxZoomLevel() {
        return this.mMaximumZoomLevel == null ? this.mMapOverlay.getMaximumZoomLevel() : this.mMaximumZoomLevel.intValue();
    }

    public void setMinZoomLevel(Integer zoomLevel) {
        this.mMinimumZoomLevel = zoomLevel;
    }

    public void setMaxZoomLevel(Integer zoomLevel) {
        this.mMaximumZoomLevel = zoomLevel;
    }

    public boolean canZoomIn() {
        int maxZoomLevel = getMaxZoomLevel();
        if ((isAnimating() ? this.mTargetZoomLevel.get() : this.mZoomLevel) >= maxZoomLevel) {
            return false;
        }
        return true;
    }

    public boolean canZoomOut() {
        int minZoomLevel = getMinZoomLevel();
        if ((isAnimating() ? this.mTargetZoomLevel.get() : this.mZoomLevel) <= minZoomLevel) {
            return false;
        }
        return true;
    }

    boolean zoomIn() {
        return getController().zoomIn();
    }

    boolean zoomInFixing(IGeoPoint point) {
        Point coords = getProjection().toPixels(point, null);
        return getController().zoomInFixing(coords.x, coords.y);
    }

    boolean zoomInFixing(int xPixel, int yPixel) {
        return getController().zoomInFixing(xPixel, yPixel);
    }

    boolean zoomOut() {
        return getController().zoomOut();
    }

    boolean zoomOutFixing(IGeoPoint point) {
        Point coords = getProjection().toPixels(point, null);
        return zoomOutFixing(coords.x, coords.y);
    }

    boolean zoomOutFixing(int xPixel, int yPixel) {
        return getController().zoomOutFixing(xPixel, yPixel);
    }

    @Override // org.osmdroid.api.IMapView
    public IGeoPoint getMapCenter() {
        return getProjection().fromPixels(getWidth() / 2, getHeight() / 2, null);
    }

    public ResourceProxy getResourceProxy() {
        return this.mResourceProxy;
    }

    public void setMapOrientation(float degrees) {
        this.mapOrientation = degrees % 360.0f;
        requestLayout();
        invalidate();
    }

    public float getMapOrientation() {
        return this.mapOrientation;
    }

    public boolean useDataConnection() {
        return this.mMapOverlay.useDataConnection();
    }

    public void setUseDataConnection(boolean aMode) {
        this.mMapOverlay.setUseDataConnection(aMode);
    }

    public void setScrollableAreaLimit(BoundingBoxE6 boundingBox) {
        this.mScrollableAreaBoundingBox = boundingBox;
        if (boundingBox == null) {
            this.mScrollableAreaLimit = null;
            return;
        }
        Point upperLeft = TileSystem.LatLongToPixelXY(boundingBox.getLatNorthE6() / 1000000.0d, boundingBox.getLonWestE6() / 1000000.0d, TileSystem.getMaximumZoomLevel(), null);
        Point lowerRight = TileSystem.LatLongToPixelXY(boundingBox.getLatSouthE6() / 1000000.0d, boundingBox.getLonEastE6() / 1000000.0d, TileSystem.getMaximumZoomLevel(), null);
        this.mScrollableAreaLimit = new Rect(upperLeft.x, upperLeft.y, lowerRight.x, lowerRight.y);
    }

    public BoundingBoxE6 getScrollableAreaLimit() {
        return this.mScrollableAreaBoundingBox;
    }

    public void invalidateMapCoordinates(Rect dirty) {
        invalidateMapCoordinates(dirty.left, dirty.top, dirty.right, dirty.bottom, false);
    }

    public void invalidateMapCoordinates(int left, int top, int right, int bottom) {
        invalidateMapCoordinates(left, top, right, bottom, false);
    }

    public void postInvalidateMapCoordinates(int left, int top, int right, int bottom) {
        invalidateMapCoordinates(left, top, right, bottom, true);
    }

    private void invalidateMapCoordinates(int left, int top, int right, int bottom, boolean post) {
        this.mInvalidateRect.set(left, top, right, bottom);
        this.mInvalidateRect.offset(getScrollX(), getScrollY());
        int centerX = getScrollX() + (getWidth() / 2);
        int centerY = getScrollY() + (getHeight() / 2);
        if (getMapOrientation() != 0.0f) {
            GeometryMath.getBoundingBoxForRotatatedRectangle(this.mInvalidateRect, centerX, centerY, getMapOrientation() + 180.0f, this.mInvalidateRect);
        }
        if (post) {
            super.postInvalidate(this.mInvalidateRect.left, this.mInvalidateRect.top, this.mInvalidateRect.right, this.mInvalidateRect.bottom);
        } else {
            super.invalidate(this.mInvalidateRect);
        }
    }

    @Override // android.view.ViewGroup
    protected ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new LayoutParams(-2, -2, null, 8, 0, 0);
    }

    @Override // android.view.ViewGroup
    public ViewGroup.LayoutParams generateLayoutParams(AttributeSet attrs) {
        return new LayoutParams(getContext(), attrs);
    }

    @Override // android.view.ViewGroup
    protected boolean checkLayoutParams(ViewGroup.LayoutParams p) {
        return p instanceof LayoutParams;
    }

    @Override // android.view.ViewGroup
    protected ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams p) {
        return new LayoutParams(p);
    }

    @Override // android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        measureChildren(widthMeasureSpec, heightMeasureSpec);
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onLayout(boolean changed, int l, int t, int r, int b) {
        int count = getChildCount();
        for (int i = 0; i < count; i++) {
            View child = getChildAt(i);
            if (child.getVisibility() != 8) {
                LayoutParams lp = (LayoutParams) child.getLayoutParams();
                int childHeight = child.getMeasuredHeight();
                int childWidth = child.getMeasuredWidth();
                getProjection().toPixels(lp.geoPoint, this.mLayoutPoint);
                if (getMapOrientation() != 0.0f) {
                    Point p = getProjection().rotateAndScalePoint(this.mLayoutPoint.x, this.mLayoutPoint.y, null);
                    this.mLayoutPoint.x = p.x;
                    this.mLayoutPoint.y = p.y;
                }
                getProjection().toMercatorPixels(this.mLayoutPoint.x, this.mLayoutPoint.y, this.mLayoutPoint);
                int x = this.mLayoutPoint.x;
                int y = this.mLayoutPoint.y;
                int childLeft = x;
                int childTop = y;
                switch (lp.alignment) {
                    case 1:
                        childLeft = getPaddingLeft() + x;
                        childTop = getPaddingTop() + y;
                        break;
                    case 2:
                        childLeft = (getPaddingLeft() + x) - (childWidth / 2);
                        childTop = getPaddingTop() + y;
                        break;
                    case 3:
                        childLeft = (getPaddingLeft() + x) - childWidth;
                        childTop = getPaddingTop() + y;
                        break;
                    case 4:
                        childLeft = getPaddingLeft() + x;
                        childTop = (getPaddingTop() + y) - (childHeight / 2);
                        break;
                    case LayoutParams.CENTER /* 5 */:
                        childLeft = (getPaddingLeft() + x) - (childWidth / 2);
                        childTop = (getPaddingTop() + y) - (childHeight / 2);
                        break;
                    case LayoutParams.CENTER_RIGHT /* 6 */:
                        childLeft = (getPaddingLeft() + x) - childWidth;
                        childTop = (getPaddingTop() + y) - (childHeight / 2);
                        break;
                    case LayoutParams.BOTTOM_LEFT /* 7 */:
                        childLeft = getPaddingLeft() + x;
                        childTop = (getPaddingTop() + y) - childHeight;
                        break;
                    case 8:
                        childLeft = (getPaddingLeft() + x) - (childWidth / 2);
                        childTop = (getPaddingTop() + y) - childHeight;
                        break;
                    case 9:
                        childLeft = (getPaddingLeft() + x) - childWidth;
                        childTop = (getPaddingTop() + y) - childHeight;
                        break;
                }
                int childLeft2 = childLeft + lp.offsetX;
                int childTop2 = childTop + lp.offsetY;
                child.layout(childLeft2, childTop2, childLeft2 + childWidth, childTop2 + childHeight);
            }
        }
        if (!isLayoutOccurred()) {
            this.mLayoutOccurred = true;
            Iterator i$ = this.mOnFirstLayoutListeners.iterator();
            while (i$.hasNext()) {
                OnFirstLayoutListener listener = i$.next();
                listener.onFirstLayout(this, l, t, r, b);
            }
            this.mOnFirstLayoutListeners.clear();
        }
        this.mProjection = null;
    }

    public void addOnFirstLayoutListener(OnFirstLayoutListener listener) {
        if (!isLayoutOccurred()) {
            this.mOnFirstLayoutListeners.add(listener);
        }
    }

    public void removeOnFirstLayoutListener(OnFirstLayoutListener listener) {
        this.mOnFirstLayoutListeners.remove(listener);
    }

    public boolean isLayoutOccurred() {
        return this.mLayoutOccurred;
    }

    public void onDetach() {
        getOverlayManager().onDetach(this);
        this.mTileProvider.detach();
    }

    @Override // android.view.View, android.view.KeyEvent.Callback
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        boolean result = getOverlayManager().onKeyDown(keyCode, event, this);
        return result || super.onKeyDown(keyCode, event);
    }

    @Override // android.view.View, android.view.KeyEvent.Callback
    public boolean onKeyUp(int keyCode, KeyEvent event) {
        boolean result = getOverlayManager().onKeyUp(keyCode, event, this);
        return result || super.onKeyUp(keyCode, event);
    }

    @Override // android.view.View
    public boolean onTrackballEvent(MotionEvent event) {
        if (getOverlayManager().onTrackballEvent(event, this)) {
            return true;
        }
        scrollBy((int) (event.getX() * 25.0f), (int) (event.getY() * 25.0f));
        return super.onTrackballEvent(event);
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchTouchEvent(MotionEvent event) {
        if (this.mZoomController.isVisible() && this.mZoomController.onTouch(this, event)) {
            return true;
        }
        MotionEvent rotatedEvent = rotateTouchEvent(event);
        try {
            if (super.dispatchTouchEvent(event)) {
                return true;
            }
            if (getOverlayManager().onTouchEvent(rotatedEvent, this)) {
                if (rotatedEvent != event) {
                    rotatedEvent.recycle();
                }
                return true;
            }
            boolean handled = false;
            if (this.mMultiTouchController != null && this.mMultiTouchController.onTouchEvent(event)) {
                handled = true;
            }
            if (this.mGestureDetector.onTouchEvent(rotatedEvent)) {
                handled = true;
            }
            if (handled) {
                if (rotatedEvent != event) {
                    rotatedEvent.recycle();
                }
                return true;
            }
            if (rotatedEvent == event) {
                return false;
            }
            rotatedEvent.recycle();
            return false;
        } finally {
            if (rotatedEvent != event) {
                rotatedEvent.recycle();
            }
        }
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent event) {
        return false;
    }

    private MotionEvent rotateTouchEvent(MotionEvent ev) {
        if (getMapOrientation() == 0.0f) {
            return ev;
        }
        MotionEvent rotatedEvent = MotionEvent.obtain(ev);
        if (Build.VERSION.SDK_INT < 11) {
            getProjection().unrotateAndScalePoint((int) ev.getX(), (int) ev.getY(), this.mRotateScalePoint);
            rotatedEvent.setLocation(this.mRotateScalePoint.x, this.mRotateScalePoint.y);
        } else {
            try {
                if (sMotionEventTransformMethod == null) {
                    sMotionEventTransformMethod = MotionEvent.class.getDeclaredMethod("transform", Matrix.class);
                }
                sMotionEventTransformMethod.invoke(rotatedEvent, getProjection().getInvertedScaleRotateCanvasMatrix());
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (IllegalArgumentException e2) {
                e2.printStackTrace();
            } catch (NoSuchMethodException e3) {
                e3.printStackTrace();
            } catch (SecurityException e4) {
                e4.printStackTrace();
            } catch (InvocationTargetException e5) {
                e5.printStackTrace();
            }
        }
        return rotatedEvent;
    }

    @Override // android.view.View
    public void computeScroll() {
        if (this.mScroller.computeScrollOffset()) {
            if (this.mScroller.isFinished()) {
                scrollTo(this.mScroller.getCurrX(), this.mScroller.getCurrY());
                setZoomLevel(this.mZoomLevel);
                this.mIsFlinging = false;
            } else {
                scrollTo(this.mScroller.getCurrX(), this.mScroller.getCurrY());
            }
            postInvalidate();
        }
    }

    @Override // android.view.View
    public void scrollTo(int x, int y) {
        int worldSize = TileSystem.MapSize(getZoomLevel(false));
        while (x < 0) {
            x += worldSize;
        }
        while (x >= worldSize) {
            x -= worldSize;
        }
        while (y < 0) {
            y += worldSize;
        }
        while (y >= worldSize) {
            y -= worldSize;
        }
        if (this.mScrollableAreaLimit != null) {
            int zoomDiff = TileSystem.getMaximumZoomLevel() - getZoomLevel(false);
            int minX = this.mScrollableAreaLimit.left >> zoomDiff;
            int minY = this.mScrollableAreaLimit.top >> zoomDiff;
            int maxX = this.mScrollableAreaLimit.right >> zoomDiff;
            int maxY = this.mScrollableAreaLimit.bottom >> zoomDiff;
            int scrollableWidth = maxX - minX;
            int scrollableHeight = maxY - minY;
            int width = getWidth();
            int height = getHeight();
            if (scrollableWidth <= width) {
                if (x > minX) {
                    x = minX;
                } else if (x + width < maxX) {
                    x = maxX - width;
                }
            } else if (x < minX) {
                x = minX;
            } else if (x + width > maxX) {
                x = maxX - width;
            }
            if (scrollableHeight <= height) {
                if (y > minY) {
                    y = minY;
                } else if (y + height < maxY) {
                    y = maxY - height;
                }
            } else if (y - 0 < minY) {
                y = minY + 0;
            } else if (y + height > maxY) {
                y = maxY - height;
            }
        }
        super.scrollTo(x, y);
        this.mProjection = null;
        if (getMapOrientation() != 0.0f) {
            onLayout(true, getLeft(), getTop(), getRight(), getBottom());
        }
        if (this.mListener != null) {
            ScrollEvent event = new ScrollEvent(this, x, y);
            this.mListener.onScroll(event);
        }
    }

    @Override // android.view.View, org.osmdroid.api.IMapView
    public void setBackgroundColor(int pColor) {
        this.mMapOverlay.setLoadingBackgroundColor(pColor);
        invalidate();
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void dispatchDraw(Canvas c) {
        System.currentTimeMillis();
        c.save();
        this.mRotateScaleMatrix.reset();
        c.translate(getScrollX(), getScrollY());
        this.mRotateScaleMatrix.preScale(this.mMultiTouchScale, this.mMultiTouchScale, this.mMultiTouchScalePoint.x, this.mMultiTouchScalePoint.y);
        this.mRotateScaleMatrix.preRotate(this.mapOrientation, getWidth() / 2, getHeight() / 2);
        c.concat(this.mRotateScaleMatrix);
        this.mProjection = new Projection(this);
        getOverlayManager().onDraw(c, this);
        c.restore();
        super.dispatchDraw(c);
    }

    @Override // android.view.ViewGroup, android.view.View
    protected void onDetachedFromWindow() {
        this.mZoomController.setVisible(false);
        onDetach();
        super.onDetachedFromWindow();
    }

    public boolean isAnimating() {
        return this.mIsAnimating.get();
    }

    @Override // org.metalev.multitouch.controller.MultiTouchController.MultiTouchObjectCanvas
    public Object getDraggableObjectAtPoint(MultiTouchController.PointInfo pt) {
        if (isAnimating()) {
            return null;
        }
        this.mMultiTouchScalePoint.x = pt.getX();
        this.mMultiTouchScalePoint.y = pt.getY();
        return this;
    }

    @Override // org.metalev.multitouch.controller.MultiTouchController.MultiTouchObjectCanvas
    public void getPositionAndScale(Object obj, MultiTouchController.PositionAndScale objPosAndScaleOut) {
        objPosAndScaleOut.set(0.0f, 0.0f, true, this.mMultiTouchScale, false, 0.0f, 0.0f, false, 0.0f);
    }

    @Override // org.metalev.multitouch.controller.MultiTouchController.MultiTouchObjectCanvas
    public void selectObject(Object obj, MultiTouchController.PointInfo pt) {
        if (obj == null && this.mMultiTouchScale != 1.0f) {
            float scaleDiffFloat = (float) (Math.log(this.mMultiTouchScale) * ZOOM_LOG_BASE_INV);
            int scaleDiffInt = Math.round(scaleDiffFloat);
            if (scaleDiffInt != 0) {
                Rect screenRect = getProjection().getScreenRect();
                getProjection().unrotateAndScalePoint(screenRect.centerX(), screenRect.centerY(), this.mRotateScalePoint);
                Point p = getProjection().toMercatorPixels(this.mRotateScalePoint.x, this.mRotateScalePoint.y, null);
                scrollTo(p.x - (getWidth() / 2), p.y - (getHeight() / 2));
            }
            setZoomLevel(this.mZoomLevel + scaleDiffInt);
        }
        this.mMultiTouchScale = 1.0f;
    }

    @Override // org.metalev.multitouch.controller.MultiTouchController.MultiTouchObjectCanvas
    public boolean setPositionAndScale(Object obj, MultiTouchController.PositionAndScale aNewObjPosAndScale, MultiTouchController.PointInfo aTouchPoint) {
        float multiTouchScale = aNewObjPosAndScale.getScale();
        if (multiTouchScale > 1.0f && !canZoomIn()) {
            multiTouchScale = 1.0f;
        }
        if (multiTouchScale < 1.0f && !canZoomOut()) {
            multiTouchScale = 1.0f;
        }
        this.mMultiTouchScale = multiTouchScale;
        requestLayout();
        invalidate();
        return true;
    }

    public void setMapListener(MapListener ml) {
        this.mListener = ml;
    }

    private void checkZoomButtons() {
        this.mZoomController.setZoomInEnabled(canZoomIn());
        this.mZoomController.setZoomOutEnabled(canZoomOut());
    }

    public void setBuiltInZoomControls(boolean on) {
        this.mEnableZoomController = on;
        checkZoomButtons();
    }

    public void setMultiTouchControls(boolean on) {
        this.mMultiTouchController = on ? new MultiTouchController<>(this, false) : null;
    }

    private ITileSource getTileSourceFromAttributes(AttributeSet aAttributeSet) {
        String tileSourceAttr;
        ITileSource tileSource = TileSourceFactory.DEFAULT_TILE_SOURCE;
        if (aAttributeSet != null && (tileSourceAttr = aAttributeSet.getAttributeValue(null, "tilesource")) != null) {
            try {
                ITileSource r = TileSourceFactory.getTileSource(tileSourceAttr);
                Log.i(IMapView.LOGTAG, "Using tile source specified in layout attributes: " + r);
                tileSource = r;
            } catch (IllegalArgumentException e) {
                Log.w(IMapView.LOGTAG, "Invalid tile source specified in layout attributes: " + tileSource);
            }
        }
        if (aAttributeSet != null && (tileSource instanceof IStyledTileSource)) {
            String style = aAttributeSet.getAttributeValue(null, "style");
            if (style == null) {
                Log.i(IMapView.LOGTAG, "Using default style: 1");
            } else {
                Log.i(IMapView.LOGTAG, "Using style specified in layout attributes: " + style);
                ((IStyledTileSource) tileSource).setStyle(style);
            }
        }
        Log.i(IMapView.LOGTAG, "Using tile source: " + tileSource);
        return tileSource;
    }

    public void setFlingEnabled(boolean b) {
        this.enableFling = b;
    }

    public boolean isFlingEnabled() {
        return this.enableFling;
    }

    /* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/views/MapView$MapViewGestureDetectorListener.class */
    private class MapViewGestureDetectorListener implements GestureDetector.OnGestureListener {
        private MapViewGestureDetectorListener() {
        }

        @Override // android.view.GestureDetector.OnGestureListener
        public boolean onDown(MotionEvent e) {
            if (MapView.this.mIsFlinging) {
                MapView.this.mScroller.abortAnimation();
                MapView.this.mIsFlinging = false;
            }
            if (!MapView.this.getOverlayManager().onDown(e, MapView.this)) {
                MapView.this.mZoomController.setVisible(MapView.this.mEnableZoomController);
                return true;
            }
            return true;
        }

        @Override // android.view.GestureDetector.OnGestureListener
        public boolean onFling(MotionEvent e1, MotionEvent e2, float velocityX, float velocityY) {
            if (!MapView.this.enableFling) {
                return false;
            }
            if (MapView.this.getOverlayManager().onFling(e1, e2, velocityX, velocityY, MapView.this)) {
                return true;
            }
            int worldSize = TileSystem.MapSize(MapView.this.getZoomLevel(false));
            MapView.this.mIsFlinging = true;
            MapView.this.mScroller.fling(MapView.this.getScrollX(), MapView.this.getScrollY(), (int) (-velocityX), (int) (-velocityY), -worldSize, worldSize, -worldSize, worldSize);
            return true;
        }

        @Override // android.view.GestureDetector.OnGestureListener
        public void onLongPress(MotionEvent e) {
            if (MapView.this.mMultiTouchController != null && MapView.this.mMultiTouchController.isPinching()) {
                return;
            }
            MapView.this.getOverlayManager().onLongPress(e, MapView.this);
        }

        @Override // android.view.GestureDetector.OnGestureListener
        public boolean onScroll(MotionEvent e1, MotionEvent e2, float distanceX, float distanceY) {
            if (MapView.this.getOverlayManager().onScroll(e1, e2, distanceX, distanceY, MapView.this)) {
                return true;
            }
            MapView.this.scrollBy((int) distanceX, (int) distanceY);
            return true;
        }

        @Override // android.view.GestureDetector.OnGestureListener
        public void onShowPress(MotionEvent e) {
            MapView.this.getOverlayManager().onShowPress(e, MapView.this);
        }

        @Override // android.view.GestureDetector.OnGestureListener
        public boolean onSingleTapUp(MotionEvent e) {
            if (MapView.this.getOverlayManager().onSingleTapUp(e, MapView.this)) {
                return true;
            }
            return false;
        }
    }

    /* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/views/MapView$MapViewDoubleClickListener.class */
    private class MapViewDoubleClickListener implements GestureDetector.OnDoubleTapListener {
        private MapViewDoubleClickListener() {
        }

        @Override // android.view.GestureDetector.OnDoubleTapListener
        public boolean onDoubleTap(MotionEvent e) {
            if (MapView.this.getOverlayManager().onDoubleTap(e, MapView.this)) {
                return true;
            }
            MapView.this.getProjection().rotateAndScalePoint((int) e.getX(), (int) e.getY(), MapView.this.mRotateScalePoint);
            return MapView.this.zoomInFixing(MapView.this.mRotateScalePoint.x, MapView.this.mRotateScalePoint.y);
        }

        @Override // android.view.GestureDetector.OnDoubleTapListener
        public boolean onDoubleTapEvent(MotionEvent e) {
            if (MapView.this.getOverlayManager().onDoubleTapEvent(e, MapView.this)) {
                return true;
            }
            return false;
        }

        @Override // android.view.GestureDetector.OnDoubleTapListener
        public boolean onSingleTapConfirmed(MotionEvent e) {
            if (MapView.this.getOverlayManager().onSingleTapConfirmed(e, MapView.this)) {
                return true;
            }
            return false;
        }
    }

    /* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/views/MapView$MapViewZoomListener.class */
    private class MapViewZoomListener implements ZoomButtonsController.OnZoomListener {
        private MapViewZoomListener() {
        }

        @Override // android.widget.ZoomButtonsController.OnZoomListener
        public void onZoom(boolean zoomIn) {
            if (zoomIn) {
                MapView.this.getController().zoomIn();
            } else {
                MapView.this.getController().zoomOut();
            }
        }

        @Override // android.widget.ZoomButtonsController.OnZoomListener
        public void onVisibilityChanged(boolean visible) {
        }
    }

    /* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/views/MapView$LayoutParams.class */
    public static class LayoutParams extends ViewGroup.LayoutParams {
        public static final int TOP_LEFT = 1;
        public static final int TOP_CENTER = 2;
        public static final int TOP_RIGHT = 3;
        public static final int CENTER_LEFT = 4;
        public static final int CENTER = 5;
        public static final int CENTER_RIGHT = 6;
        public static final int BOTTOM_LEFT = 7;
        public static final int BOTTOM_CENTER = 8;
        public static final int BOTTOM_RIGHT = 9;
        public IGeoPoint geoPoint;
        public int alignment;
        public int offsetX;
        public int offsetY;

        public LayoutParams(int width, int height, IGeoPoint geoPoint, int alignment, int offsetX, int offsetY) {
            super(width, height);
            if (geoPoint != null) {
                this.geoPoint = geoPoint;
            } else {
                this.geoPoint = new GeoPoint(0, 0);
            }
            this.alignment = alignment;
            this.offsetX = offsetX;
            this.offsetY = offsetY;
        }

        public LayoutParams(Context c, AttributeSet attrs) {
            super(c, attrs);
            this.geoPoint = new GeoPoint(0, 0);
            this.alignment = 8;
        }

        public LayoutParams(ViewGroup.LayoutParams source) {
            super(source);
        }
    }

    public void setTileProvider(MapTileProviderBase base) {
        this.mTileProvider.detach();
        this.mTileProvider.clearTileCache();
        this.mTileProvider = base;
        this.mTileProvider.setTileRequestCompleteHandler(this.mTileRequestCompleteHandler);
        updateTileSizeForDensity(this.mTileProvider.getTileSource());
        this.mMapOverlay = new TilesOverlay(this.mTileProvider, this.mResourceProxy);
        this.mOverlayManager.setTilesOverlay(this.mMapOverlay);
        invalidate();
    }
}
