package org.osmdroid.tileprovider.modules;

import android.graphics.drawable.Drawable;
import android.util.Log;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.RejectedExecutionException;
import org.osmdroid.api.IMapView;
import org.osmdroid.tileprovider.ExpirableBitmapDrawable;
import org.osmdroid.tileprovider.MapTile;
import org.osmdroid.tileprovider.MapTileRequestState;
import org.osmdroid.tileprovider.tilesource.ITileSource;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/tileprovider/modules/MapTileModuleProviderBase.class */
public abstract class MapTileModuleProviderBase {
    private final ExecutorService mExecutor;
    protected final Object mQueueLockObject = new Object();
    protected final HashMap<MapTile, MapTileRequestState> mWorking;
    protected final LinkedHashMap<MapTile, MapTileRequestState> mPending;

    protected abstract String getName();

    protected abstract String getThreadGroupName();

    protected abstract Runnable getTileLoader();

    public abstract boolean getUsesDataConnection();

    public abstract int getMinimumZoomLevel();

    public abstract int getMaximumZoomLevel();

    public abstract void setTileSource(ITileSource iTileSource);

    public MapTileModuleProviderBase(int pThreadPoolSize, final int pPendingQueueSize) {
        if (pPendingQueueSize < pThreadPoolSize) {
            Log.w(IMapView.LOGTAG, "The pending queue size is smaller than the thread pool size. Automatically reducing the thread pool size.");
            pThreadPoolSize = pPendingQueueSize;
        }
        this.mExecutor = Executors.newFixedThreadPool(pThreadPoolSize, new ConfigurablePriorityThreadFactory(5, getThreadGroupName()));
        this.mWorking = new HashMap<>();
        this.mPending = new LinkedHashMap<MapTile, MapTileRequestState>(pPendingQueueSize + 2, 0.1f, true) { // from class: org.osmdroid.tileprovider.modules.MapTileModuleProviderBase.1
            private static final long serialVersionUID = 6455337315681858866L;

            @Override // java.util.LinkedHashMap
            protected boolean removeEldestEntry(Map.Entry<MapTile, MapTileRequestState> pEldest) {
                if (size() > pPendingQueueSize) {
                    MapTile result = null;
                    Iterator<MapTile> iterator = MapTileModuleProviderBase.this.mPending.keySet().iterator();
                    while (result == null && iterator.hasNext()) {
                        MapTile tile = iterator.next();
                        if (!MapTileModuleProviderBase.this.mWorking.containsKey(tile)) {
                            result = tile;
                        }
                    }
                    if (result != null) {
                        MapTileRequestState state = MapTileModuleProviderBase.this.mPending.get(result);
                        MapTileModuleProviderBase.this.removeTileFromQueues(result);
                        state.getCallback().mapTileRequestFailed(state);
                        return false;
                    }
                    return false;
                }
                return false;
            }
        };
    }

    public void loadMapTileAsync(MapTileRequestState pState) {
        if (this.mExecutor.isShutdown()) {
            return;
        }
        synchronized (this.mQueueLockObject) {
            this.mPending.put(pState.getMapTile(), pState);
        }
        try {
            this.mExecutor.execute(getTileLoader());
        } catch (RejectedExecutionException e) {
            Log.w(IMapView.LOGTAG, "RejectedExecutionException", e);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void clearQueue() {
        synchronized (this.mQueueLockObject) {
            this.mPending.clear();
            this.mWorking.clear();
        }
    }

    public void detach() {
        clearQueue();
        this.mExecutor.shutdown();
    }

    void removeTileFromQueues(MapTile mapTile) {
        synchronized (this.mQueueLockObject) {
            this.mPending.remove(mapTile);
            this.mWorking.remove(mapTile);
        }
    }

    /* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/tileprovider/modules/MapTileModuleProviderBase$TileLoader.class */
    protected abstract class TileLoader implements Runnable {
        protected abstract Drawable loadTile(MapTileRequestState mapTileRequestState) throws CantContinueException;

        protected TileLoader() {
        }

        protected void onTileLoaderInit() {
        }

        protected void onTileLoaderShutdown() {
        }

        protected MapTileRequestState nextTile() {
            MapTileRequestState mapTileRequestState;
            synchronized (MapTileModuleProviderBase.this.mQueueLockObject) {
                MapTile result = null;
                for (MapTile tile : MapTileModuleProviderBase.this.mPending.keySet()) {
                    if (!MapTileModuleProviderBase.this.mWorking.containsKey(tile)) {
                        result = tile;
                    }
                }
                if (result != null) {
                    MapTileModuleProviderBase.this.mWorking.put(result, MapTileModuleProviderBase.this.mPending.get(result));
                }
                mapTileRequestState = result != null ? MapTileModuleProviderBase.this.mPending.get(result) : null;
            }
            return mapTileRequestState;
        }

        protected void tileLoaded(MapTileRequestState pState, Drawable pDrawable) {
            MapTileModuleProviderBase.this.removeTileFromQueues(pState.getMapTile());
            pState.getCallback().mapTileRequestCompleted(pState, pDrawable);
        }

        protected void tileLoadedExpired(MapTileRequestState pState, Drawable pDrawable) {
            MapTileModuleProviderBase.this.removeTileFromQueues(pState.getMapTile());
            pState.getCallback().mapTileRequestExpiredTile(pState, pDrawable);
        }

        protected void tileLoadedFailed(MapTileRequestState pState) {
            MapTileModuleProviderBase.this.removeTileFromQueues(pState.getMapTile());
            pState.getCallback().mapTileRequestFailed(pState);
        }

        @Override // java.lang.Runnable
        public final void run() {
            onTileLoaderInit();
            Drawable result = null;
            while (true) {
                MapTileRequestState state = nextTile();
                if (state != null) {
                    try {
                        result = loadTile(state);
                    } catch (CantContinueException e) {
                        Log.i(IMapView.LOGTAG, "Tile loader can't continue: " + state.getMapTile(), e);
                        MapTileModuleProviderBase.this.clearQueue();
                    } catch (Throwable e2) {
                        Log.i(IMapView.LOGTAG, "Error downloading tile: " + state.getMapTile(), e2);
                    }
                    if (result == null) {
                        tileLoadedFailed(state);
                    } else if (ExpirableBitmapDrawable.isDrawableExpired(result)) {
                        tileLoadedExpired(state, result);
                    } else {
                        tileLoaded(state, result);
                    }
                } else {
                    onTileLoaderShutdown();
                    return;
                }
            }
        }
    }

    /* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/tileprovider/modules/MapTileModuleProviderBase$CantContinueException.class */
    public class CantContinueException extends Exception {
        private static final long serialVersionUID = 146526524087765133L;

        public CantContinueException(String pDetailMessage) {
            super(pDetailMessage);
        }

        public CantContinueException(Throwable pThrowable) {
            super(pThrowable);
        }
    }
}
