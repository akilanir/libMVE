package org.osmdroid.tileprovider.modules;

import java.io.InputStream;
import org.osmdroid.tileprovider.MapTile;
import org.osmdroid.tileprovider.tilesource.ITileSource;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/tileprovider/modules/IFilesystemCache.class */
public interface IFilesystemCache {
    boolean saveFile(ITileSource iTileSource, MapTile mapTile, InputStream inputStream);
}
