package org.osmdroid.tileprovider.modules;

import java.io.InputStream;
import org.osmdroid.tileprovider.MapTile;
import org.osmdroid.tileprovider.tilesource.ITileSource;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/tileprovider/modules/IFilesystemCache.class */
public interface IFilesystemCache {
    boolean saveFile(ITileSource iTileSource, MapTile mapTile, InputStream inputStream);
}
