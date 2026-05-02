package org.osmdroid.tileprovider.modules;

import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.UnknownHostException;
import java.util.concurrent.atomic.AtomicReference;
import microsoft.mappoint.TileSystem;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpUriRequest;
import org.osmdroid.http.HttpClientFactory;
import org.osmdroid.tileprovider.BitmapPool;
import org.osmdroid.tileprovider.MapTile;
import org.osmdroid.tileprovider.MapTileRequestState;
import org.osmdroid.tileprovider.ReusableBitmapDrawable;
import org.osmdroid.tileprovider.modules.MapTileModuleProviderBase;
import org.osmdroid.tileprovider.tilesource.BitmapTileSourceBase;
import org.osmdroid.tileprovider.tilesource.ITileSource;
import org.osmdroid.tileprovider.tilesource.OnlineTileSourceBase;
import org.osmdroid.tileprovider.util.StreamUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/tileprovider/modules/MapTileDownloader.class */
public class MapTileDownloader extends MapTileModuleProviderBase {
    private static final Logger logger = LoggerFactory.getLogger(MapTileDownloader.class);
    private final IFilesystemCache mFilesystemCache;
    private final AtomicReference<OnlineTileSourceBase> mTileSource;
    private final INetworkAvailablityCheck mNetworkAvailablityCheck;

    public MapTileDownloader(ITileSource pTileSource) {
        this(pTileSource, null, null);
    }

    public MapTileDownloader(ITileSource pTileSource, IFilesystemCache pFilesystemCache) {
        this(pTileSource, pFilesystemCache, null);
    }

    public MapTileDownloader(ITileSource pTileSource, IFilesystemCache pFilesystemCache, INetworkAvailablityCheck pNetworkAvailablityCheck) {
        this(pTileSource, pFilesystemCache, pNetworkAvailablityCheck, 2, 40);
    }

    public MapTileDownloader(ITileSource pTileSource, IFilesystemCache pFilesystemCache, INetworkAvailablityCheck pNetworkAvailablityCheck, int pThreadPoolSize, int pPendingQueueSize) {
        super(pThreadPoolSize, pPendingQueueSize);
        this.mTileSource = new AtomicReference<>();
        this.mFilesystemCache = pFilesystemCache;
        this.mNetworkAvailablityCheck = pNetworkAvailablityCheck;
        setTileSource(pTileSource);
    }

    public ITileSource getTileSource() {
        return this.mTileSource.get();
    }

    @Override // org.osmdroid.tileprovider.modules.MapTileModuleProviderBase
    public boolean getUsesDataConnection() {
        return true;
    }

    @Override // org.osmdroid.tileprovider.modules.MapTileModuleProviderBase
    protected String getName() {
        return "Online Tile Download Provider";
    }

    @Override // org.osmdroid.tileprovider.modules.MapTileModuleProviderBase
    protected String getThreadGroupName() {
        return "downloader";
    }

    @Override // org.osmdroid.tileprovider.modules.MapTileModuleProviderBase
    protected Runnable getTileLoader() {
        return new TileLoader();
    }

    @Override // org.osmdroid.tileprovider.modules.MapTileModuleProviderBase
    public int getMinimumZoomLevel() {
        OnlineTileSourceBase tileSource = this.mTileSource.get();
        if (tileSource != null) {
            return tileSource.getMinimumZoomLevel();
        }
        return 0;
    }

    @Override // org.osmdroid.tileprovider.modules.MapTileModuleProviderBase
    public int getMaximumZoomLevel() {
        OnlineTileSourceBase tileSource = this.mTileSource.get();
        return tileSource != null ? tileSource.getMaximumZoomLevel() : TileSystem.getMaximumZoomLevel();
    }

    @Override // org.osmdroid.tileprovider.modules.MapTileModuleProviderBase
    public void setTileSource(ITileSource tileSource) {
        if (tileSource instanceof OnlineTileSourceBase) {
            this.mTileSource.set((OnlineTileSourceBase) tileSource);
        } else {
            this.mTileSource.set(null);
        }
    }

    /* loaded from: osmdroid-android-4.3.jar:org/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader.class */
    protected class TileLoader extends MapTileModuleProviderBase.TileLoader {
        protected TileLoader() {
            super();
        }

