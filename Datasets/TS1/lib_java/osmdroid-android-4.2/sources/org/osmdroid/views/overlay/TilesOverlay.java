package org.osmdroid.views.overlay;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.view.Menu;
import android.view.MenuItem;
import android.view.SubMenu;
import org.osmdroid.DefaultResourceProxyImpl;
import org.osmdroid.ResourceProxy;
import org.osmdroid.tileprovider.MapTile;
import org.osmdroid.tileprovider.MapTileProviderBase;
import org.osmdroid.tileprovider.ReusableBitmapDrawable;
import org.osmdroid.tileprovider.tilesource.ITileSource;
import org.osmdroid.tileprovider.tilesource.TileSourceFactory;
import org.osmdroid.util.TileLooper;
import org.osmdroid.util.TileSystem;
import org.osmdroid.views.MapView;
import org.osmdroid.views.Projection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/* loaded from: osmdroid-android-4.2.jar:org/osmdroid/views/overlay/TilesOverlay.class */
public class TilesOverlay extends Overlay implements IOverlayMenuProvider {
    private static final Logger logger = LoggerFactory.getLogger(TilesOverlay.class);
    public static final int MENU_MAP_MODE = getSafeMenuId();
    public static final int MENU_TILE_SOURCE_STARTING_ID = getSafeMenuIdSequence(TileSourceFactory.getTileSources().size());
    public static final int MENU_OFFLINE = getSafeMenuId();
    protected final MapTileProviderBase mTileProvider;
    protected final Paint mDebugPaint;
    private final Rect mTileRect;
    private final Point mTilePoint;
    private final Rect mViewPort;
    private Point mTopLeftMercator;
    private Point mBottomRightMercator;
    private Point mTilePointMercator;
    private Projection mProjection;
    private boolean mOptionsMenuEnabled;
    private BitmapDrawable mLoadingTile;
    private int mLoadingBackgroundColor;
    private int mLoadingLineColor;
    private int mOvershootTileCache;
    private final TileLooper mTileLooper;

    public TilesOverlay(MapTileProviderBase aTileProvider, Context aContext) {
        this(aTileProvider, new DefaultResourceProxyImpl(aContext));
    }

    public TilesOverlay(MapTileProviderBase aTileProvider, ResourceProxy pResourceProxy) {
        super(pResourceProxy);
        this.mDebugPaint = new Paint();
        this.mTileRect = new Rect();
        this.mTilePoint = new Point();
        this.mViewPort = new Rect();
        this.mTopLeftMercator = new Point();
        this.mBottomRightMercator = new Point();
        this.mTilePointMercator = new Point();
        this.mOptionsMenuEnabled = true;
        this.mLoadingTile = null;
        this.mLoadingBackgroundColor = Color.rgb(216, 208, 208);
        this.mLoadingLineColor = Color.rgb(200, 192, 192);
        this.mOvershootTileCache = 0;
        this.mTileLooper = new TileLooper() { // from class: org.osmdroid.views.overlay.TilesOverlay.1
            @Override // org.osmdroid.util.TileLooper
            public void initialiseLoop(int pZoomLevel, int pTileSizePx) {
                int numNeeded = ((this.mLowerRight.y - this.mUpperLeft.y) + 1) * ((this.mLowerRight.x - this.mUpperLeft.x) + 1);
                TilesOverlay.this.mTileProvider.ensureCapacity(numNeeded + TilesOverlay.this.mOvershootTileCache);
            }

            @Override // org.osmdroid.util.TileLooper
            public void handleTile(Canvas pCanvas, int pTileSizePx, MapTile pTile, int pX, int pY) {
                Drawable currentMapTile = TilesOverlay.this.mTileProvider.getMapTile(pTile);
                boolean isReusable = currentMapTile instanceof ReusableBitmapDrawable;
                ReusableBitmapDrawable reusableBitmapDrawable = isReusable ? (ReusableBitmapDrawable) currentMapTile : null;
                if (currentMapTile == null) {
                    currentMapTile = TilesOverlay.this.getLoadingTile();
                }
                if (currentMapTile != null) {
                    TilesOverlay.this.mTilePoint.set(pX * pTileSizePx, pY * pTileSizePx);
                    TilesOverlay.this.mTileRect.set(TilesOverlay.this.mTilePoint.x, TilesOverlay.this.mTilePoint.y, TilesOverlay.this.mTilePoint.x + pTileSizePx, TilesOverlay.this.mTilePoint.y + pTileSizePx);
                    if (isReusable) {
                        reusableBitmapDrawable.beginUsingDrawable();
                    }
                    if (isReusable) {
                        try {
                            if (!((ReusableBitmapDrawable) currentMapTile).isBitmapValid()) {
                                currentMapTile = TilesOverlay.this.getLoadingTile();
                                isReusable = false;
                            }
                        } catch (Throwable th) {
                            if (isReusable) {
                                reusableBitmapDrawable.finishUsingDrawable();
                            }
                            throw th;
                        }
                    }
                    TilesOverlay.this.onTileReadyToDraw(pCanvas, currentMapTile, TilesOverlay.this.mTileRect);
                    if (isReusable) {
                        reusableBitmapDrawable.finishUsingDrawable();
                    }
                }
            }

            @Override // org.osmdroid.util.TileLooper
            public void finaliseLoop() {
            }
        };
        if (aTileProvider == null) {
            throw new IllegalArgumentException("You must pass a valid tile provider to the tiles overlay.");
        }
        this.mTileProvider = aTileProvider;
    }

