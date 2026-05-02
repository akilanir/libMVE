package org.osmdroid.tileprovider.modules;

import android.util.Log;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashSet;
import java.util.Set;
import org.osmdroid.api.IMapView;
import org.osmdroid.tileprovider.MapTile;
import org.osmdroid.tileprovider.tilesource.ITileSource;
import org.osmdroid.util.GEMFFile;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/tileprovider/modules/GEMFFileArchive.class */
public class GEMFFileArchive implements IArchiveFile {
    private GEMFFile mFile;

    public GEMFFileArchive() {
    }

    private GEMFFileArchive(File pFile) throws FileNotFoundException, IOException {
        this.mFile = new GEMFFile(pFile);
    }

    public static GEMFFileArchive getGEMFFileArchive(File pFile) throws FileNotFoundException, IOException {
        return new GEMFFileArchive(pFile);
    }

    @Override // org.osmdroid.tileprovider.modules.IArchiveFile
    public void init(File pFile) throws Exception {
        this.mFile = new GEMFFile(pFile);
    }

    @Override // org.osmdroid.tileprovider.modules.IArchiveFile
    public InputStream getInputStream(ITileSource pTileSource, MapTile pTile) {
        return this.mFile.getInputStream(pTile.getX(), pTile.getY(), pTile.getZoomLevel());
    }

    @Override // org.osmdroid.tileprovider.modules.IArchiveFile
    public Set<String> getTileSources() {
        Set<String> ret = new HashSet<>();
        try {
            ret.addAll(this.mFile.getSources().values());
        } catch (Exception e) {
            Log.w(IMapView.LOGTAG, "Error getting tile sources: ", e);
        }
        return ret;
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
