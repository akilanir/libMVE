package org.osmdroid.tileprovider.tilesource;

import org.osmdroid.tileprovider.MapTile;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/tileprovider/tilesource/OnlineTileSourceBase.class */
public abstract class OnlineTileSourceBase extends BitmapTileSourceBase {
    private final String[] mBaseUrls;

    public abstract String getTileURLString(MapTile mapTile);

    public OnlineTileSourceBase(String aName, int aZoomMinLevel, int aZoomMaxLevel, int aTileSizePixels, String aImageFilenameEnding, String[] aBaseUrl) {
        super(aName, aZoomMinLevel, aZoomMaxLevel, aTileSizePixels, aImageFilenameEnding);
        this.mBaseUrls = aBaseUrl;
    }

    protected String getBaseUrl() {
        return this.mBaseUrls[this.random.nextInt(this.mBaseUrls.length)];
    }
}
