package org.osmdroid.tileprovider.tilesource;

import android.util.Log;
import org.osmdroid.api.IMapView;
import org.osmdroid.tileprovider.MapTile;
import org.osmdroid.tileprovider.util.CloudmadeUtil;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/tileprovider/tilesource/CloudmadeTileSource.class */
public class CloudmadeTileSource extends OnlineTileSourceBase implements IStyledTileSource<Integer> {
    private Integer mStyle;

    public CloudmadeTileSource(String pName, int pZoomMinLevel, int pZoomMaxLevel, int pTileSizePixels, String pImageFilenameEnding, String[] pBaseUrl) {
        super(pName, pZoomMinLevel, pZoomMaxLevel, pTileSizePixels, pImageFilenameEnding, pBaseUrl);
        this.mStyle = 1;
    }

    @Override // org.osmdroid.tileprovider.tilesource.BitmapTileSourceBase
    public String pathBase() {
        if (this.mStyle == null || this.mStyle.intValue() <= 1) {
            return this.mName;
        }
        return this.mName + this.mStyle;
    }

    @Override // org.osmdroid.tileprovider.tilesource.OnlineTileSourceBase
    public String getTileURLString(MapTile pTile) {
        String key = CloudmadeUtil.getCloudmadeKey();
        if (key.length() == 0) {
            Log.e(IMapView.LOGTAG, "CloudMade key is not set. You should enter it in the manifest and call CloudmadeUtil.retrieveCloudmadeKey()");
        }
        String token = CloudmadeUtil.getCloudmadeToken();
        return String.format(getBaseUrl(), key, this.mStyle, Integer.valueOf(getTileSizePixels()), Integer.valueOf(pTile.getZoomLevel()), Integer.valueOf(pTile.getX()), Integer.valueOf(pTile.getY()), this.mImageFilenameEnding, token);
    }

    @Override // org.osmdroid.tileprovider.tilesource.IStyledTileSource
    public void setStyle(Integer pStyle) {
        this.mStyle = pStyle;
    }

    @Override // org.osmdroid.tileprovider.tilesource.IStyledTileSource
    public void setStyle(String pStyle) {
        try {
            this.mStyle = Integer.valueOf(Integer.parseInt(pStyle));
        } catch (NumberFormatException e) {
            Log.e(IMapView.LOGTAG, "Error setting integer style: " + pStyle);
        }
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // org.osmdroid.tileprovider.tilesource.IStyledTileSource
    public Integer getStyle() {
        return this.mStyle;
    }
}
