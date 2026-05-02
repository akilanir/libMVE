package org.osmdroid.tileprovider;

import android.graphics.drawable.Drawable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import microsoft.mappoint.TileSystem;
import org.osmdroid.tileprovider.modules.MapTileModuleProviderBase;
import org.osmdroid.tileprovider.tilesource.ITileSource;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/tileprovider/MapTileProviderArray.class */
public class MapTileProviderArray extends MapTileProviderBase {
    protected final HashMap<MapTile, MapTileRequestState> mWorking;
    protected final List<MapTileModuleProviderBase> mTileProviderList;

    protected MapTileProviderArray(ITileSource pTileSource, IRegisterReceiver pRegisterReceiver) {
        this(pTileSource, pRegisterReceiver, new MapTileModuleProviderBase[0]);
    }

    public MapTileProviderArray(ITileSource pTileSource, IRegisterReceiver aRegisterReceiver, MapTileModuleProviderBase[] pTileProviderArray) {
        super(pTileSource);
        this.mWorking = new HashMap<>();
        this.mTileProviderList = new ArrayList();
        Collections.addAll(this.mTileProviderList, pTileProviderArray);
    }

    @Override // org.osmdroid.tileprovider.MapTileProviderBase
    public void detach() {
        synchronized (this.mTileProviderList) {
            for (MapTileModuleProviderBase tileProvider : this.mTileProviderList) {
                tileProvider.detach();
            }
        }
        synchronized (this.mWorking) {
            this.mWorking.clear();
        }
    }

    @Override // org.osmdroid.tileprovider.MapTileProviderBase
    public Drawable getMapTile(MapTile pTile) {
        boolean alreadyInProgress;
        MapTileRequestState state;
        Drawable tile = this.mTileCache.getMapTile(pTile);
        if (tile != null && !ExpirableBitmapDrawable.isDrawableExpired(tile)) {
            return tile;
        }
        synchronized (this.mWorking) {
            alreadyInProgress = this.mWorking.containsKey(pTile);
        }
        if (!alreadyInProgress) {
            synchronized (this.mTileProviderList) {
                MapTileModuleProviderBase[] providerArray = new MapTileModuleProviderBase[this.mTileProviderList.size()];
                state = new MapTileRequestState(pTile, (MapTileModuleProviderBase[]) this.mTileProviderList.toArray(providerArray), this);
            }
            synchronized (this.mWorking) {
                boolean alreadyInProgress2 = this.mWorking.containsKey(pTile);
                if (alreadyInProgress2) {
                    return tile;
                }
                this.mWorking.put(pTile, state);
                MapTileModuleProviderBase provider = findNextAppropriateProvider(state);
                if (provider != null) {
                    provider.loadMapTileAsync(state);
                } else {
                    mapTileRequestFailed(state);
                }
            }
        }
        return tile;
    }

    @Override // org.osmdroid.tileprovider.MapTileProviderBase, org.osmdroid.tileprovider.IMapTileProviderCallback
    public void mapTileRequestCompleted(MapTileRequestState aState, Drawable aDrawable) {
        synchronized (this.mWorking) {
            this.mWorking.remove(aState.getMapTile());
        }
        super.mapTileRequestCompleted(aState, aDrawable);
    }

    @Override // org.osmdroid.tileprovider.MapTileProviderBase, org.osmdroid.tileprovider.IMapTileProviderCallback
    public void mapTileRequestFailed(MapTileRequestState aState) {
        MapTileModuleProviderBase nextProvider = findNextAppropriateProvider(aState);
        if (nextProvider != null) {
            nextProvider.loadMapTileAsync(aState);
            return;
        }
        synchronized (this.mWorking) {
            this.mWorking.remove(aState.getMapTile());
        }
        super.mapTileRequestFailed(aState);
    }

    @Override // org.osmdroid.tileprovider.MapTileProviderBase, org.osmdroid.tileprovider.IMapTileProviderCallback
    public void mapTileRequestExpiredTile(MapTileRequestState aState, Drawable aDrawable) {
        super.mapTileRequestExpiredTile(aState, aDrawable);
        MapTileModuleProviderBase nextProvider = findNextAppropriateProvider(aState);
        if (nextProvider != null) {
            nextProvider.loadMapTileAsync(aState);
            return;
        }
        synchronized (this.mWorking) {
            this.mWorking.remove(aState.getMapTile());
        }
    }

    protected MapTileModuleProviderBase findNextAppropriateProvider(MapTileRequestState aState) {
        MapTileModuleProviderBase provider;
        boolean providerDoesntExist = false;
        boolean providerCantGetDataConnection = false;
        boolean providerCantServiceZoomlevel = false;
        while (true) {
            provider = aState.getNextProvider();
            if (provider != null) {
                providerDoesntExist = !getProviderExists(provider);
                providerCantGetDataConnection = !useDataConnection() && provider.getUsesDataConnection();
                int zoomLevel = aState.getMapTile().getZoomLevel();
                providerCantServiceZoomlevel = zoomLevel > provider.getMaximumZoomLevel() || zoomLevel < provider.getMinimumZoomLevel();
            }
            if (provider == null || (!providerDoesntExist && !providerCantGetDataConnection && !providerCantServiceZoomlevel)) {
                break;
            }
        }
        return provider;
    }

    public boolean getProviderExists(MapTileModuleProviderBase provider) {
        boolean contains;
        synchronized (this.mTileProviderList) {
            contains = this.mTileProviderList.contains(provider);
        }
        return contains;
    }

    @Override // org.osmdroid.tileprovider.MapTileProviderBase
    public int getMinimumZoomLevel() {
        int result = TileSystem.getMaximumZoomLevel();
        synchronized (this.mTileProviderList) {
            for (MapTileModuleProviderBase tileProvider : this.mTileProviderList) {
                if (tileProvider.getMinimumZoomLevel() < result) {
                    result = tileProvider.getMinimumZoomLevel();
                }
            }
        }
        return result;
    }

    @Override // org.osmdroid.tileprovider.MapTileProviderBase
    public int getMaximumZoomLevel() {
        int result = 0;
        synchronized (this.mTileProviderList) {
            for (MapTileModuleProviderBase tileProvider : this.mTileProviderList) {
                if (tileProvider.getMaximumZoomLevel() > result) {
                    result = tileProvider.getMaximumZoomLevel();
                }
            }
        }
        return result;
    }

    @Override // org.osmdroid.tileprovider.MapTileProviderBase
    public void setTileSource(ITileSource aTileSource) {
        super.setTileSource(aTileSource);
        synchronized (this.mTileProviderList) {
            for (MapTileModuleProviderBase tileProvider : this.mTileProviderList) {
                tileProvider.setTileSource(aTileSource);
                clearTileCache();
            }
        }
    }
}
