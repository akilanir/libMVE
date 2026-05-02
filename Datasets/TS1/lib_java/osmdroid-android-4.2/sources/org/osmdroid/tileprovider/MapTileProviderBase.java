package org.osmdroid.tileprovider;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Point;
import android.graphics.Rect;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import java.util.HashMap;
import org.osmdroid.tileprovider.constants.OpenStreetMapTileProviderConstants;
import org.osmdroid.tileprovider.modules.MapTileModuleProviderBase;
import org.osmdroid.tileprovider.tilesource.ITileSource;
import org.osmdroid.util.TileLooper;
import org.osmdroid.views.Projection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/* loaded from: osmdroid-android-4.2.jar:org/osmdroid/tileprovider/MapTileProviderBase.class */
public abstract class MapTileProviderBase implements IMapTileProviderCallback, OpenStreetMapTileProviderConstants {
    private static final Logger logger = LoggerFactory.getLogger(MapTileProviderBase.class);
    protected final MapTileCache mTileCache;
    protected Handler mTileRequestCompleteHandler;
    protected boolean mUseDataConnection;
    private ITileSource mTileSource;

    public abstract Drawable getMapTile(MapTile mapTile);

    public abstract void detach();

    public abstract int getMinimumZoomLevel();

    public abstract int getMaximumZoomLevel();

    public void setTileSource(ITileSource pTileSource) {
        this.mTileSource = pTileSource;
        clearTileCache();
    }

    public ITileSource getTileSource() {
        return this.mTileSource;
    }

    public MapTileCache createTileCache() {
        return new MapTileCache();
    }

    public MapTileProviderBase(ITileSource pTileSource) {
        this(pTileSource, null);
    }

    public MapTileProviderBase(ITileSource pTileSource, Handler pDownloadFinishedListener) {
        this.mUseDataConnection = true;
        this.mTileCache = createTileCache();
        this.mTileRequestCompleteHandler = pDownloadFinishedListener;
        this.mTileSource = pTileSource;
    }

    @Override // org.osmdroid.tileprovider.IMapTileProviderCallback
    public void mapTileRequestCompleted(MapTileRequestState pState, Drawable pDrawable) {
        putTileIntoCache(pState, pDrawable);
        if (this.mTileRequestCompleteHandler != null) {
            this.mTileRequestCompleteHandler.sendEmptyMessage(0);
        }
    }

    @Override // org.osmdroid.tileprovider.IMapTileProviderCallback
    public void mapTileRequestFailed(MapTileRequestState pState) {
        if (this.mTileRequestCompleteHandler != null) {
            this.mTileRequestCompleteHandler.sendEmptyMessage(1);
        }
    }

    @Override // org.osmdroid.tileprovider.IMapTileProviderCallback
    public void mapTileRequestExpiredTile(MapTileRequestState pState, Drawable pDrawable) {
        putExpiredTileIntoCache(pState, pDrawable);
        if (this.mTileRequestCompleteHandler != null) {
            this.mTileRequestCompleteHandler.sendEmptyMessage(0);
        }
    }

    protected void putTileIntoCache(MapTileRequestState pState, Drawable pDrawable) {
        MapTile tile = pState.getMapTile();
        if (pDrawable != null) {
            this.mTileCache.putTile(tile, pDrawable);
        }
    }

    protected void putExpiredTileIntoCache(MapTileRequestState pState, Drawable pDrawable) {
        MapTile tile = pState.getMapTile();
        if (pDrawable != null && !this.mTileCache.containsTile(tile)) {
            this.mTileCache.putTile(tile, pDrawable);
        }
    }

    public void setTileRequestCompleteHandler(Handler handler) {
        this.mTileRequestCompleteHandler = handler;
    }

    public void ensureCapacity(int pCapacity) {
        this.mTileCache.ensureCapacity(pCapacity);
    }

    public void clearTileCache() {
        this.mTileCache.clear();
    }

    @Override // org.osmdroid.tileprovider.IMapTileProviderCallback
    public boolean useDataConnection() {
        return this.mUseDataConnection;
    }

    public void setUseDataConnection(boolean pMode) {
        this.mUseDataConnection = pMode;
    }

    public void rescaleCache(Projection pProjection, int pNewZoomLevel, int pOldZoomLevel, Rect pViewPort) {
        if (pNewZoomLevel == pOldZoomLevel) {
            return;
        }
        long startMs = System.currentTimeMillis();
        logger.info("rescale tile cache from " + pOldZoomLevel + " to " + pNewZoomLevel);
        int tileSize = getTileSource().getTileSizePixels();
        Point topLeftMercator = pProjection.toMercatorPixels(pViewPort.left, pViewPort.top, null);
        Point bottomRightMercator = pProjection.toMercatorPixels(pViewPort.right, pViewPort.bottom, null);
        Rect viewPort = new Rect(topLeftMercator.x, topLeftMercator.y, bottomRightMercator.x, bottomRightMercator.y);
        ScaleTileLooper tileLooper = pNewZoomLevel > pOldZoomLevel ? new ZoomInTileLooper(pOldZoomLevel) : new ZoomOutTileLooper(pOldZoomLevel);
        tileLooper.loop(null, pNewZoomLevel, tileSize, viewPort);
        long endMs = System.currentTimeMillis();
        logger.info("Finished rescale in " + (endMs - startMs) + "ms");
    }

