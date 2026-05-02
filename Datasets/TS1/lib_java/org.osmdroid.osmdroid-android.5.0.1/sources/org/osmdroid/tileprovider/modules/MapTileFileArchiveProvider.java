package org.osmdroid.tileprovider.modules;

import android.graphics.drawable.Drawable;
import android.util.Log;
import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicReference;
import microsoft.mappoint.TileSystem;
import org.osmdroid.api.IMapView;
import org.osmdroid.tileprovider.IRegisterReceiver;
import org.osmdroid.tileprovider.MapTile;
import org.osmdroid.tileprovider.MapTileRequestState;
import org.osmdroid.tileprovider.constants.OpenStreetMapTileProviderConstants;
import org.osmdroid.tileprovider.modules.MapTileModuleProviderBase;
import org.osmdroid.tileprovider.tilesource.ITileSource;
import org.osmdroid.tileprovider.util.StreamUtils;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/tileprovider/modules/MapTileFileArchiveProvider.class */
public class MapTileFileArchiveProvider extends MapTileFileStorageProviderBase {
    private final ArrayList<IArchiveFile> mArchiveFiles;
    private final AtomicReference<ITileSource> mTileSource;
    private final boolean mSpecificArchivesProvided;

    public MapTileFileArchiveProvider(IRegisterReceiver pRegisterReceiver, ITileSource pTileSource, IArchiveFile[] pArchives) {
        super(pRegisterReceiver, 8, 40);
        this.mArchiveFiles = new ArrayList<>();
        this.mTileSource = new AtomicReference<>();
        setTileSource(pTileSource);
        if (pArchives == null) {
            this.mSpecificArchivesProvided = false;
            findArchiveFiles();
            return;
        }
        this.mSpecificArchivesProvided = true;
        for (int i = pArchives.length - 1; i >= 0; i--) {
            this.mArchiveFiles.add(pArchives[i]);
        }
    }

    public MapTileFileArchiveProvider(IRegisterReceiver pRegisterReceiver, ITileSource pTileSource) {
        this(pRegisterReceiver, pTileSource, null);
    }

    @Override // org.osmdroid.tileprovider.modules.MapTileModuleProviderBase
    public boolean getUsesDataConnection() {
        return false;
    }

    @Override // org.osmdroid.tileprovider.modules.MapTileModuleProviderBase
    protected String getName() {
        return "File Archive Provider";
    }

    @Override // org.osmdroid.tileprovider.modules.MapTileModuleProviderBase
    protected String getThreadGroupName() {
        return "filearchive";
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

    @Override // org.osmdroid.tileprovider.modules.MapTileFileStorageProviderBase
    protected void onMediaMounted() {
        if (!this.mSpecificArchivesProvided) {
            findArchiveFiles();
        }
    }

    @Override // org.osmdroid.tileprovider.modules.MapTileFileStorageProviderBase
    protected void onMediaUnmounted() {
        if (!this.mSpecificArchivesProvided) {
            findArchiveFiles();
        }
    }

    @Override // org.osmdroid.tileprovider.modules.MapTileModuleProviderBase
    public void setTileSource(ITileSource pTileSource) {
        this.mTileSource.set(pTileSource);
    }

    @Override // org.osmdroid.tileprovider.modules.MapTileFileStorageProviderBase, org.osmdroid.tileprovider.modules.MapTileModuleProviderBase
    public void detach() {
        while (!this.mArchiveFiles.isEmpty()) {
            IArchiveFile t = this.mArchiveFiles.get(0);
            if (t != null) {
                this.mArchiveFiles.get(0).close();
            }
            this.mArchiveFiles.remove(0);
        }
        super.detach();
    }

    private void findArchiveFiles() {
        this.mArchiveFiles.clear();
        if (!getSdCardAvailable()) {
            return;
        }
        File cachePaths = OpenStreetMapTileProviderConstants.TILE_PATH_BASE;
        File[] files = cachePaths.listFiles();
        if (files != null) {
            for (File file : files) {
                IArchiveFile archiveFile = ArchiveFileFactory.getArchiveFile(file);
                if (archiveFile != null) {
                    this.mArchiveFiles.add(archiveFile);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized InputStream getInputStream(MapTile pTile, ITileSource tileSource) {
        InputStream in;
        Iterator i$ = this.mArchiveFiles.iterator();
        while (i$.hasNext()) {
            IArchiveFile archiveFile = i$.next();
            if (archiveFile != null && (in = archiveFile.getInputStream(tileSource, pTile)) != null) {
                if (OpenStreetMapTileProviderConstants.DEBUGMODE) {
                    Log.d(IMapView.LOGTAG, "Found tile " + pTile + " in " + archiveFile);
                }
                return in;
            }
        }
        return null;
    }

    /* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/tileprovider/modules/MapTileFileArchiveProvider$TileLoader.class */
    protected class TileLoader extends MapTileModuleProviderBase.TileLoader {
        protected TileLoader() {
            super();
        }

        @Override // org.osmdroid.tileprovider.modules.MapTileModuleProviderBase.TileLoader
        public Drawable loadTile(MapTileRequestState pState) {
            ITileSource tileSource = (ITileSource) MapTileFileArchiveProvider.this.mTileSource.get();
            if (tileSource == null) {
                return null;
            }
            MapTile pTile = pState.getMapTile();
            if (!MapTileFileArchiveProvider.this.getSdCardAvailable()) {
                if (!OpenStreetMapTileProviderConstants.DEBUGMODE) {
                    return null;
                }
                Log.d(IMapView.LOGTAG, "No sdcard - do nothing for tile: " + pTile);
                return null;
            }
            InputStream inputStream = null;
            try {
                try {
                    if (OpenStreetMapTileProviderConstants.DEBUGMODE) {
                        Log.d(IMapView.LOGTAG, "Tile doesn't exist: " + pTile);
                    }
                    inputStream = MapTileFileArchiveProvider.this.getInputStream(pTile, tileSource);
                    if (inputStream == null) {
                        if (inputStream == null) {
                            return null;
                        }
                        StreamUtils.closeStream(inputStream);
                        return null;
                    }
                    if (OpenStreetMapTileProviderConstants.DEBUGMODE) {
                        Log.d(IMapView.LOGTAG, "Use tile from archive: " + pTile);
                    }
                    Drawable drawable = tileSource.getDrawable(inputStream);
                    if (inputStream != null) {
                        StreamUtils.closeStream(inputStream);
                    }
                    return drawable;
                } catch (Throwable e) {
                    Log.e(IMapView.LOGTAG, "Error loading tile", e);
                    if (inputStream == null) {
                        return null;
                    }
                    StreamUtils.closeStream(inputStream);
                    return null;
                }
            } catch (Throwable th) {
                if (inputStream != null) {
                    StreamUtils.closeStream(inputStream);
                }
                throw th;
            }
        }
    }
}
