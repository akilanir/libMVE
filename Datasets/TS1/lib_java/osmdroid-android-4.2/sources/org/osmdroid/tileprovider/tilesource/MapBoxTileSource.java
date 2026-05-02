package org.osmdroid.tileprovider.tilesource;

import android.content.Context;
import org.osmdroid.ResourceProxy;
import org.osmdroid.tileprovider.MapTile;
import org.osmdroid.tileprovider.util.ManifestUtil;

/* loaded from: osmdroid-android-4.2.jar:org/osmdroid/tileprovider/tilesource/MapBoxTileSource.class */
public class MapBoxTileSource extends OnlineTileSourceBase {
    private static final String MAPBOX_MAPID = "MAPBOX_MAPID";
    private static final String[] mapBoxBaseUrl = {"http://a.tiles.mapbox.com/v3/", "http://b.tiles.mapbox.com/v3/", "http://c.tiles.mapbox.com/v3/", "http://d.tiles.mapbox.com/v3/"};
    private static String mapBoxMapId = "";

    public MapBoxTileSource() {
        super("mbtiles", ResourceProxy.string.mapbox, 1, 18, 256, ".png", mapBoxBaseUrl);
    }

    public MapBoxTileSource(String name, ResourceProxy.string resourceId, int zoomMinLevel, int zoomMaxLevel, int tileSizePixels, String imageFilenameEnding) {
        super(name, resourceId, zoomMinLevel, zoomMaxLevel, tileSizePixels, imageFilenameEnding, mapBoxBaseUrl);
    }

    public MapBoxTileSource(String name, ResourceProxy.string resourceId, int zoomMinLevel, int zoomMaxLevel, int tileSizePixels, String imageFilenameEnding, String mapBoxMapId2, String mapBoxVersionBaseUrl) {
        super(name, resourceId, zoomMinLevel, zoomMaxLevel, tileSizePixels, imageFilenameEnding, new String[]{mapBoxVersionBaseUrl});
    }

    public static void retrieveMapBoxMapId(Context aContext) {
        mapBoxMapId = ManifestUtil.retrieveKey(aContext, MAPBOX_MAPID);
    }

    public static String getMapBoxMapId() {
        return mapBoxMapId;
    }

    @Override // org.osmdroid.tileprovider.tilesource.OnlineTileSourceBase
    public String getTileURLString(MapTile aMapTile) {
        StringBuffer url = new StringBuffer(getBaseUrl());
        url.append(getMapBoxMapId());
        url.append("/");
        url.append(aMapTile.getZoomLevel());
        url.append("/");
        url.append(aMapTile.getX());
        url.append("/");
        url.append(aMapTile.getY());
        url.append(".png");
        String res = url.toString();
        return res;
    }
}
