package com.facebook.stetho.inspector.database;

import android.annotation.TargetApi;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteStatement;
import com.facebook.stetho.common.Util;
import com.facebook.stetho.inspector.protocol.module.Database;
import com.facebook.stetho.inspector.protocol.module.DatabaseConstants;
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.annotation.concurrent.ThreadSafe;

@ThreadSafe
/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/database/SqliteDatabaseDriver.class */
public class SqliteDatabaseDriver extends Database.DatabaseDriver {
    private static final String[] UNINTERESTING_FILENAME_SUFFIXES = {"-journal", "-shm", "-uid", "-wal"};
    private final DatabaseFilesProvider mDatabaseFilesProvider;
    private List<String> mDatabases;

    @Deprecated
    public SqliteDatabaseDriver(Context context) {
        this(context, new DefaultDatabaseFilesProvider(context));
    }

    public SqliteDatabaseDriver(Context context, DatabaseFilesProvider databaseFilesProvider) {
        super(context);
        this.mDatabaseFilesProvider = databaseFilesProvider;
    }

    @Override // com.facebook.stetho.inspector.protocol.module.Database.DatabaseDriver
    public List<String> getDatabaseNames() {
        if (this.mDatabases == null) {
            this.mDatabases = new ArrayList();
            List<File> potentialDatabaseFiles = this.mDatabaseFilesProvider.getDatabaseFiles();
            Collections.sort(potentialDatabaseFiles);
            Iterable<File> tidiedList = tidyDatabaseList(potentialDatabaseFiles);
            for (File database : tidiedList) {
                String name = database.getName();
                this.mDatabases.add(name);
            }
        }
        return this.mDatabases;
    }

    static List<File> tidyDatabaseList(List<File> databaseFiles) {
        Set<File> originalAsSet = new HashSet<>(databaseFiles);
        List<File> tidiedList = new ArrayList<>();
        for (File databaseFile : databaseFiles) {
            String databaseFilename = databaseFile.getPath();
            String sansSuffix = removeSuffix(databaseFilename, UNINTERESTING_FILENAME_SUFFIXES);
            if (sansSuffix.equals(databaseFilename) || !originalAsSet.contains(new File(sansSuffix))) {
                tidiedList.add(databaseFile);
            }
        }
        return tidiedList;
    }

    private static String removeSuffix(String str, String[] suffixesToRemove) {
        for (String suffix : suffixesToRemove) {
            if (str.endsWith(suffix)) {
                return str.substring(0, str.length() - suffix.length());
            }
        }
        return str;
    }

    @Override // com.facebook.stetho.inspector.protocol.module.Database.DatabaseDriver
    public List<String> getTableNames(String databaseName) throws SQLiteException {
        SQLiteDatabase database = openDatabase(databaseName);
        try {
            Cursor cursor = database.rawQuery("SELECT name FROM sqlite_master WHERE type IN (?, ?)", new String[]{"table", "view"});
            try {
                List<String> tableNames = new ArrayList<>();
                while (cursor.moveToNext()) {
                    tableNames.add(cursor.getString(0));
                }
                database.close();
                return tableNames;
            } finally {
                cursor.close();
            }
        } catch (Throwable th) {
            database.close();
            throw th;
        }
    }

    @Override // com.facebook.stetho.inspector.protocol.module.Database.DatabaseDriver
    public Database.ExecuteSQLResponse executeSQL(String databaseName, String query, Database.DatabaseDriver.ExecuteResultHandler<Database.ExecuteSQLResponse> handler) throws SQLiteException {
        Util.throwIfNull(query);
        Util.throwIfNull(handler);
        SQLiteDatabase database = openDatabase(databaseName);
        try {
            String firstWordUpperCase = getFirstWord(query).toUpperCase();
            switch (firstWordUpperCase) {
                case "UPDATE":
                case "DELETE":
                    Database.ExecuteSQLResponse executeSQLResponse = (Database.ExecuteSQLResponse) executeUpdateDelete(database, query, handler);
                    database.close();
                    return executeSQLResponse;
                case "INSERT":
                    Database.ExecuteSQLResponse executeSQLResponse2 = (Database.ExecuteSQLResponse) executeInsert(database, query, handler);
                    database.close();
                    return executeSQLResponse2;
                case "SELECT":
                case "PRAGMA":
                case "EXPLAIN":
                    Database.ExecuteSQLResponse executeSQLResponse3 = (Database.ExecuteSQLResponse) executeSelect(database, query, handler);
                    database.close();
                    return executeSQLResponse3;
                default:
                    Database.ExecuteSQLResponse executeSQLResponse4 = (Database.ExecuteSQLResponse) executeRawQuery(database, query, handler);
                    database.close();
                    return executeSQLResponse4;
            }
        } catch (Throwable th) {
            database.close();
            throw th;
        }
    }

    private static String getFirstWord(String s) {
        String s2 = s.trim();
        int firstSpace = s2.indexOf(32);
        return firstSpace >= 0 ? s2.substring(0, firstSpace) : s2;
    }

    @TargetApi(DatabaseConstants.MIN_API_LEVEL)
    private <T> T executeUpdateDelete(SQLiteDatabase database, String query, Database.DatabaseDriver.ExecuteResultHandler<T> handler) {
        SQLiteStatement statement = database.compileStatement(query);
        int count = statement.executeUpdateDelete();
        return handler.handleUpdateDelete(count);
    }

    private <T> T executeInsert(SQLiteDatabase database, String query, Database.DatabaseDriver.ExecuteResultHandler<T> handler) {
        SQLiteStatement statement = database.compileStatement(query);
        long count = statement.executeInsert();
        return handler.handleInsert(count);
    }

    private <T> T executeSelect(SQLiteDatabase database, String query, Database.DatabaseDriver.ExecuteResultHandler<T> handler) {
        Cursor cursor = database.rawQuery(query, null);
        try {
            T handleSelect = handler.handleSelect(cursor);
            cursor.close();
            return handleSelect;
        } catch (Throwable th) {
            cursor.close();
            throw th;
        }
    }

    private <T> T executeRawQuery(SQLiteDatabase database, String query, Database.DatabaseDriver.ExecuteResultHandler<T> handler) {
        database.execSQL(query);
        return handler.handleRawQuery();
    }

    private SQLiteDatabase openDatabase(String databaseName) throws SQLiteException {
        Util.throwIfNull(databaseName);
        File databaseFile = this.mContext.getDatabasePath(databaseName);
        return SQLiteDatabase.openDatabase(databaseFile.getAbsolutePath(), null, 0);
    }
}
