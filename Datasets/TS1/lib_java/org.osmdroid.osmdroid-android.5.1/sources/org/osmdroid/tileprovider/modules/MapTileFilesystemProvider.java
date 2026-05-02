package org.osmdroid.tileprovider.modules;

import android.graphics.drawable.Drawable;
import android.util.Log;
import java.io.File;
import java.util.concurrent.atomic.AtomicReference;
import microsoft.mappoint.TileSystem;
import org.osmdroid.api.IMapView;
import org.osmdroid.tileprovider.ExpirableBitmapDrawable;
import org.osmdroid.tileprovider.IRegisterReceiver;
import org.osmdroid.tileprovider.MapTile;
import org.osmdroid.tileprovider.MapTileRequestState;
import org.osmdroid.tileprovider.constants.OpenStreetMapTileProviderConstants;
import org.osmdroid.tileprovider.modules.MapTileModuleProviderBase;
import org.osmdroid.tileprovider.tilesource.BitmapTileSourceBase;
import org.osmdroid.tileprovider.tilesource.ITileSource;
import org.osmdroid.tileprovider.tilesource.TileSourceFactory;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/tileprovider/modules/MapTileFilesystemProvider.class */
public class MapTileFilesystemProvider extends MapTileFileStorageProviderBase {
    private final long mMaximumCachedFileAge;
    private DatabaseFileArchive databaseFileArchive;
    private final AtomicReference<ITileSource> mTileSource;

    public MapTileFilesystemProvider(IRegisterReceiver pRegisterReceiver) {
        this(pRegisterReceiver, TileSourceFactory.DEFAULT_TILE_SOURCE);
    }

    public MapTileFilesystemProvider(IRegisterReceiver pRegisterReceiver, ITileSource aTileSource) {
        this(pRegisterReceiver, aTileSource, 604800000L);
    }

    public MapTileFilesystemProvider(IRegisterReceiver pRegisterReceiver, ITileSource pTileSource, long pMaximumCachedFileAge) {
        this(pRegisterReceiver, pTileSource, pMaximumCachedFileAge, 8, 40);
    }

    public MapTileFilesystemProvider(IRegisterReceiver pRegisterReceiver, ITileSource pTileSource, long pMaximumCachedFileAge, int pThreadPoolSize, int pPendingQueueSize) {
        super(pRegisterReceiver, pThreadPoolSize, pPendingQueueSize);
        this.mTileSource = new AtomicReference<>();
        setTileSource(pTileSource);
        this.mMaximumCachedFileAge = pMaximumCachedFileAge;
    }

    @Override // org.osmdroid.tileprovider.modules.MapTileModuleProviderBase
    public boolean getUsesDataConnection() {
        return false;
    }

    @Override // org.osmdroid.tileprovider.modules.MapTileModuleProviderBase
    protected String getName() {
        return "File System Cache Provider";
    }

    @Override // org.osmdroid.tileprovider.modules.MapTileModuleProviderBase
    protected String getThreadGroupName() {
        return "filesystem";
    }

    @Override // org.osmdroid.tileprovider.modules.MapTileModuleProviderBase
    protected Runnable getTileLoader() {
        return new TileLoader();
    }

    @Override // org.osmdroid.tileprovider.modules.MapTileModuleProviderBase
    public int getMinimumZoomLevel() {
        ITileSource tileSource = this.mTileSource.get();
        if (tileSource != null) {
            return tileSource.getMinimumZoomLevel();
        }
        return 0;
    }

    @Override // org.osmdroid.tileprovider.modules.MapTileModuleProviderBase
    public int getMaximumZoomLevel() {
        ITileSource tileSource = this.mTileSource.get();
        return tileSource != null ? tileSource.getMaximumZoomLevel() : TileSystem.getMaximumZoomLevel();
    }

    @Override // org.osmdroid.tileprovider.modules.MapTileModuleProviderBase
    public void setTileSource(ITileSource pTileSource) {
        this.mTileSource.set(pTileSource);
    }

    /* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/tileprovider/modules/MapTileFilesystemProvider$TileLoader.class */
    protected class TileLoader extends MapTileModuleProviderBase.TileLoader {
        protected TileLoader() {
            super();
        }

        @Override // org.osmdroid.tileprovider.modules.MapTileModuleProviderBase.TileLoader
        public Drawable loadTile(MapTileRequestState pState) throws MapTileModuleProviderBase.CantContinueException {
            ITileSource tileSource = (ITileSource) MapTileFilesystemProvider.this.mTileSource.get();
            if (tileSource == null) {
                return null;
            }
            MapTile tile = pState.getMapTile();
            if (!MapTileFilesystemProvider.this.getSdCardAvailable()) {
                if (OpenStreetMapTileProviderConstants.DEBUGMODE) {
                    Log.d(IMapView.LOGTAG, "No sdcard - do nothing for tile: " + tile);
                    return null;
                }
                return null;
            }
            File file = new File(OpenStreetMapTileProviderConstants.TILE_PATH_BASE, tileSource.getTileRelativeFilenameString(tile) + OpenStreetMapTileProviderConstants.TILE_PATH_EXTENSION);
            if (file.exists()) {
                try {
                    Drawable drawable = tileSource.getDrawable(file.getPath());
                    long now = System.currentTimeMillis();
                    long lastModified = file.lastModified();
                    boolean fileExpired = lastModified < now - MapTileFilesystemProvider.this.mMaximumCachedFileAge;
                    if (fileExpired && drawable != null) {
                        if (OpenStreetMapTileProviderConstants.DEBUGMODE) {
                            Log.d(IMapView.LOGTAG, "Tile expired: " + tile);
                        }
                        ExpirableBitmapDrawable.setDrawableExpired(drawable);
                    }
                    return drawable;
                } catch (BitmapTileSourceBase.LowMemoryException e) {
                    Log.w(IMapView.LOGTAG, "LowMemoryException downloading MapTile: " + tile + " : " + e);
                    throw new MapTileModuleProviderBase.CantContinueException(e);
                }
            }
            return null;
        }
    }
}