    /* loaded from: osmdroid-android-4.2.jar:org/osmdroid/tileprovider/MapTileProviderBase$ScaleTileLooper.class */
    private abstract class ScaleTileLooper extends TileLooper {
        protected final int mOldZoomLevel;
        protected int mDiff;
        protected int mTileSize_2;
        protected final HashMap<MapTile, Bitmap> mNewTiles = new HashMap<>();
        protected Rect mSrcRect = new Rect();
        protected Rect mDestRect = new Rect();
        protected Paint mDebugPaint = new Paint();

        protected abstract void handleTile(int i, MapTile mapTile, int i2, int i3);

        public ScaleTileLooper(int pOldZoomLevel) {
            this.mOldZoomLevel = pOldZoomLevel;
        }

        @Override // org.osmdroid.util.TileLooper
        public void initialiseLoop(int pZoomLevel, int pTileSizePx) {
            this.mDiff = Math.abs(pZoomLevel - this.mOldZoomLevel);
            this.mTileSize_2 = pTileSizePx >> this.mDiff;
        }

        @Override // org.osmdroid.util.TileLooper
        public void handleTile(Canvas pCanvas, int pTileSizePx, MapTile pTile, int pX, int pY) {
            Drawable requestedTile = MapTileProviderBase.this.getMapTile(pTile);
            if (requestedTile == null) {
                try {
                    handleTile(pTileSizePx, pTile, pX, pY);
                } catch (OutOfMemoryError e) {
                    MapTileProviderBase.logger.error("OutOfMemoryError rescaling cache");
                }
            }
        }

        @Override // org.osmdroid.util.TileLooper
        public void finaliseLoop() {
            while (!this.mNewTiles.isEmpty()) {
                MapTile tile = this.mNewTiles.keySet().iterator().next();
                Bitmap bitmap = this.mNewTiles.remove(tile);
                ExpirableBitmapDrawable drawable = new ReusableBitmapDrawable(bitmap);
                drawable.setState(new int[]{-1});
                Drawable existingTile = MapTileProviderBase.this.mTileCache.getMapTile(tile);
                if (existingTile == null || ExpirableBitmapDrawable.isDrawableExpired(existingTile)) {
                    MapTileProviderBase.this.putExpiredTileIntoCache(new MapTileRequestState(tile, new MapTileModuleProviderBase[0], null), drawable);
                }
            }
        }
    }

    /* loaded from: osmdroid-android-4.2.jar:org/osmdroid/tileprovider/MapTileProviderBase$ZoomInTileLooper.class */
    private class ZoomInTileLooper extends ScaleTileLooper {
        public ZoomInTileLooper(int pOldZoomLevel) {
            super(pOldZoomLevel);
        }

        /* JADX WARN: Removed duplicated region for block: B:18:0x00cd A[Catch: all -> 0x00fb, TryCatch #0 {all -> 0x00fb, blocks: (B:16:0x00c5, B:18:0x00cd), top: B:32:0x00c5 }] */
        @Override // org.osmdroid.tileprovider.MapTileProviderBase.ScaleTileLooper
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public void handleTile(int r8, org.osmdroid.tileprovider.MapTile r9, int r10, int r11) {
            /*
                Method dump skipped, instructions count: 283
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: org.osmdroid.tileprovider.MapTileProviderBase.ZoomInTileLooper.handleTile(int, org.osmdroid.tileprovider.MapTile, int, int):void");
        }
    }

    /* loaded from: osmdroid-android-4.2.jar:org/osmdroid/tileprovider/MapTileProviderBase$ZoomOutTileLooper.class */
    private class ZoomOutTileLooper extends ScaleTileLooper {
        private static final int MAX_ZOOM_OUT_DIFF = 4;

        public ZoomOutTileLooper(int pOldZoomLevel) {
            super(pOldZoomLevel);
        }

        @Override // org.osmdroid.tileprovider.MapTileProviderBase.ScaleTileLooper
        protected void handleTile(int pTileSizePx, MapTile pTile, int pX, int pY) {
            Bitmap oldBitmap;
            if (this.mDiff >= 4) {
                return;
            }
            int xx = pTile.getX() << this.mDiff;
            int yy = pTile.getY() << this.mDiff;
            int numTiles = 1 << this.mDiff;
            Bitmap bitmap = null;
            Canvas canvas = null;
            for (int x = 0; x < numTiles; x++) {
                for (int y = 0; y < numTiles; y++) {
                    MapTile oldTile = new MapTile(this.mOldZoomLevel, xx + x, yy + y);
                    Drawable oldDrawable = MapTileProviderBase.this.mTileCache.getMapTile(oldTile);
                    if ((oldDrawable instanceof BitmapDrawable) && (oldBitmap = ((BitmapDrawable) oldDrawable).getBitmap()) != null) {
                        if (bitmap == null) {
                            bitmap = BitmapPool.getInstance().obtainSizedBitmapFromPool(pTileSizePx, pTileSizePx);
                            if (bitmap == null) {
                                bitmap = Bitmap.createBitmap(pTileSizePx, pTileSizePx, Bitmap.Config.ARGB_8888);
                            }
                            canvas = new Canvas(bitmap);
                            canvas.drawColor(-3355444);
                        }
                        this.mDestRect.set(x * this.mTileSize_2, y * this.mTileSize_2, (x + 1) * this.mTileSize_2, (y + 1) * this.mTileSize_2);
                        if (oldBitmap != null) {
                            canvas.drawBitmap(oldBitmap, (Rect) null, this.mDestRect, (Paint) null);
                            MapTileProviderBase.this.mTileCache.mCachedTiles.remove((Object) oldBitmap);
                        }
                    }
                }
            }
            if (bitmap != null) {
                this.mNewTiles.put(pTile, bitmap);
            }
        }
    }
}
