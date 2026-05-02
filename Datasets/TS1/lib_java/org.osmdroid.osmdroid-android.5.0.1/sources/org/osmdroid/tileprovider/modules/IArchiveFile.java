package org.osmdroid.tileprovider.modules;

import java.io.File;
import java.io.InputStream;
import java.util.Set;
import org.osmdroid.tileprovider.MapTile;
import org.osmdroid.tileprovider.tilesource.ITileSource;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/tileprovider/modules/IArchiveFile.class */
public interface IArchiveFile {
    void init(File file) throws Exception;

    InputStream getInputStream(ITileSource iTileSource, MapTile mapTile);

    void close();

    Set<String> getTileSources();
}
