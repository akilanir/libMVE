package org.osmdroid.tileprovider;

import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import java.util.LinkedHashMap;
import java.util.Map;
import org.osmdroid.tileprovider.constants.OpenStreetMapTileProviderConstants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/tileprovider/LRUMapTileCache.class */
public class LRUMapTileCache extends LinkedHashMap<MapTile, Drawable> implements OpenStreetMapTileProviderConstants {
    private static final Logger logger = LoggerFactory.getLogger(LRUMapTileCache.class);
    private static final long serialVersionUID = -541142277575493335L;
    private int mCapacity;
    private TileRemovedListener mTileRemovedListener;

    /* loaded from: osmdroid-android-4.3.jar:org/osmdroid/tileprovider/LRUMapTileCache$TileRemovedListener.class */
    public interface TileRemovedListener {
        void onTileRemoved(MapTile mapTile);
    }

    public LRUMapTileCache(int aCapacity) {
        super(aCapacity + 2, 0.1f, true);
        this.mCapacity = aCapacity;
    }

    public void ensureCapacity(int aCapacity) {
        if (aCapacity > this.mCapacity) {
            logger.info("Tile cache increased from " + this.mCapacity + " to " + aCapacity);
            this.mCapacity = aCapacity;
        }
    }

    @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
    public Drawable remove(Object aKey) {
        Bitmap bitmap;
        Drawable drawable = (Drawable) super.remove(aKey);
        if (Build.VERSION.SDK_INT < 9 && (drawable instanceof BitmapDrawable) && (bitmap = ((BitmapDrawable) drawable).getBitmap()) != null) {
            bitmap.recycle();
        }
        if (getTileRemovedListener() != null && (aKey instanceof MapTile)) {
            getTileRemovedListener().onTileRemoved((MapTile) aKey);
        }
        if (drawable instanceof ReusableBitmapDrawable) {
            BitmapPool.getInstance().returnDrawableToPool((ReusableBitmapDrawable) drawable);
        }
        return drawable;
    }

    @Override // java.util.LinkedHashMap, java.util.HashMap, java.util.AbstractMap, java.util.Map
    public void clear() {
        while (!isEmpty()) {
            remove((Object) keySet().iterator().next());
        }
        super.clear();
    }

    @Override // java.util.LinkedHashMap
    protected boolean removeEldestEntry(Map.Entry<MapTile, Drawable> aEldest) {
        if (size() > this.mCapacity) {
            MapTile eldest = aEldest.getKey();
            remove((Object) eldest);
            return false;
        }
        return false;
    }

    public TileRemovedListener getTileRemovedListener() {
        return this.mTileRemovedListener;
    }

    public void setTileRemovedListener(TileRemovedListener tileRemovedListener) {
        this.mTileRemovedListener = tileRemovedListener;
    }
}
