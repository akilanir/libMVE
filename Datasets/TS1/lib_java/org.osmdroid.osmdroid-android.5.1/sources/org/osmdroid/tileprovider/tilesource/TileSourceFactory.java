package org.osmdroid.tileprovider.tilesource;

import java.util.ArrayList;
import java.util.List;
import org.osmdroid.tileprovider.MapTile;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/tileprovider/tilesource/TileSourceFactory.class */
public class TileSourceFactory {
    public static final OnlineTileSourceBase MAPNIK = new XYTileSource("Mapnik", 0, 18, 256, ".png", new String[]{"http://a.tile.openstreetmap.org/", "http://b.tile.openstreetmap.org/", "http://c.tile.openstreetmap.org/"});
    public static final OnlineTileSourceBase CYCLEMAP = new XYTileSource("CycleMap", 0, 17, 256, ".png", new String[]{"http://a.tile.opencyclemap.org/cycle/", "http://b.tile.opencyclemap.org/cycle/", "http://c.tile.opencyclemap.org/cycle/"});
    public static final OnlineTileSourceBase PUBLIC_TRANSPORT = new XYTileSource("OSMPublicTransport", 0, 17, 256, ".png", new String[]{"http://openptmap.org/tiles/"});
    public static final OnlineTileSourceBase MAPQUESTOSM = new XYTileSource("MapquestOSM", 0, 18, 256, ".jpg", new String[]{"http://otile1.mqcdn.com/tiles/1.0.0/map/", "http://otile2.mqcdn.com/tiles/1.0.0/map/", "http://otile3.mqcdn.com/tiles/1.0.0/map/", "http://otile4.mqcdn.com/tiles/1.0.0/map/"});
    public static final OnlineTileSourceBase MAPQUESTAERIAL = new XYTileSource("MapquestAerial", 0, 11, 256, ".jpg", new String[]{"http://otile1.mqcdn.com/tiles/1.0.0/sat/", "http://otile2.mqcdn.com/tiles/1.0.0/sat/", "http://otile3.mqcdn.com/tiles/1.0.0/sat/", "http://otile4.mqcdn.com/tiles/1.0.0/sat/"});
    public static final OnlineTileSourceBase MAPQUESTAERIAL_US = new XYTileSource("MapquestAerialUSA", 0, 18, 256, ".jpg", new String[]{"http://otile1.mqcdn.com/tiles/1.0.0/sat/", "http://otile2.mqcdn.com/tiles/1.0.0/sat/", "http://otile3.mqcdn.com/tiles/1.0.0/sat/", "http://otile4.mqcdn.com/tiles/1.0.0/sat/"});
    public static final OnlineTileSourceBase DEFAULT_TILE_SOURCE = MAPNIK;
    public static final OnlineTileSourceBase CLOUDMADESTANDARDTILES = new CloudmadeTileSource("CloudMadeStandardTiles", 0, 18, 256, ".png", new String[]{"http://a.tile.cloudmade.com/%s/%d/%d/%d/%d/%d%s?token=%s", "http://b.tile.cloudmade.com/%s/%d/%d/%d/%d/%d%s?token=%s", "http://c.tile.cloudmade.com/%s/%d/%d/%d/%d/%d%s?token=%s"});
    public static final OnlineTileSourceBase CLOUDMADESMALLTILES = new CloudmadeTileSource("CloudMadeSmallTiles", 0, 21, 64, ".png", new String[]{"http://a.tile.cloudmade.com/%s/%d/%d/%d/%d/%d%s?token=%s", "http://b.tile.cloudmade.com/%s/%d/%d/%d/%d/%d%s?token=%s", "http://c.tile.cloudmade.com/%s/%d/%d/%d/%d/%d%s?token=%s"});
    public static final OnlineTileSourceBase FIETS_OVERLAY_NL = new XYTileSource("Fiets", 3, 18, 256, ".png", new String[]{"http://overlay.openstreetmap.nl/openfietskaart-overlay/"});
    public static final OnlineTileSourceBase BASE_OVERLAY_NL = new XYTileSource("BaseNL", 0, 18, 256, ".png", new String[]{"http://overlay.openstreetmap.nl/basemap/"});
    public static final OnlineTileSourceBase ROADS_OVERLAY_NL = new XYTileSource("RoadsNL", 0, 18, 256, ".png", new String[]{"http://overlay.openstreetmap.nl/roads/"});
    public static final OnlineTileSourceBase HIKEBIKEMAP = new XYTileSource("HikeBikeMap", 0, 18, 256, ".png", new String[]{"http://a.tiles.wmflabs.org/hikebike/", "http://b.tiles.wmflabs.org/hikebike/", "http://c.tiles.wmflabs.org/hikebike/"});
    public static final OnlineTileSourceBase USGS_TOPO = new OnlineTileSourceBase("USGS National Map Topo", 0, 18, 256, "", new String[]{"http://basemap.nationalmap.gov/ArcGIS/rest/services/USGSTopo/MapServer/tile/"}) { // from class: org.osmdroid.tileprovider.tilesource.TileSourceFactory.1
        @Override // org.osmdroid.tileprovider.tilesource.OnlineTileSourceBase
        public String getTileURLString(MapTile aTile) {
            return getBaseUrl() + aTile.getZoomLevel() + "/" + aTile.getY() + "/" + aTile.getX();
        }
    };
    public static final OnlineTileSourceBase USGS_SAT = new OnlineTileSourceBase("USGS National Map Sat", 0, 18, 256, "", new String[]{"http://basemap.nationalmap.gov/arcgis/rest/services/USGSImageryTopo/MapServer/tile/"}) { // from class: org.osmdroid.tileprovider.tilesource.TileSourceFactory.2
        @Override // org.osmdroid.tileprovider.tilesource.OnlineTileSourceBase
        public String getTileURLString(MapTile aTile) {
            return getBaseUrl() + aTile.getZoomLevel() + "/" + aTile.getY() + "/" + aTile.getX();
        }
    };
    private static List<ITileSource> mTileSources = new ArrayList();

    public static ITileSource getTileSource(String aName) throws IllegalArgumentException {
        for (ITileSource tileSource : mTileSources) {
            if (tileSource.name().equals(aName)) {
                return tileSource;
            }
        }
        throw new IllegalArgumentException("No such tile source: " + aName);
    }

    public static boolean containsTileSource(String aName) {
        for (ITileSource tileSource : mTileSources) {
            if (tileSource.name().equals(aName)) {
                return true;
            }
        }
        return false;
    }

    @Deprecated
    public static ITileSource getTileSource(int aOrdinal) throws IllegalArgumentException {
        for (ITileSource tileSource : mTileSources) {
            if (tileSource.ordinal() == aOrdinal) {
                return tileSource;
            }
        }
        throw new IllegalArgumentException("No tile source at position: " + aOrdinal);
    }

    public static List<ITileSource> getTileSources() {
        return mTileSources;
    }

    public static void addTileSource(ITileSource mTileSource) {
        mTileSources.add(mTileSource);
    }

    static {
        mTileSources.add(MAPNIK);
        mTileSources.add(CYCLEMAP);
        mTileSources.add(PUBLIC_TRANSPORT);
        mTileSources.add(MAPQUESTOSM);
        mTileSources.add(MAPQUESTAERIAL);
        mTileSources.add(HIKEBIKEMAP);
        mTileSources.add(USGS_TOPO);
        mTileSources.add(USGS_SAT);
    }
}
