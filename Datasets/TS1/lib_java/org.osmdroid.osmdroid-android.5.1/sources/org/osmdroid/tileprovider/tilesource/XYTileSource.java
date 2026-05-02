package org.osmdroid.tileprovider.tilesource;

import org.osmdroid.tileprovider.MapTile;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/tileprovider/tilesource/XYTileSource.class */
public class XYTileSource extends OnlineTileSourceBase {
    public XYTileSource(String aName, int aZoomMinLevel, int aZoomMaxLevel, int aTileSizePixels, String aImageFilenameEnding, String[] aBaseUrl) {
        super(aName, aZoomMinLevel, aZoomMaxLevel, aTileSizePixels, aImageFilenameEnding, aBaseUrl);
    }

    @Override // org.osmdroid.tileprovider.tilesource.OnlineTileSourceBase
    public String getTileURLString(MapTile aTile) {
        return getBaseUrl() + aTile.getZoomLevel() + "/" + aTile.getX() + "/" + aTile.getY() + this.mImageFilenameEnding;
    }
}
