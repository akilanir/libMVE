package org.osmdroid.tileprovider.modules;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import org.osmdroid.tileprovider.MapTile;
import org.osmdroid.tileprovider.tilesource.ITileSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/tileprovider/modules/DatabaseFileArchive.class */
public class DatabaseFileArchive implements IArchiveFile {
    private static final Logger logger = LoggerFactory.getLogger(DatabaseFileArchive.class);
    private final SQLiteDatabase mDatabase;

    private DatabaseFileArchive(SQLiteDatabase pDatabase) {
        this.mDatabase = pDatabase;
    }

    public static DatabaseFileArchive getDatabaseFileArchive(File pFile) throws SQLiteException {
        return new DatabaseFileArchive(SQLiteDatabase.openOrCreateDatabase(pFile, (SQLiteDatabase.CursorFactory) null));
    }

    @Override // org.osmdroid.tileprovider.modules.IArchiveFile
    public InputStream getInputStream(ITileSource pTileSource, MapTile pTile) {
        try {
            InputStream ret = null;
            String[] tile = {"tile"};
            long x = pTile.getX();
            long y = pTile.getY();
            long z = pTile.getZoomLevel();
            long index = (((z << ((int) z)) + x) << ((int) z)) + y;
            Cursor cur = this.mDatabase.query(MBTilesFileArchive.TABLE_TILES, tile, "key = " + index + " and provider = '" + pTileSource.name() + "'", null, null, null, null);
            if (cur.getCount() != 0) {
                cur.moveToFirst();
                ret = new ByteArrayInputStream(cur.getBlob(0));
            }
            cur.close();
            if (ret != null) {
                return ret;
            }
            return null;
        } catch (Throwable e) {
            logger.warn("Error getting db stream: " + pTile, e);
            return null;
        }
    }

    @Override // org.osmdroid.tileprovider.modules.IArchiveFile
    public void close() {
        this.mDatabase.close();
    }

    public String toString() {
        return "DatabaseFileArchive [mDatabase=" + this.mDatabase.getPath() + "]";
    }
}
