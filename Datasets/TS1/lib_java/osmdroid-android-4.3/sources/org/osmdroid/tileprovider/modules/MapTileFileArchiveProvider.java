package org.osmdroid.tileprovider.modules;

import android.graphics.drawable.Drawable;
import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicReference;
import microsoft.mappoint.TileSystem;
import org.osmdroid.tileprovider.IRegisterReceiver;
import org.osmdroid.tileprovider.MapTile;
import org.osmdroid.tileprovider.MapTileRequestState;
import org.osmdroid.tileprovider.modules.MapTileModuleProviderBase;
import org.osmdroid.tileprovider.tilesource.ITileSource;
import org.osmdroid.tileprovider.util.StreamUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/tileprovider/modules/MapTileFileArchiveProvider.class */
public class MapTileFileArchiveProvider extends MapTileFileStorageProviderBase {
    private static final Logger logger = LoggerFactory.getLogger(MapTileFileArchiveProvider.class);
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
            this.mArchiveFiles.get(0).close();
            this.mArchiveFiles.remove(0);
        }
        super.detach();
    }

    private void findArchiveFiles() {
        File[] files;
        this.mArchiveFiles.clear();
        if (getSdCardAvailable() && (files = OSMDROID_PATH.listFiles()) != null) {
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
        Iterator i$ = this.mArchiveFiles.iterator();
        while (i$.hasNext()) {
            IArchiveFile archiveFile = i$.next();
            InputStream in = archiveFile.getInputStream(tileSource, pTile);
            if (in != null) {
                return in;
            }
        }
        return null;
    }

    /* loaded from: osmdroid-android-4.3.jar:org/osmdroid/tileprovider/modules/MapTileFileArchiveProvider$TileLoader.class */
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
                return null;
            }
            InputStream inputStream = null;
            try {
                try {
                    inputStream = MapTileFileArchiveProvider.this.getInputStream(pTile, tileSource);
                    if (inputStream != null) {
                        Drawable drawable = tileSource.getDrawable(inputStream);
                        if (inputStream != null) {
                            StreamUtils.closeStream(inputStream);
                        }
                        return drawable;
                    }
                    if (inputStream == null) {
                        return null;
                    }
                    StreamUtils.closeStream(inputStream);
                    return null;
                } catch (Throwable e) {
                    MapTileFileArchiveProvider.logger.error("Error loading tile", e);
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