        @Override // org.osmdroid.tileprovider.modules.MapTileModuleProviderBase.TileLoader
        public Drawable loadTile(MapTileRequestState aState) throws MapTileModuleProviderBase.CantContinueException {
            OnlineTileSourceBase tileSource = (OnlineTileSourceBase) MapTileDownloader.this.mTileSource.get();
            if (tileSource == null) {
                return null;
            }
            MapTile tile = aState.getMapTile();
            try {
                try {
                    try {
                        try {
                            if (MapTileDownloader.this.mNetworkAvailablityCheck != null && !MapTileDownloader.this.mNetworkAvailablityCheck.getNetworkAvailable()) {
                                StreamUtils.closeStream(null);
                                StreamUtils.closeStream(null);
                                return null;
                            }
                            String tileURLString = tileSource.getTileURLString(tile);
                            if (TextUtils.isEmpty(tileURLString)) {
                                StreamUtils.closeStream(null);
                                StreamUtils.closeStream(null);
                                return null;
                            }
                            HttpClient client = HttpClientFactory.createHttpClient();
                            HttpUriRequest head = new HttpGet(tileURLString);
                            HttpResponse response = client.execute(head);
                            StatusLine line = response.getStatusLine();
                            if (line.getStatusCode() != 200) {
                                MapTileDownloader.logger.warn("Problem downloading MapTile: " + tile + " HTTP response: " + line);
                                StreamUtils.closeStream(null);
                                StreamUtils.closeStream(null);
                                return null;
                            }
                            HttpEntity entity = response.getEntity();
                            if (entity == null) {
                                MapTileDownloader.logger.warn("No content downloading MapTile: " + tile);
                                StreamUtils.closeStream(null);
                                StreamUtils.closeStream(null);
                                return null;
                            }
                            InputStream in = entity.getContent();
                            ByteArrayOutputStream dataStream = new ByteArrayOutputStream();
                            OutputStream out = new BufferedOutputStream(dataStream, StreamUtils.IO_BUFFER_SIZE);
                            StreamUtils.copy(in, out);
                            out.flush();
                            byte[] data = dataStream.toByteArray();
                            ByteArrayInputStream byteStream = new ByteArrayInputStream(data);
                            if (MapTileDownloader.this.mFilesystemCache != null) {
                                MapTileDownloader.this.mFilesystemCache.saveFile(tileSource, tile, byteStream);
                                byteStream.reset();
                            }
                            Drawable result = tileSource.getDrawable(byteStream);
                            StreamUtils.closeStream(in);
                            StreamUtils.closeStream(out);
                            return result;
                        } catch (IOException e) {
                            MapTileDownloader.logger.warn("IOException downloading MapTile: " + tile + " : " + e);
                            StreamUtils.closeStream(null);
                            StreamUtils.closeStream(null);
                            return null;
                        }
                    } catch (UnknownHostException e2) {
                        MapTileDownloader.logger.warn("UnknownHostException downloading MapTile: " + tile + " : " + e2);
                        throw new MapTileModuleProviderBase.CantContinueException(e2);
                    } catch (BitmapTileSourceBase.LowMemoryException e3) {
                        MapTileDownloader.logger.warn("LowMemoryException downloading MapTile: " + tile + " : " + e3);
                        throw new MapTileModuleProviderBase.CantContinueException(e3);
                    }
                } catch (FileNotFoundException e4) {
                    MapTileDownloader.logger.warn("Tile not found: " + tile + " : " + e4);
                    StreamUtils.closeStream(null);
                    StreamUtils.closeStream(null);
                    return null;
                } catch (Throwable e5) {
                    MapTileDownloader.logger.error("Error downloading MapTile: " + tile, e5);
                    StreamUtils.closeStream(null);
                    StreamUtils.closeStream(null);
                    return null;
                }
            } catch (Throwable th) {
                StreamUtils.closeStream(null);
                StreamUtils.closeStream(null);
                throw th;
            }
        }

        @Override // org.osmdroid.tileprovider.modules.MapTileModuleProviderBase.TileLoader
        protected void tileLoaded(MapTileRequestState pState, Drawable pDrawable) {
            MapTileDownloader.this.removeTileFromQueues(pState.getMapTile());
            pState.getCallback().mapTileRequestCompleted(pState, null);
            if (pDrawable instanceof ReusableBitmapDrawable) {
                BitmapPool.getInstance().returnDrawableToPool((ReusableBitmapDrawable) pDrawable);
            }
        }
    }
}