    @Override // org.osmdroid.views.overlay.Overlay
    public void onDetach(MapView pMapView) {
        this.mTileProvider.detach();
    }

    public int getMinimumZoomLevel() {
        return this.mTileProvider.getMinimumZoomLevel();
    }

    public int getMaximumZoomLevel() {
        return this.mTileProvider.getMaximumZoomLevel();
    }

    public boolean useDataConnection() {
        return this.mTileProvider.useDataConnection();
    }

    public void setUseDataConnection(boolean aMode) {
        this.mTileProvider.setUseDataConnection(aMode);
    }

    @Override // org.osmdroid.views.overlay.Overlay
    protected void draw(Canvas c, MapView osmv, boolean shadow) {
        if (shadow) {
            return;
        }
        Projection projection = osmv.getProjection();
        Rect screenRect = projection.getScreenRect();
        projection.toMercatorPixels(screenRect.left, screenRect.top, this.mTopLeftMercator);
        projection.toMercatorPixels(screenRect.right, screenRect.bottom, this.mBottomRightMercator);
        this.mViewPort.set(this.mTopLeftMercator.x, this.mTopLeftMercator.y, this.mBottomRightMercator.x, this.mBottomRightMercator.y);
        drawTiles(c, projection, projection.getZoomLevel(), TileSystem.getTileSize(), this.mViewPort);
    }

    public void drawTiles(Canvas c, Projection projection, int zoomLevel, int tileSizePx, Rect viewPort) {
        this.mProjection = projection;
        this.mTileLooper.loop(c, zoomLevel, tileSizePx, viewPort);
    }

    protected void onTileReadyToDraw(Canvas c, Drawable currentMapTile, Rect tileRect) {
        this.mProjection.toPixelsFromMercator(tileRect.left, tileRect.top, this.mTilePointMercator);
        tileRect.offsetTo(this.mTilePointMercator.x, this.mTilePointMercator.y);
        currentMapTile.setBounds(tileRect);
        currentMapTile.draw(c);
    }

    @Override // org.osmdroid.views.overlay.IOverlayMenuProvider
    public void setOptionsMenuEnabled(boolean pOptionsMenuEnabled) {
        this.mOptionsMenuEnabled = pOptionsMenuEnabled;
    }

    public boolean isOptionsMenuEnabled() {
        return this.mOptionsMenuEnabled;
    }

    @Override // org.osmdroid.views.overlay.IOverlayMenuProvider
    public boolean onCreateOptionsMenu(Menu pMenu, int pMenuIdOffset, MapView pMapView) {
        SubMenu mapMenu = pMenu.addSubMenu(0, MENU_MAP_MODE + pMenuIdOffset, 0, this.mResourceProxy.getString(ResourceProxy.string.map_mode)).setIcon(this.mResourceProxy.getDrawable(ResourceProxy.bitmap.ic_menu_mapmode));
        for (int a = 0; a < TileSourceFactory.getTileSources().size(); a++) {
            ITileSource tileSource = TileSourceFactory.getTileSources().get(a);
            mapMenu.add(MENU_MAP_MODE + pMenuIdOffset, MENU_TILE_SOURCE_STARTING_ID + a + pMenuIdOffset, 0, tileSource.localizedName(this.mResourceProxy));
        }
        mapMenu.setGroupCheckable(MENU_MAP_MODE + pMenuIdOffset, true, true);
        String title = pMapView.getResourceProxy().getString(pMapView.useDataConnection() ? ResourceProxy.string.offline_mode : ResourceProxy.string.online_mode);
        Drawable icon = pMapView.getResourceProxy().getDrawable(ResourceProxy.bitmap.ic_menu_offline);
        pMenu.add(0, MENU_OFFLINE + pMenuIdOffset, 0, title).setIcon(icon);
        return true;
    }

