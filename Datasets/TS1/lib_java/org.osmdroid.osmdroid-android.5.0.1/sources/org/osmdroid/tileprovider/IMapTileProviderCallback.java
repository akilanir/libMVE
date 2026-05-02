package org.osmdroid.tileprovider;

import android.graphics.drawable.Drawable;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/tileprovider/IMapTileProviderCallback.class */
public interface IMapTileProviderCallback {
    void mapTileRequestCompleted(MapTileRequestState mapTileRequestState, Drawable drawable);

    void mapTileRequestFailed(MapTileRequestState mapTileRequestState);

    void mapTileRequestExpiredTile(MapTileRequestState mapTileRequestState, Drawable drawable);

    boolean useDataConnection();
}
