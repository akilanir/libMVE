package org.osmdroid.tileprovider.modules;

import android.util.Log;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Set;
import java.util.zip.ZipEntry;
import java.util.zip.ZipException;
import java.util.zip.ZipFile;
import org.osmdroid.api.IMapView;
import org.osmdroid.tileprovider.MapTile;
import org.osmdroid.tileprovider.tilesource.ITileSource;

/* loaded from: org.osmdroid.osmdroid-android.5.0.1.jar:org/osmdroid/tileprovider/modules/ZipFileArchive.class */
public class ZipFileArchive implements IArchiveFile {
    private ZipFile mZipFile;

    public ZipFileArchive() {
    }

    private ZipFileArchive(ZipFile pZipFile) {
        this.mZipFile = pZipFile;
    }

    public static ZipFileArchive getZipFileArchive(File pFile) throws ZipException, IOException {
        return new ZipFileArchive(new ZipFile(pFile));
    }

    @Override // org.osmdroid.tileprovider.modules.IArchiveFile
    public void init(File pFile) throws Exception {
        this.mZipFile = new ZipFile(pFile);
    }

    @Override // org.osmdroid.tileprovider.modules.IArchiveFile
    public InputStream getInputStream(ITileSource pTileSource, MapTile pTile) {
        String path = pTileSource.getTileRelativeFilenameString(pTile);
        try {
            ZipEntry entry = this.mZipFile.getEntry(path);
            if (entry != null) {
                return this.mZipFile.getInputStream(entry);
            }
            return null;
        } catch (IOException e) {
            Log.w(IMapView.LOGTAG, "Error getting zip stream: " + pTile, e);
            return null;
        }
    }

    @Override // org.osmdroid.tileprovider.modules.IArchiveFile
    public Set<String> getTileSources() {
        Set<String> ret = new HashSet<>();
        try {
            Enumeration<? extends ZipEntry> entries = this.mZipFile.entries();
            while (entries.hasMoreElements()) {
                ZipEntry nextElement = entries.nextElement();
                String str = nextElement.getName();
                if (str.contains("/")) {
                    ret.add(str.split("/")[0]);
                }
            }
        } catch (Exception e) {
            Log.w(IMapView.LOGTAG, "Error getting tile sources: ", e);
        }
        return ret;
    }

    @Override // org.osmdroid.tileprovider.modules.IArchiveFile
    public void close() {
        try {
            this.mZipFile.close();
        } catch (IOException e) {
        }
    }

    public String toString() {
        return "ZipFileArchive [mZipFile=" + this.mZipFile.getName() + "]";
    }
}
