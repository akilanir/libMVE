package org.osmdroid.tileprovider;

import java.util.Collections;
import java.util.LinkedList;
import java.util.Queue;
import org.osmdroid.tileprovider.modules.MapTileModuleProviderBase;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/tileprovider/MapTileRequestState.class */
public class MapTileRequestState {
    private final Queue<MapTileModuleProviderBase> mProviderQueue = new LinkedList();
    private final MapTile mMapTile;
    private final IMapTileProviderCallback mCallback;
    private MapTileModuleProviderBase mCurrentProvider;

    public MapTileRequestState(MapTile mapTile, MapTileModuleProviderBase[] providers, IMapTileProviderCallback callback) {
        Collections.addAll(this.mProviderQueue, providers);
        this.mMapTile = mapTile;
        this.mCallback = callback;
    }

    public MapTile getMapTile() {
        return this.mMapTile;
    }

    public IMapTileProviderCallback getCallback() {
        return this.mCallback;
    }

    public boolean isEmpty() {
        return this.mProviderQueue.isEmpty();
    }

    public MapTileModuleProviderBase getNextProvider() {
        this.mCurrentProvider = this.mProviderQueue.poll();
        return this.mCurrentProvider;
    }

    public MapTileModuleProviderBase getCurrentProvider() {
        return this.mCurrentProvider;
    }
}
