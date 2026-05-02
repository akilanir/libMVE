package org.osmdroid.tileprovider.modules;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.util.Log;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;
import java.util.HashSet;
import java.util.Set;
import org.osmdroid.api.IMapView;
import org.osmdroid.tileprovider.MapTile;
import org.osmdroid.tileprovider.tilesource.ITileSource;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/tileprovider/modules/DatabaseFileArchive.class */
public class DatabaseFileArchive implements IArchiveFile {
    public static final String TABLE = "tiles";
    private SQLiteDatabase mDatabase;

    public DatabaseFileArchive() {
    }

    private DatabaseFileArchive(SQLiteDatabase pDatabase) {
        this.mDatabase = pDatabase;
    }

    public static DatabaseFileArchive getDatabaseFileArchive(File pFile) throws SQLiteException {
        return new DatabaseFileArchive(SQLiteDatabase.openDatabase(pFile.getAbsolutePath(), null, 1));
    }

    @Override // org.osmdroid.tileprovider.modules.IArchiveFile
    public Set<String> getTileSources() {
        Set<String> ret = new HashSet<>();
        try {
            new String[1][0] = "provider";
            Cursor cur = this.mDatabase.rawQuery("SELECT distinct provider FROM tiles", null);
            while (cur.moveToNext()) {
                ret.add(cur.getString(0));
            }
            cur.close();
        } catch (Exception e) {
            Log.w(IMapView.LOGTAG, "Error getting tile sources: ", e);
        }
        return ret;
    }

    @Override // org.osmdroid.tileprovider.modules.IArchiveFile
    public void init(File pFile) throws Exception {
        this.mDatabase = SQLiteDatabase.openDatabase(pFile.getAbsolutePath(), null, 1);
    }

    public byte[] getImage(ITileSource pTileSource, MapTile pTile) {
        try {
            byte[] bits = null;
            String[] tile = {"tile"};
            long x = pTile.getX();
            long y = pTile.getY();
            long z = pTile.getZoomLevel();
            long index = (((z << ((int) z)) + x) << ((int) z)) + y;
            Cursor cur = this.mDatabase.query("tiles", tile, "key = " + index + " and provider = '" + pTileSource.name() + "'", null, null, null, null);
            if (cur.getCount() != 0) {
                cur.moveToFirst();
                bits = cur.getBlob(0);
            }
            cur.close();
            if (bits != null) {
                return bits;
            }
            return null;
        } catch (Throwable e) {
            Log.w(IMapView.LOGTAG, "Error getting db stream: " + pTile, e);
            return null;
        }
    }

    @Override // org.osmdroid.tileprovider.modules.IArchiveFile
    public InputStream getInputStream(ITileSource pTileSource, MapTile pTile) {
        try {
            InputStream ret = null;
            byte[] bits = getImage(pTileSource, pTile);
            if (bits != null) {
                ret = new ByteArrayInputStream(bits);
            }
            if (ret != null) {
                return ret;
            }
            return null;
        } catch (Throwable e) {
            Log.w(IMapView.LOGTAG, "Error getting db stream: " + pTile, e);
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
