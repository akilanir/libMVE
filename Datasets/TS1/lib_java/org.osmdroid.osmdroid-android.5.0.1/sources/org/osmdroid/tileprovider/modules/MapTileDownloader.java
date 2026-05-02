package org.osmdroid.tileprovider.modules;

import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.util.Log;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.UnknownHostException;
import java.util.concurrent.atomic.AtomicReference;
import microsoft.mappoint.TileSystem;
import org.osmdroid.api.IMapView;
import org.osmdroid.tileprovider.BitmapPool;
import org.osmdroid.tileprovider.MapTile;
import org.osmdroid.tileprovider.MapTileRequestState;
import org.osmdroid.tileprovider.ReusableBitmapDrawable;
import org.osmdroid.tileprovider.constants.OpenStreetMapTileProviderConstants;
import org.osmdroid.tileprovider.modules.MapTileModuleProviderBase;
import org.osmdroid.tileprovider.tilesource.BitmapTileSourceBase;
import org.osmdroid.tileprovider.tilesource.ITileSource;
import org.osmdroid.tileprovider.tilesource.OnlineTileSourceBase;
import org.osmdroid.tileprovider.util.StreamUtils;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/tileprovider/modules/MapTileDownloader.class */
public class MapTileDownloader extends MapTileModuleProviderBase {
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

    /* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/tileprovider/modules/MapTileDownloader$TileLoader.class */
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
            HttpURLConnection c = null;
            MapTile tile = aState.getMapTile();
            try {
                try {
                    try {
                        try {
                            try {
                                if (MapTileDownloader.this.mNetworkAvailablityCheck != null && !MapTileDownloader.this.mNetworkAvailablityCheck.getNetworkAvailable()) {
                                    if (OpenStreetMapTileProviderConstants.DEBUGMODE) {
                                        Log.d(IMapView.LOGTAG, "Skipping " + MapTileDownloader.this.getName() + " due to NetworkAvailabliltyCheck.");
                                    }
                                    StreamUtils.closeStream(null);
                                    StreamUtils.closeStream(null);
                                    try {
                                        c.disconnect();
                                    } catch (Exception e) {
                                    }
                                    return null;
                                }
                                String tileURLString = tileSource.getTileURLString(tile);
                                if (OpenStreetMapTileProviderConstants.DEBUGMODE) {
                                    Log.d(IMapView.LOGTAG, "Downloading Maptile from url: " + tileURLString);
                                }
                                if (TextUtils.isEmpty(tileURLString)) {
                                    StreamUtils.closeStream(null);
                                    StreamUtils.closeStream(null);
                                    try {
                                        c.disconnect();
                                    } catch (Exception e2) {
                                    }
                                    return null;
                                }
                                HttpURLConnection c2 = (HttpURLConnection) new URL(tileURLString).openConnection();
                                c2.setUseCaches(true);
                                c2.setRequestProperty(OpenStreetMapTileProviderConstants.USER_AGENT, OpenStreetMapTileProviderConstants.getUserAgentValue());
                                c2.connect();
                                if (c2.getResponseCode() != 200) {
                                    Log.w(IMapView.LOGTAG, "Problem downloading MapTile: " + tile + " HTTP response: " + c2.getResponseMessage());
                                    StreamUtils.closeStream(null);
                                    StreamUtils.closeStream(null);
                                    try {
                                        c2.disconnect();
                                    } catch (Exception e3) {
                                    }
                                    return null;
                                }
                                InputStream in = c2.getInputStream();
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
                                try {
                                    c2.disconnect();
                                } catch (Exception e4) {
                                }
                                return result;
                            } catch (Throwable th) {
                                StreamUtils.closeStream(null);
                                StreamUtils.closeStream(null);
                                try {
                                    c.disconnect();
                                } catch (Exception e5) {
                                }
                                throw th;
                            }
                        } catch (BitmapTileSourceBase.LowMemoryException e6) {
                            Log.w(IMapView.LOGTAG, "LowMemoryException downloading MapTile: " + tile + " : " + e6);
                            throw new MapTileModuleProviderBase.CantContinueException(e6);
                        }
                    } catch (Throwable e7) {
                        Log.e(IMapView.LOGTAG, "Error downloading MapTile: " + tile, e7);
                        StreamUtils.closeStream(null);
                        StreamUtils.closeStream(null);
                        try {
                            c.disconnect();
                            return null;
                        } catch (Exception e8) {
                            return null;
                        }
                    }
                } catch (IOException e9) {
                    Log.w(IMapView.LOGTAG, "IOException downloading MapTile: " + tile + " : " + e9);
                    StreamUtils.closeStream(null);
                    StreamUtils.closeStream(null);
                    try {
                        c.disconnect();
                        return null;
                    } catch (Exception e10) {
                        return null;
                    }
                }
            } catch (FileNotFoundException e11) {
                Log.w(IMapView.LOGTAG, "Tile not found: " + tile + " : " + e11);
                StreamUtils.closeStream(null);
                StreamUtils.closeStream(null);
                try {
                    c.disconnect();
                    return null;
                } catch (Exception e12) {
                    return null;
                }
            } catch (UnknownHostException e13) {
                Log.w(IMapView.LOGTAG, "UnknownHostException downloading MapTile: " + tile + " : " + e13);
                throw new MapTileModuleProviderBase.CantContinueException(e13);
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
