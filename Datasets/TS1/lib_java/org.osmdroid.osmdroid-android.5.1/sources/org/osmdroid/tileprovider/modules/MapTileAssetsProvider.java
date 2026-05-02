package org.osmdroid.tileprovider.modules;

import android.content.res.AssetManager;
import android.graphics.drawable.Drawable;
import java.io.IOException;
import java.io.InputStream;
import java.util.concurrent.atomic.AtomicReference;
import microsoft.mappoint.TileSystem;
import org.osmdroid.tileprovider.ExpirableBitmapDrawable;
import org.osmdroid.tileprovider.IRegisterReceiver;
import org.osmdroid.tileprovider.MapTile;
import org.osmdroid.tileprovider.MapTileRequestState;
import org.osmdroid.tileprovider.constants.OpenStreetMapTileProviderConstants;
import org.osmdroid.tileprovider.modules.MapTileModuleProviderBase;
import org.osmdroid.tileprovider.tilesource.BitmapTileSourceBase;
import org.osmdroid.tileprovider.tilesource.ITileSource;
import org.osmdroid.tileprovider.tilesource.TileSourceFactory;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/tileprovider/modules/MapTileAssetsProvider.class */
public class MapTileAssetsProvider extends MapTileFileStorageProviderBase {
    private final AssetManager mAssets;
    private final AtomicReference<ITileSource> mTileSource;

    public MapTileAssetsProvider(IRegisterReceiver pRegisterReceiver, AssetManager pAssets) {
        this(pRegisterReceiver, pAssets, TileSourceFactory.DEFAULT_TILE_SOURCE);
    }

    public MapTileAssetsProvider(IRegisterReceiver pRegisterReceiver, AssetManager pAssets, ITileSource pTileSource) {
        this(pRegisterReceiver, pAssets, pTileSource, OpenStreetMapTileProviderConstants.getNumberOfTileDownloadThreads(), 40);
    }

    public MapTileAssetsProvider(IRegisterReceiver pRegisterReceiver, AssetManager pAssets, ITileSource pTileSource, int pThreadPoolSize, int pPendingQueueSize) {
        super(pRegisterReceiver, pThreadPoolSize, pPendingQueueSize);
        this.mTileSource = new AtomicReference<>();
        setTileSource(pTileSource);
        this.mAssets = pAssets;
    }

    @Override // org.osmdroid.tileprovider.modules.MapTileModuleProviderBase
    public boolean getUsesDataConnection() {
        return false;
    }

    @Override // org.osmdroid.tileprovider.modules.MapTileModuleProviderBase
    protected String getName() {
        return "Assets Cache Provider";
    }

    @Override // org.osmdroid.tileprovider.modules.MapTileModuleProviderBase
    protected String getThreadGroupName() {
        return "assets";
    }

    @Override // org.osmdroid.tileprovider.modules.MapTileModuleProviderBase
    protected Runnable getTileLoader() {
        return new TileLoader(this.mAssets);
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

    /* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/tileprovider/modules/MapTileAssetsProvider$TileLoader.class */
    protected class TileLoader extends MapTileModuleProviderBase.TileLoader {
        private AssetManager mAssets;

        public TileLoader(AssetManager pAssets) {
            super();
            this.mAssets = null;
            this.mAssets = pAssets;
        }

        @Override // org.osmdroid.tileprovider.modules.MapTileModuleProviderBase.TileLoader
        public Drawable loadTile(MapTileRequestState pState) throws MapTileModuleProviderBase.CantContinueException {
            ITileSource tileSource = (ITileSource) MapTileAssetsProvider.this.mTileSource.get();
            if (tileSource == null) {
                return null;
            }
            MapTile tile = pState.getMapTile();
            try {
                InputStream is = this.mAssets.open(tileSource.getTileRelativeFilenameString(tile));
                Drawable drawable = tileSource.getDrawable(is);
                if (drawable != null) {
                    ExpirableBitmapDrawable.setDrawableExpired(drawable);
                }
                return drawable;
            } catch (IOException e) {
                return null;
            } catch (BitmapTileSourceBase.LowMemoryException e2) {
                throw new MapTileModuleProviderBase.CantContinueException(e2);
            }
        }
    }
}
