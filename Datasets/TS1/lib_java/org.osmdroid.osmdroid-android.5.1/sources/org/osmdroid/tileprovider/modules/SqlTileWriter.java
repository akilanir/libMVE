package org.osmdroid.tileprovider.modules;

import android.content.ContentValues;
import android.database.sqlite.SQLiteDatabase;
import android.util.Log;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import org.osmdroid.api.IMapView;
import org.osmdroid.tileprovider.MapTile;
import org.osmdroid.tileprovider.constants.OpenStreetMapTileProviderConstants;
import org.osmdroid.tileprovider.tilesource.ITileSource;

/* loaded from: org.osmdroid.osmdroid-android.5.1.jar:org/osmdroid/tileprovider/modules/SqlTileWriter.class */
public class SqlTileWriter implements IFilesystemCache {
    final int questimate = 8000;
    final File db_file = new File(OpenStreetMapTileProviderConstants.TILE_PATH_BASE.getAbsolutePath() + File.separator + "cache.db");
    final SQLiteDatabase db = SQLiteDatabase.openOrCreateDatabase(this.db_file, (SQLiteDatabase.CursorFactory) null);

    public SqlTileWriter() {
        try {
            this.db.execSQL("CREATE TABLE tiles (key INTEGER , provider TEXT, tile BLOB, expires INTEGER, PRIMARY KEY (key, provider));");
        } catch (Throwable t) {
            t.printStackTrace();
        }
        Thread t2 = new Thread() { // from class: org.osmdroid.tileprovider.modules.SqlTileWriter.1
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                long now = System.currentTimeMillis();
                int rows = SqlTileWriter.this.db.delete("tiles", "expires < ?", new String[]{System.currentTimeMillis() + ""});
                Log.d(IMapView.LOGTAG, "Local storage cahce purged " + rows + " expired tiles in " + (System.currentTimeMillis() - now) + "ms, cache size is " + SqlTileWriter.this.db_file.length() + "bytes");
                long now2 = System.currentTimeMillis();
                if (SqlTileWriter.this.db_file.length() > OpenStreetMapTileProviderConstants.TILE_MAX_CACHE_SIZE_BYTES) {
                    long diff = OpenStreetMapTileProviderConstants.TILE_MAX_CACHE_SIZE_BYTES - SqlTileWriter.this.db_file.length();
                    long tilesToKill = diff / 8000;
                    try {
                        SqlTileWriter.this.db.execSQL("DELETE FROM tiles ORDER BY expires DESC LIMIT " + tilesToKill);
                    } catch (Throwable t3) {
                        t3.printStackTrace();
                    }
                    Log.d(IMapView.LOGTAG, "purge completed in " + (System.currentTimeMillis() - now2) + "ms, cache size is " + SqlTileWriter.this.db_file.length() + "bytes");
                }
                if (OpenStreetMapTileProviderConstants.DEBUGMODE) {
                    Log.d(IMapView.LOGTAG, "Finished init thread");
                }
            }
        };
        t2.setPriority(1);
        t2.start();
    }

    @Override // org.osmdroid.tileprovider.modules.IFilesystemCache
    public boolean saveFile(ITileSource pTileSourceInfo, MapTile pTile, InputStream pStream) {
        try {
            ContentValues cv = new ContentValues();
            long x = pTile.getX();
            long y = pTile.getY();
            long z = pTile.getZoomLevel();
            long index = (((z << ((int) z)) + x) << ((int) z)) + y;
            cv.put("provider", pTileSourceInfo.name());
            BufferedInputStream bis = new BufferedInputStream(pStream);
            List<Byte> list = new ArrayList<>();
            while (true) {
                int current = bis.read();
                if (current == -1) {
                    break;
                }
                list.add(Byte.valueOf((byte) current));
            }
            byte[] bits = new byte[list.size()];
            for (int i = 0; i < list.size(); i++) {
                bits[i] = list.get(i).byteValue();
            }
            cv.put("key", Long.valueOf(index));
            cv.put("tile", bits);
            if (pTile.getExpires() != null) {
                cv.put("expires", Long.valueOf(pTile.getExpires().getTime()));
            }
            this.db.delete("tiles", "key=? and provider=?", new String[]{index + "", pTileSourceInfo.name()});
            this.db.insert("tiles", null, cv);
            Log.d(IMapView.LOGTAG, "tile inserted " + pTileSourceInfo.name() + pTile.toString());
            return false;
        } catch (Throwable ex) {
            Log.e(IMapView.LOGTAG, "Unable to store cached tile from " + pTileSourceInfo.name() + " " + pTile.toString(), ex);
            return false;
        }
    }
}