    @Override // org.osmdroid.views.overlay.IOverlayMenuProvider
    public boolean onPrepareOptionsMenu(Menu pMenu, int pMenuIdOffset, MapView pMapView) {
        int index = TileSourceFactory.getTileSources().indexOf(pMapView.getTileProvider().getTileSource());
        if (index >= 0) {
            pMenu.findItem(MENU_TILE_SOURCE_STARTING_ID + index + pMenuIdOffset).setChecked(true);
        }
        pMenu.findItem(MENU_OFFLINE + pMenuIdOffset).setTitle(pMapView.getResourceProxy().getString(pMapView.useDataConnection() ? ResourceProxy.string.offline_mode : ResourceProxy.string.online_mode));
        return true;
    }

    @Override // org.osmdroid.views.overlay.IOverlayMenuProvider
    public boolean onOptionsItemSelected(MenuItem pItem, int pMenuIdOffset, MapView pMapView) {
        int menuId = pItem.getItemId() - pMenuIdOffset;
        if (menuId >= MENU_TILE_SOURCE_STARTING_ID && menuId < MENU_TILE_SOURCE_STARTING_ID + TileSourceFactory.getTileSources().size()) {
            pMapView.setTileSource(TileSourceFactory.getTileSources().get(menuId - MENU_TILE_SOURCE_STARTING_ID));
            return true;
        }
        if (menuId == MENU_OFFLINE) {
            boolean useDataConnection = !pMapView.useDataConnection();
            pMapView.setUseDataConnection(useDataConnection);
            return true;
        }
        return false;
    }

    public int getLoadingBackgroundColor() {
        return this.mLoadingBackgroundColor;
    }

    public void setLoadingBackgroundColor(int pLoadingBackgroundColor) {
        if (this.mLoadingBackgroundColor != pLoadingBackgroundColor) {
            this.mLoadingBackgroundColor = pLoadingBackgroundColor;
            clearLoadingTile();
        }
    }

    public int getLoadingLineColor() {
        return this.mLoadingLineColor;
    }

    public void setLoadingLineColor(int pLoadingLineColor) {
        if (this.mLoadingLineColor != pLoadingLineColor) {
            this.mLoadingLineColor = pLoadingLineColor;
            clearLoadingTile();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Drawable getLoadingTile() {
        if (this.mLoadingTile == null && this.mLoadingBackgroundColor != 0) {
            try {
                int tileSize = this.mTileProvider.getTileSource() != null ? this.mTileProvider.getTileSource().getTileSizePixels() : 256;
                Bitmap bitmap = Bitmap.createBitmap(tileSize, tileSize, Bitmap.Config.ARGB_8888);
                Canvas canvas = new Canvas(bitmap);
                Paint paint = new Paint();
                canvas.drawColor(this.mLoadingBackgroundColor);
                paint.setColor(this.mLoadingLineColor);
                paint.setStrokeWidth(0.0f);
                int lineSize = tileSize / 16;
                for (int a = 0; a < tileSize; a += lineSize) {
                    canvas.drawLine(0.0f, a, tileSize, a, paint);
                    canvas.drawLine(a, 0.0f, a, tileSize, paint);
                }
                this.mLoadingTile = new BitmapDrawable(bitmap);
            } catch (OutOfMemoryError e) {
                logger.error("OutOfMemoryError getting loading tile");
                System.gc();
            }
        }
        return this.mLoadingTile;
    }

    private void clearLoadingTile() {
        BitmapDrawable bitmapDrawable = this.mLoadingTile;
        this.mLoadingTile = null;
        if (Build.VERSION.SDK_INT < 9 && bitmapDrawable != null) {
            bitmapDrawable.getBitmap().recycle();
        }
    }

    public void setOvershootTileCache(int overshootTileCache) {
        this.mOvershootTileCache = overshootTileCache;
    }

    public int getOvershootTileCache() {
        return this.mOvershootTileCache;
    }
}
