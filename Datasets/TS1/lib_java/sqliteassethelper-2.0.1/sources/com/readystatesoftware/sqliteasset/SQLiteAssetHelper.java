package com.readystatesoftware.sqliteasset;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.zip.ZipInputStream;

/* loaded from: sqliteassethelper-2.0.1.jar:com/readystatesoftware/sqliteasset/SQLiteAssetHelper.class */
public class SQLiteAssetHelper extends SQLiteOpenHelper {
    private static final String TAG = SQLiteAssetHelper.class.getSimpleName();
    private static final String ASSET_DB_PATH = "databases";
    private final Context mContext;
    private final String mName;
    private final SQLiteDatabase.CursorFactory mFactory;
    private final int mNewVersion;
    private SQLiteDatabase mDatabase;
    private boolean mIsInitializing;
    private String mDatabasePath;
    private String mAssetPath;
    private String mUpgradePathFormat;
    private int mForcedUpgradeVersion;

    public SQLiteAssetHelper(Context context, String name, String storageDirectory, SQLiteDatabase.CursorFactory factory, int version) {
        super(context, name, factory, version);
        this.mDatabase = null;
        this.mIsInitializing = false;
        this.mForcedUpgradeVersion = 0;
        if (version < 1) {
            throw new IllegalArgumentException("Version must be >= 1, was " + version);
        }
        if (name == null) {
            throw new IllegalArgumentException("Database name cannot be null");
        }
        this.mContext = context;
        this.mName = name;
        this.mFactory = factory;
        this.mNewVersion = version;
        this.mAssetPath = "databases/" + name;
        if (storageDirectory != null) {
            this.mDatabasePath = storageDirectory;
        } else {
            this.mDatabasePath = context.getApplicationInfo().dataDir + "/databases";
        }
        this.mUpgradePathFormat = "databases/" + name + "_upgrade_%s-%s.sql";
    }

