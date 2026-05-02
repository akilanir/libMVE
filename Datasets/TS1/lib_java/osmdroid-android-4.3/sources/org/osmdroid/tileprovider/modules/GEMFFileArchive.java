package org.osmdroid.tileprovider.modules;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import org.osmdroid.tileprovider.MapTile;
import org.osmdroid.tileprovider.tilesource.ITileSource;
import org.osmdroid.util.GEMFFile;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/tileprovider/modules/GEMFFileArchive.class */
public class GEMFFileArchive implements IArchiveFile {
    private final GEMFFile mFile;

    private GEMFFileArchive(File pFile) throws FileNotFoundException, IOException {
        this.mFile = new GEMFFile(pFile);
    }

    public static GEMFFileArchive getGEMFFileArchive(File pFile) throws FileNotFoundException, IOException {
        return new GEMFFileArchive(pFile);
    }

    @Override // org.osmdroid.tileprovider.modules.IArchiveFile
    public InputStream getInputStream(ITileSource pTileSource, MapTile pTile) {
        return this.mFile.getInputStream(pTile.getX(), pTile.getY(), pTile.getZoomLevel());
    }

    @Override // org.osmdroid.tileprovider.modules.IArchiveFile
    public void close() {
        try {
            this.mFile.close();
        } catch (IOException e) {
        }
    }

    public String toString() {
        return "GEMFFileArchive [mGEMFFile=" + this.mFile.getName() + "]";
    }
}
