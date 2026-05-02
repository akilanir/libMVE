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

/* loaded from: osmdroid-android-4.3.jar:org/osmdroid/tileprovider/modules/MBTilesFileArchive.class */
public class MBTilesFileArchive implements IArchiveFile {
    private static final Logger logger = LoggerFactory.getLogger(MBTilesFileArchive.class);
    private final SQLiteDatabase mDatabase;
    public static final String TABLE_TILES = "tiles";
    public static final String COL_TILES_ZOOM_LEVEL = "zoom_level";
    public static final String COL_TILES_TILE_COLUMN = "tile_column";
    public static final String COL_TILES_TILE_ROW = "tile_row";
    public static final String COL_TILES_TILE_DATA = "tile_data";

    private MBTilesFileArchive(SQLiteDatabase pDatabase) {
        this.mDatabase = pDatabase;
    }

    public static MBTilesFileArchive getDatabaseFileArchive(File pFile) throws SQLiteException {
        return new MBTilesFileArchive(SQLiteDatabase.openDatabase(pFile.getAbsolutePath(), null, 17));
    }

    @Override // org.osmdroid.tileprovider.modules.IArchiveFile
    public InputStream getInputStream(ITileSource pTileSource, MapTile pTile) {
        try {
            InputStream ret = null;
            String[] tile = {COL_TILES_TILE_DATA};
            String[] xyz = {Integer.toString(pTile.getX()), Double.toString((Math.pow(2.0d, pTile.getZoomLevel()) - pTile.getY()) - 1.0d), Integer.toString(pTile.getZoomLevel())};
            Cursor cur = this.mDatabase.query(TABLE_TILES, tile, "tile_column=? and tile_row=? and zoom_level=?", xyz, null, null, null);
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
