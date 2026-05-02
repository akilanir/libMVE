package org.osmdroid.tileprovider;

import android.content.Context;
import org.osmdroid.tileprovider.modules.INetworkAvailablityCheck;
import org.osmdroid.tileprovider.modules.MapTileDownloader;
import org.osmdroid.tileprovider.modules.MapTileFileArchiveProvider;
import org.osmdroid.tileprovider.modules.MapTileFilesystemProvider;
import org.osmdroid.tileprovider.modules.NetworkAvailabliltyCheck;
import org.osmdroid.tileprovider.modules.TileWriter;
import org.osmdroid.tileprovider.tilesource.ITileSource;
import org.osmdroid.tileprovider.tilesource.TileSourceFactory;
import org.osmdroid.tileprovider.util.SimpleRegisterReceiver;

/* loaded from: osmdroid-android-4.2.jar:org/osmdroid/tileprovider/MapTileProviderBasic.class */
public class MapTileProviderBasic extends MapTileProviderArray implements IMapTileProviderCallback {
    public MapTileProviderBasic(Context pContext) {
        this(pContext, TileSourceFactory.DEFAULT_TILE_SOURCE);
    }

    public MapTileProviderBasic(Context pContext, ITileSource pTileSource) {
        this(new SimpleRegisterReceiver(pContext), new NetworkAvailabliltyCheck(pContext), pTileSource);
    }

    public MapTileProviderBasic(IRegisterReceiver pRegisterReceiver, INetworkAvailablityCheck aNetworkAvailablityCheck, ITileSource pTileSource) {
        super(pTileSource, pRegisterReceiver);
        TileWriter tileWriter = new TileWriter();
        MapTileFilesystemProvider fileSystemProvider = new MapTileFilesystemProvider(pRegisterReceiver, pTileSource);
        this.mTileProviderList.add(fileSystemProvider);
        MapTileFileArchiveProvider archiveProvider = new MapTileFileArchiveProvider(pRegisterReceiver, pTileSource);
        this.mTileProviderList.add(archiveProvider);
        MapTileDownloader downloaderProvider = new MapTileDownloader(pTileSource, tileWriter, aNetworkAvailablityCheck);
        this.mTileProviderList.add(downloaderProvider);
    }
}
