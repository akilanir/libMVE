package org.osmdroid.tileprovider.tilesource;

import org.osmdroid.ResourceProxy;
import org.osmdroid.tileprovider.MapTile;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/tileprovider/tilesource/OnlineTileSourceBase.class */
public abstract class OnlineTileSourceBase extends BitmapTileSourceBase {
    private final String[] mBaseUrls;

    public abstract String getTileURLString(MapTile mapTile);

    public OnlineTileSourceBase(String aName, ResourceProxy.string aResourceId, int aZoomMinLevel, int aZoomMaxLevel, int aTileSizePixels, String aImageFilenameEnding, String[] aBaseUrl) {
        super(aName, aResourceId, aZoomMinLevel, aZoomMaxLevel, aTileSizePixels, aImageFilenameEnding);
        this.mBaseUrls = aBaseUrl;
    }

    protected String getBaseUrl() {
        return this.mBaseUrls[this.random.nextInt(this.mBaseUrls.length)];
    }
}
