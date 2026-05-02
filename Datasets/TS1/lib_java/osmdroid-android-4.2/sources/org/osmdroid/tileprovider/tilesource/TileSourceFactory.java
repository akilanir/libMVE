package org.osmdroid.tileprovider.tilesource;

import java.util.ArrayList;
import java.util.Iterator;
import org.osmdroid.ResourceProxy;

/* loaded from: osmdroid-android-4.2.jar:org/osmdroid/tileprovider/tilesource/TileSourceFactory.class */
public class TileSourceFactory {
    public static final OnlineTileSourceBase MAPNIK = new XYTileSource("Mapnik", ResourceProxy.string.mapnik, 0, 18, 256, ".png", new String[]{"http://a.tile.openstreetmap.org/", "http://b.tile.openstreetmap.org/", "http://c.tile.openstreetmap.org/"});
    public static final OnlineTileSourceBase CYCLEMAP = new XYTileSource("CycleMap", ResourceProxy.string.cyclemap, 0, 17, 256, ".png", new String[]{"http://a.tile.opencyclemap.org/cycle/", "http://b.tile.opencyclemap.org/cycle/", "http://c.tile.opencyclemap.org/cycle/"});
    public static final OnlineTileSourceBase PUBLIC_TRANSPORT = new XYTileSource("OSMPublicTransport", ResourceProxy.string.public_transport, 0, 17, 256, ".png", new String[]{"http://openptmap.org/tiles/"});
    public static final OnlineTileSourceBase MAPQUESTOSM = new XYTileSource("MapquestOSM", ResourceProxy.string.mapquest_osm, 0, 18, 256, ".png", new String[]{"http://otile1.mqcdn.com/tiles/1.0.0/map/", "http://otile2.mqcdn.com/tiles/1.0.0/map/", "http://otile3.mqcdn.com/tiles/1.0.0/map/", "http://otile4.mqcdn.com/tiles/1.0.0/map/"});
    public static final OnlineTileSourceBase MAPQUESTAERIAL = new XYTileSource("MapquestAerial", ResourceProxy.string.mapquest_aerial, 0, 11, 256, ".png", new String[]{"http://otile1.mqcdn.com/tiles/1.0.0/sat/", "http://otile2.mqcdn.com/tiles/1.0.0/sat/", "http://otile3.mqcdn.com/tiles/1.0.0/sat/", "http://otile4.mqcdn.com/tiles/1.0.0/sat/"});
    public static final OnlineTileSourceBase DEFAULT_TILE_SOURCE = MAPNIK;
    public static final OnlineTileSourceBase CLOUDMADESTANDARDTILES = new CloudmadeTileSource("CloudMadeStandardTiles", ResourceProxy.string.cloudmade_standard, 0, 18, 256, ".png", new String[]{"http://a.tile.cloudmade.com/%s/%d/%d/%d/%d/%d%s?token=%s", "http://b.tile.cloudmade.com/%s/%d/%d/%d/%d/%d%s?token=%s", "http://c.tile.cloudmade.com/%s/%d/%d/%d/%d/%d%s?token=%s"});
    public static final OnlineTileSourceBase CLOUDMADESMALLTILES = new CloudmadeTileSource("CloudMadeSmallTiles", ResourceProxy.string.cloudmade_small, 0, 21, 64, ".png", new String[]{"http://a.tile.cloudmade.com/%s/%d/%d/%d/%d/%d%s?token=%s", "http://b.tile.cloudmade.com/%s/%d/%d/%d/%d/%d%s?token=%s", "http://c.tile.cloudmade.com/%s/%d/%d/%d/%d/%d%s?token=%s"});
    public static final OnlineTileSourceBase FIETS_OVERLAY_NL = new XYTileSource("Fiets", ResourceProxy.string.fiets_nl, 3, 18, 256, ".png", new String[]{"http://overlay.openstreetmap.nl/openfietskaart-overlay/"});
    public static final OnlineTileSourceBase BASE_OVERLAY_NL = new XYTileSource("BaseNL", ResourceProxy.string.base_nl, 0, 18, 256, ".png", new String[]{"http://overlay.openstreetmap.nl/basemap/"});
    public static final OnlineTileSourceBase ROADS_OVERLAY_NL = new XYTileSource("RoadsNL", ResourceProxy.string.roads_nl, 0, 18, 256, ".png", new String[]{"http://overlay.openstreetmap.nl/roads/"});
    private static ArrayList<ITileSource> mTileSources = new ArrayList<>();

    public static ITileSource getTileSource(String aName) throws IllegalArgumentException {
        Iterator i$ = mTileSources.iterator();
        while (i$.hasNext()) {
            ITileSource tileSource = i$.next();
            if (tileSource.name().equals(aName)) {
                return tileSource;
            }
        }
        throw new IllegalArgumentException("No such tile source: " + aName);
    }

    public static boolean containsTileSource(String aName) {
        Iterator i$ = mTileSources.iterator();
        while (i$.hasNext()) {
            ITileSource tileSource = i$.next();
            if (tileSource.name().equals(aName)) {
                return true;
            }
        }
        return false;
    }

    public static ITileSource getTileSource(int aOrdinal) throws IllegalArgumentException {
        Iterator i$ = mTileSources.iterator();
        while (i$.hasNext()) {
            ITileSource tileSource = i$.next();
            if (tileSource.ordinal() == aOrdinal) {
                return tileSource;
            }
        }
        throw new IllegalArgumentException("No tile source at position: " + aOrdinal);
    }

    public static ArrayList<ITileSource> getTileSources() {
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
    }
}
