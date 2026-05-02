package org.osmdroid.tileprovider.modules;

import android.database.sqlite.SQLiteException;
import java.io.File;
import java.io.IOException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/* loaded from: osmdroid-android-4.2.jar:org/osmdroid/tileprovider/modules/ArchiveFileFactory.class */
public class ArchiveFileFactory {
    private static final Logger logger = LoggerFactory.getLogger(ArchiveFileFactory.class);

    public static IArchiveFile getArchiveFile(File pFile) {
        if (pFile.getName().endsWith(".zip")) {
            try {
                return ZipFileArchive.getZipFileArchive(pFile);
            } catch (IOException e) {
                logger.error("Error opening ZIP file", e);
            }
        }
        if (pFile.getName().endsWith(".sqlite")) {
            try {
                return DatabaseFileArchive.getDatabaseFileArchive(pFile);
            } catch (SQLiteException e2) {
                logger.error("Error opening SQL file", e2);
            }
        }
        if (pFile.getName().endsWith(".mbtiles")) {
            try {
                return MBTilesFileArchive.getDatabaseFileArchive(pFile);
            } catch (SQLiteException e3) {
                logger.error("Error opening MBTiles SQLite file", e3);
            }
        }
        if (pFile.getName().endsWith(".gemf")) {
            try {
                return GEMFFileArchive.getGEMFFileArchive(pFile);
            } catch (IOException e4) {
                logger.error("Error opening GEMF file", e4);
                return null;
            }
        }
        return null;
    }
}
