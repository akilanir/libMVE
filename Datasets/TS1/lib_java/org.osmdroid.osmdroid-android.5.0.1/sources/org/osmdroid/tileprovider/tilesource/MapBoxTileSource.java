package org.osmdroid.tileprovider.tilesource;

import android.content.Context;
import org.osmdroid.tileprovider.MapTile;
import org.osmdroid.tileprovider.util.ManifestUtil;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/tileprovider/tilesource/MapBoxTileSource.class */
public class MapBoxTileSource extends OnlineTileSourceBase {
    private static final String MAPBOX_MAPID = "MAPBOX_MAPID";
    private static final String ACCESS_TOKEN = "ACCESS_TOKEN";
    private static final String[] mapBoxBaseUrl = {"http://api.tiles.mapbox.com/v4/"};
    private static String mapBoxMapId = "";
    private static String accessToken;

    public MapBoxTileSource() {
        super("mapbox", 1, 18, 256, ".png", mapBoxBaseUrl);
    }

    public MapBoxTileSource(String name, int zoomMinLevel, int zoomMaxLevel, int tileSizePixels, String imageFilenameEnding) {
        super(name, zoomMinLevel, zoomMaxLevel, tileSizePixels, imageFilenameEnding, mapBoxBaseUrl);
    }

    public MapBoxTileSource(String name, int zoomMinLevel, int zoomMaxLevel, int tileSizePixels, String imageFilenameEnding, String mapBoxMapId2, String mapBoxVersionBaseUrl) {
        super(name, zoomMinLevel, zoomMaxLevel, tileSizePixels, imageFilenameEnding, new String[]{mapBoxVersionBaseUrl});
    }

    public static void retrieveMapBoxMapId(Context aContext) {
        mapBoxMapId = ManifestUtil.retrieveKey(aContext, MAPBOX_MAPID);
    }

    public static void retrieveAccessToken(Context aContext) {
        accessToken = ManifestUtil.retrieveKey(aContext, ACCESS_TOKEN);
    }

    public static void setMapboxMapid(String key) {
        mapBoxMapId = key;
    }

    public static String getMapBoxMapId() {
        return mapBoxMapId;
    }

    @Override // org.osmdroid.tileprovider.tilesource.OnlineTileSourceBase
    public String getTileURLString(MapTile aMapTile) {
        StringBuilder url = new StringBuilder(getBaseUrl());
        url.append(getMapBoxMapId());
        url.append("/");
        url.append(aMapTile.getZoomLevel());
        url.append("/");
        url.append(aMapTile.getX());
        url.append("/");
        url.append(aMapTile.getY());
        url.append(".png");
        url.append("?access_token=").append(getAccessToken());
        String res = url.toString();
        return res;
    }

    public String getAccessToken() {
        return accessToken;
    }

    public void setAccessToken(String accessTokeninput) {
        accessToken = accessTokeninput;
    }
}
