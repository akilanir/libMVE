package org.osmdroid.tileprovider.tilesource;

import android.content.Context;
import org.osmdroid.tileprovider.MapTile;
import org.osmdroid.tileprovider.util.ManifestUtil;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/tileprovider/tilesource/MapBoxTileSource.class */
public class MapBoxTileSource extends OnlineTileSourceBase {
    private static final String MAPBOX_MAPID = "MAPBOX_MAPID";
    private static final String ACCESS_TOKEN = "ACCESS_TOKEN";
    private static final String[] mapBoxBaseUrl = {"http://api.tiles.mapbox.com/v4/"};
    private String mapBoxMapId;
    private String accessToken;

    public MapBoxTileSource() {
        super("mapbox", 1, 18, 256, ".png", mapBoxBaseUrl);
        this.mapBoxMapId = "";
    }

    public MapBoxTileSource(Context ctx) {
        super("mapbox", 1, 18, 256, ".png", mapBoxBaseUrl);
        this.mapBoxMapId = "";
        retrieveAccessToken(ctx);
        retrieveMapBoxMapId(ctx);
    }

    public MapBoxTileSource(String mapboxid, String accesstoken) {
        super("mapbox", 1, 18, 256, ".png", mapBoxBaseUrl);
        this.mapBoxMapId = "";
        this.accessToken = accesstoken;
        this.mapBoxMapId = mapboxid;
    }

    public MapBoxTileSource(String name, int zoomMinLevel, int zoomMaxLevel, int tileSizePixels, String imageFilenameEnding) {
        super(name, zoomMinLevel, zoomMaxLevel, tileSizePixels, imageFilenameEnding, mapBoxBaseUrl);
        this.mapBoxMapId = "";
    }

    public MapBoxTileSource(String name, int zoomMinLevel, int zoomMaxLevel, int tileSizePixels, String imageFilenameEnding, String mapBoxMapId, String mapBoxVersionBaseUrl) {
        super(name, zoomMinLevel, zoomMaxLevel, tileSizePixels, imageFilenameEnding, new String[]{mapBoxVersionBaseUrl});
        this.mapBoxMapId = "";
    }

    public final void retrieveMapBoxMapId(Context aContext) {
        this.mapBoxMapId = ManifestUtil.retrieveKey(aContext, MAPBOX_MAPID);
    }

    public final void retrieveAccessToken(Context aContext) {
        this.accessToken = ManifestUtil.retrieveKey(aContext, ACCESS_TOKEN);
    }

    public void setMapboxMapid(String key) {
        this.mapBoxMapId = key;
    }

    public String getMapBoxMapId() {
        return this.mapBoxMapId;
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
        return this.accessToken;
    }

    public void setAccessToken(String accessTokeninput) {
        this.accessToken = accessTokeninput;
    }
}
