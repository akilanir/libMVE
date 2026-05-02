package org.osmdroid.tileprovider;

import android.graphics.drawable.Drawable;
import org.osmdroid.tileprovider.constants.OpenStreetMapTileProviderConstants;

/* loaded from: osmdroid-android-4.2.jar:org/osmdroid/tileprovider/MapTileCache.class */
public class MapTileCache implements OpenStreetMapTileProviderConstants {
    protected final Object mCachedTilesLockObject;
    protected LRUMapTileCache mCachedTiles;

    public MapTileCache() {
        this(9);
    }

    public MapTileCache(int aMaximumCacheSize) {
        this.mCachedTilesLockObject = new Object();
        this.mCachedTiles = new LRUMapTileCache(aMaximumCacheSize);
    }

    public void ensureCapacity(int aCapacity) {
        synchronized (this.mCachedTilesLockObject) {
            this.mCachedTiles.ensureCapacity(aCapacity);
        }
    }

    public Drawable getMapTile(MapTile aTile) {
        Drawable drawable;
        synchronized (this.mCachedTilesLockObject) {
            drawable = this.mCachedTiles.get(aTile);
        }
        return drawable;
    }

    public void putTile(MapTile aTile, Drawable aDrawable) {
        if (aDrawable != null) {
            synchronized (this.mCachedTilesLockObject) {
                this.mCachedTiles.put(aTile, aDrawable);
            }
        }
    }

    public boolean containsTile(MapTile aTile) {
        boolean containsKey;
        synchronized (this.mCachedTilesLockObject) {
            containsKey = this.mCachedTiles.containsKey(aTile);
        }
        return containsKey;
    }

    public void clear() {
        synchronized (this.mCachedTilesLockObject) {
            this.mCachedTiles.clear();
        }
    }
}
