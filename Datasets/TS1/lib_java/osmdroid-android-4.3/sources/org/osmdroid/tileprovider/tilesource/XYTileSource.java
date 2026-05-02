package org.osmdroid.tileprovider.tilesource;

import org.osmdroid.ResourceProxy;
import org.osmdroid.tileprovider.MapTile;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/tileprovider/tilesource/XYTileSource.class */
public class XYTileSource extends OnlineTileSourceBase {
    public XYTileSource(String aName, ResourceProxy.string aResourceId, int aZoomMinLevel, int aZoomMaxLevel, int aTileSizePixels, String aImageFilenameEnding, String[] aBaseUrl) {
        super(aName, aResourceId, aZoomMinLevel, aZoomMaxLevel, aTileSizePixels, aImageFilenameEnding, aBaseUrl);
    }

    @Override // org.osmdroid.tileprovider.tilesource.OnlineTileSourceBase
    public String getTileURLString(MapTile aTile) {
        return getBaseUrl() + aTile.getZoomLevel() + "/" + aTile.getX() + "/" + aTile.getY() + this.mImageFilenameEnding;
    }
}