    public SQLiteAssetHelper(Context context, String name, SQLiteDatabase.CursorFactory factory, int version) {
        this(context, name, null, factory, version);
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public synchronized SQLiteDatabase getWritableDatabase() {
        if (this.mDatabase != null && this.mDatabase.isOpen() && !this.mDatabase.isReadOnly()) {
            return this.mDatabase;
        }
        if (this.mIsInitializing) {
            throw new IllegalStateException("getWritableDatabase called recursively");
        }
        SQLiteDatabase db = null;
        try {
            this.mIsInitializing = true;
            db = createOrOpenDatabase(false);
            int version = db.getVersion();
            if (version != 0 && version < this.mForcedUpgradeVersion) {
                db = createOrOpenDatabase(true);
                db.setVersion(this.mNewVersion);
                version = db.getVersion();
            }
            if (version != this.mNewVersion) {
                db.beginTransaction();
                try {
                    if (version == 0) {
                        onCreate(db);
                    } else {
                        if (version > this.mNewVersion) {
                            Log.w(TAG, "Can't downgrade read-only database from version " + version + " to " + this.mNewVersion + ": " + db.getPath());
                        }
                        onUpgrade(db, version, this.mNewVersion);
                    }
                    db.setVersion(this.mNewVersion);
                    db.setTransactionSuccessful();
                    db.endTransaction();
                } catch (Throwable th) {
                    db.endTransaction();
                    throw th;
                }
            }
            onOpen(db);
            SQLiteDatabase sQLiteDatabase = db;
            this.mIsInitializing = false;
            if (1 != 0) {
                if (this.mDatabase != null) {
                    try {
                        this.mDatabase.close();
                    } catch (Exception e) {
                    }
                }
                this.mDatabase = db;
            } else if (db != null) {
                db.close();
            }
            return sQLiteDatabase;
        } catch (Throwable th2) {
            this.mIsInitializing = false;
            if (0 != 0) {
                if (this.mDatabase != null) {
                    try {
                        this.mDatabase.close();
                    } catch (Exception e2) {
                    }
                }
                this.mDatabase = db;
            } else if (db != null) {
                db.close();
            }
            throw th2;
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public synchronized SQLiteDatabase getReadableDatabase() {
        if (this.mDatabase != null && this.mDatabase.isOpen()) {
            return this.mDatabase;
        }
        if (this.mIsInitializing) {
            throw new IllegalStateException("getReadableDatabase called recursively");
        }
        try {
            return getWritableDatabase();
        } catch (SQLiteException e) {
            if (this.mName == null) {
                throw e;
            }
            Log.e(TAG, "Couldn't open " + this.mName + " for writing (will try read-only):", e);
            SQLiteDatabase db = null;
            try {
                this.mIsInitializing = true;
                String path = this.mContext.getDatabasePath(this.mName).getPath();
                SQLiteDatabase db2 = SQLiteDatabase.openDatabase(path, this.mFactory, 1);
                if (db2.getVersion() != this.mNewVersion) {
                    throw new SQLiteException("Can't upgrade read-only database from version " + db2.getVersion() + " to " + this.mNewVersion + ": " + path);
                }
                onOpen(db2);
                Log.w(TAG, "Opened " + this.mName + " in read-only mode");
                this.mDatabase = db2;
                SQLiteDatabase sQLiteDatabase = this.mDatabase;
                this.mIsInitializing = false;
                if (db2 != null && db2 != this.mDatabase) {
                    db2.close();
                }
                return sQLiteDatabase;
            } catch (Throwable th) {
                this.mIsInitializing = false;
                if (0 != 0 && null != this.mDatabase) {
                    db.close();
                }
                throw th;
            }
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper, java.lang.AutoCloseable
    public synchronized void close() {
        if (this.mIsInitializing) {
            throw new IllegalStateException("Closed during initialization");
        }
        if (this.mDatabase != null && this.mDatabase.isOpen()) {
            this.mDatabase.close();
            this.mDatabase = null;
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onConfigure(SQLiteDatabase db) {
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onCreate(SQLiteDatabase db) {
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        Log.w(TAG, "Upgrading database " + this.mName + " from version " + oldVersion + " to " + newVersion + "...");
        ArrayList<String> paths = new ArrayList<>();
        getUpgradeFilePaths(oldVersion, newVersion - 1, newVersion, paths);
        if (paths.isEmpty()) {
            Log.e(TAG, "no upgrade script path from " + oldVersion + " to " + newVersion);
            throw new SQLiteAssetException("no upgrade script path from " + oldVersion + " to " + newVersion);
        }
        Collections.sort(paths, new VersionComparator());
        Iterator i$ = paths.iterator();
        while (i$.hasNext()) {
            String path = i$.next();
            try {
                Log.w(TAG, "processing upgrade: " + path);
                InputStream is = this.mContext.getAssets().open(path);
                String sql = Utils.convertStreamToString(is);
                if (sql != null) {
                    List<String> cmds = Utils.splitSqlScript(sql, ';');
                    for (String cmd : cmds) {
                        if (cmd.trim().length() > 0) {
                            db.execSQL(cmd);
                        }
                    }
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        Log.w(TAG, "Successfully upgraded database " + this.mName + " from version " + oldVersion + " to " + newVersion);
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onDowngrade(SQLiteDatabase db, int oldVersion, int newVersion) {
    }

    @Deprecated
    public void setForcedUpgradeVersion(int version) {
        setForcedUpgrade(version);
    }

    public void setForcedUpgrade(int version) {
        this.mForcedUpgradeVersion = version;
    }

    public void setForcedUpgrade() {
        setForcedUpgrade(this.mNewVersion);
    }

    private SQLiteDatabase createOrOpenDatabase(boolean force) throws SQLiteAssetException {
        SQLiteDatabase db = null;
        File file = new File(this.mDatabasePath + "/" + this.mName);
        if (file.exists()) {
            db = returnDatabase();
        }
        if (db != null) {
            if (force) {
                Log.w(TAG, "forcing database upgrade!");
                copyDatabaseFromAssets();
                db = returnDatabase();
            }
            return db;
        }
        copyDatabaseFromAssets();
        SQLiteDatabase db2 = returnDatabase();
        return db2;
    }

    private SQLiteDatabase returnDatabase() {
        try {
            SQLiteDatabase db = SQLiteDatabase.openDatabase(this.mDatabasePath + "/" + this.mName, this.mFactory, 0);
            Log.i(TAG, "successfully opened database " + this.mName);
            return db;
        } catch (SQLiteException e) {
            Log.w(TAG, "could not open database " + this.mName + " - " + e.getMessage());
            return null;
        }
    }

    private void copyDatabaseFromAssets() throws SQLiteAssetException {
        InputStream is;
        Log.w(TAG, "copying database from assets...");
        String path = this.mAssetPath;
        String dest = this.mDatabasePath + "/" + this.mName;
        boolean isZip = false;
        try {
            is = this.mContext.getAssets().open(path);
        } catch (IOException e) {
            try {
                is = this.mContext.getAssets().open(path + ".zip");
                isZip = true;
            } catch (IOException e2) {
                try {
                    is = this.mContext.getAssets().open(path + ".gz");
                } catch (IOException e3) {
                    SQLiteAssetException se = new SQLiteAssetException("Missing " + this.mAssetPath + " file (or .zip, .gz archive) in assets, or target folder not writable");
                    se.setStackTrace(e3.getStackTrace());
                    throw se;
                }
            }
        }
        try {
            File f = new File(this.mDatabasePath + "/");
            if (!f.exists()) {
                f.mkdir();
            }
            if (isZip) {
                ZipInputStream zis = Utils.getFileFromZip(is);
                if (zis == null) {
                    throw new SQLiteAssetException("Archive is missing a SQLite database file");
                }
                Utils.writeExtractedFileToDisk(zis, new FileOutputStream(dest));
            } else {
                Utils.writeExtractedFileToDisk(is, new FileOutputStream(dest));
            }
            Log.w(TAG, "database copy complete");
        } catch (IOException e4) {
            SQLiteAssetException se2 = new SQLiteAssetException("Unable to write " + dest + " to data directory");
            se2.setStackTrace(e4.getStackTrace());
            throw se2;
        }
    }

    private InputStream getUpgradeSQLStream(int oldVersion, int newVersion) {
        String path = String.format(this.mUpgradePathFormat, Integer.valueOf(oldVersion), Integer.valueOf(newVersion));
        try {
            return this.mContext.getAssets().open(path);
        } catch (IOException e) {
            Log.w(TAG, "missing database upgrade script: " + path);
            return null;
        }
    }

    private void getUpgradeFilePaths(int baseVersion, int start, int end, ArrayList<String> paths) {
        int a;
        int b;
        InputStream is = getUpgradeSQLStream(start, end);
        if (is != null) {
            String path = String.format(this.mUpgradePathFormat, Integer.valueOf(start), Integer.valueOf(end));
            paths.add(path);
            a = start - 1;
            b = start;
        } else {
            a = start - 1;
            b = end;
        }
        if (a < baseVersion) {
            return;
        }
        getUpgradeFilePaths(baseVersion, a, b, paths);
    }

    /* loaded from: sqliteassethelper-2.0.1.jar:com/readystatesoftware/sqliteasset/SQLiteAssetHelper$SQLiteAssetException.class */
    public static class SQLiteAssetException extends SQLiteException {
        public SQLiteAssetException() {
        }

        public SQLiteAssetException(String error) {
            super(error);
        }
    }
}
