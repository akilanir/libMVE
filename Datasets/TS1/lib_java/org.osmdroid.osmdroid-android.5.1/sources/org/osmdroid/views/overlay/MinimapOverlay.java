package org.osmdroid.views.overlay;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.view.MotionEvent;
import org.osmdroid.tileprovider.MapTileProviderBase;
import org.osmdroid.tileprovider.MapTileProviderBasic;
import org.osmdroid.tileprovider.tilesource.ITileSource;
import org.osmdroid.util.TileSystem;
import org.osmdroid.views.MapView;
import org.osmdroid.views.Projection;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/views/overlay/MinimapOverlay.class */
public class MinimapOverlay extends TilesOverlay {
    private int mWidth;
    private int mHeight;
    private int mPadding;
    private int mZoomDifference;
    private final Paint mPaint;
    private final Rect mTileArea;
    private final Rect mMiniMapCanvasRect;
    private final Rect mIntersectionRect;
    private Projection mProjection;
    private Point mTopLeftMercator;
    private Point mBottomRightMercator;

    public MinimapOverlay(Context pContext, Handler pTileRequestCompleteHandler, MapTileProviderBase pTileProvider, int pZoomDifference) {
        super(pTileProvider, pContext);
        this.mWidth = 100;
        this.mHeight = 100;
        this.mPadding = 10;
        this.mTileArea = new Rect();
        this.mMiniMapCanvasRect = new Rect();
        this.mIntersectionRect = new Rect();
        this.mTopLeftMercator = new Point();
        this.mBottomRightMercator = new Point();
        setZoomDifference(pZoomDifference);
        this.mTileProvider.setTileRequestCompleteHandler(pTileRequestCompleteHandler);
        setLoadingLineColor(getLoadingBackgroundColor());
        float density = pContext.getResources().getDisplayMetrics().density;
        this.mWidth = (int) (this.mWidth * density);
        this.mHeight = (int) (this.mHeight * density);
        this.mPaint = new Paint();
        this.mPaint.setColor(-7829368);
        this.mPaint.setStyle(Paint.Style.FILL);
        this.mPaint.setStrokeWidth(2.0f);
    }

    public MinimapOverlay(Context pContext, Handler pTileRequestCompleteHandler, MapTileProviderBase pTileProvider) {
        this(pContext, pTileRequestCompleteHandler, pTileProvider, 3);
    }

    public MinimapOverlay(Context pContext, Handler pTileRequestCompleteHandler) {
        this(pContext, pTileRequestCompleteHandler, new MapTileProviderBasic(pContext));
    }

    public void setTileSource(ITileSource pTileSource) {
        this.mTileProvider.setTileSource(pTileSource);
    }

    public int getZoomDifference() {
        return this.mZoomDifference;
    }

    public void setZoomDifference(int zoomDifference) {
        this.mZoomDifference = zoomDifference;
    }

    @Override // org.osmdroid.views.overlay.TilesOverlay, org.osmdroid.views.overlay.Overlay
    protected void draw(Canvas c, MapView osmv, boolean shadow) {
        if (shadow || osmv.isAnimating()) {
            return;
        }
        this.mProjection = osmv.getProjection();
        int zoomLevel = this.mProjection.getZoomLevel();
        Rect screenRect = this.mProjection.getScreenRect();
        this.mProjection.toMercatorPixels(screenRect.left, screenRect.top, this.mTopLeftMercator);
        this.mProjection.toMercatorPixels(screenRect.right, screenRect.bottom, this.mBottomRightMercator);
        this.mTileArea.set(this.mTopLeftMercator.x, this.mTopLeftMercator.y, this.mBottomRightMercator.x, this.mBottomRightMercator.y);
        int miniMapZoomLevelDifference = getZoomDifference();
        if (zoomLevel - getZoomDifference() < this.mTileProvider.getMinimumZoomLevel()) {
            miniMapZoomLevelDifference += (zoomLevel - getZoomDifference()) - this.mTileProvider.getMinimumZoomLevel();
        }
        this.mTileArea.set(this.mTileArea.left >> miniMapZoomLevelDifference, this.mTileArea.top >> miniMapZoomLevelDifference, this.mTileArea.right >> miniMapZoomLevelDifference, this.mTileArea.bottom >> miniMapZoomLevelDifference);
        this.mTileArea.set(this.mTileArea.centerX() - (getWidth() / 2), this.mTileArea.centerY() - (getHeight() / 2), this.mTileArea.centerX() + (getWidth() / 2), this.mTileArea.centerY() + (getHeight() / 2));
        this.mMiniMapCanvasRect.set((screenRect.right - getPadding()) - getWidth(), (screenRect.bottom - getPadding()) - getHeight(), screenRect.right - getPadding(), screenRect.bottom - getPadding());
        c.drawRect(this.mMiniMapCanvasRect.left - 2, this.mMiniMapCanvasRect.top - 2, this.mMiniMapCanvasRect.right + 2, this.mMiniMapCanvasRect.bottom + 2, this.mPaint);
        super.drawTiles(c, this.mProjection, this.mProjection.getZoomLevel() - miniMapZoomLevelDifference, TileSystem.getTileSize(), this.mTileArea);
    }

    @Override // org.osmdroid.views.overlay.TilesOverlay
    protected void onTileReadyToDraw(Canvas c, Drawable currentMapTile, Rect tileRect) {
        int xOffset = (tileRect.left - this.mTileArea.left) + this.mMiniMapCanvasRect.left;
        int yOffset = (tileRect.top - this.mTileArea.top) + this.mMiniMapCanvasRect.top;
        currentMapTile.setBounds(xOffset, yOffset, xOffset + tileRect.width(), yOffset + tileRect.height());
        c.save();
        if (this.mIntersectionRect.setIntersect(c.getClipBounds(), this.mMiniMapCanvasRect)) {
            c.clipRect(this.mIntersectionRect);
            currentMapTile.draw(c);
        }
        c.restore();
    }

    @Override // org.osmdroid.views.overlay.Overlay
    public boolean onSingleTapUp(MotionEvent pEvent, MapView pMapView) {
        if (this.mMiniMapCanvasRect.contains((int) pEvent.getX(), (int) pEvent.getY())) {
            return true;
        }
        return false;
    }

    @Override // org.osmdroid.views.overlay.Overlay
    public boolean onDoubleTap(MotionEvent pEvent, MapView pMapView) {
        if (this.mMiniMapCanvasRect.contains((int) pEvent.getX(), (int) pEvent.getY())) {
            return true;
        }
        return false;
    }

    @Override // org.osmdroid.views.overlay.Overlay
    public boolean onLongPress(MotionEvent pEvent, MapView pMapView) {
        if (this.mMiniMapCanvasRect.contains((int) pEvent.getX(), (int) pEvent.getY())) {
            return true;
        }
        return false;
    }

    @Override // org.osmdroid.views.overlay.TilesOverlay, org.osmdroid.views.overlay.IOverlayMenuProvider
    public boolean isOptionsMenuEnabled() {
        return false;
    }

    public void setWidth(int width) {
        this.mWidth = width;
    }

    public int getWidth() {
        return this.mWidth;
    }

    public void setHeight(int height) {
        this.mHeight = height;
    }

    public int getHeight() {
        return this.mHeight;
    }

    public void setPadding(int padding) {
        this.mPadding = padding;
    }

    public int getPadding() {
        return this.mPadding;
    }
}
