package org.osmdroid.tileprovider.tilesource;

import org.osmdroid.tileprovider.MapTile;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/tileprovider/tilesource/QuadTreeTileSource.class */
public class QuadTreeTileSource extends OnlineTileSourceBase {
    public QuadTreeTileSource(String aName, int aZoomMinLevel, int aZoomMaxLevel, int aTileSizePixels, String aImageFilenameEnding, String[] aBaseUrl) {
        super(aName, aZoomMinLevel, aZoomMaxLevel, aTileSizePixels, aImageFilenameEnding, aBaseUrl);
    }

    @Override // org.osmdroid.tileprovider.tilesource.OnlineTileSourceBase
    public String getTileURLString(MapTile aTile) {
        return getBaseUrl() + quadTree(aTile) + this.mImageFilenameEnding;
    }

    protected String quadTree(MapTile aTile) {
        StringBuilder quadKey = new StringBuilder();
        for (int i = aTile.getZoomLevel(); i > 0; i--) {
            int digit = 0;
            int mask = 1 << (i - 1);
            if ((aTile.getX() & mask) != 0) {
                digit = 0 + 1;
            }
            if ((aTile.getY() & mask) != 0) {
                digit += 2;
            }
            quadKey.append("" + digit);
        }
        return quadKey.toString();
    }
}
