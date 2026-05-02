package com.facebook.stetho.inspector.database;

import android.content.ContentResolver;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteException;
import com.facebook.stetho.BuildConfig;
import com.facebook.stetho.inspector.protocol.module.Database;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.concurrent.ThreadSafe;

@ThreadSafe
/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/database/ContentProviderDatabaseDriver.class */
public class ContentProviderDatabaseDriver extends Database.DatabaseDriver {
    private static final String sDatabaseName = "content-providers";
    private final ContentProviderSchema[] mContentProviderSchemas;
    private List<String> mDatabaseNames;
    private List<String> mTableNames;

    public ContentProviderDatabaseDriver(Context context, ContentProviderSchema... contentProviderSchemas) {
        super(context);
        this.mContentProviderSchemas = contentProviderSchemas;
    }

    @Override // com.facebook.stetho.inspector.protocol.module.Database.DatabaseDriver
    public List<String> getDatabaseNames() {
        if (this.mDatabaseNames == null && this.mContentProviderSchemas != null) {
            this.mDatabaseNames = new ArrayList();
            this.mDatabaseNames.add(sDatabaseName);
        }
        return this.mDatabaseNames;
    }

    @Override // com.facebook.stetho.inspector.protocol.module.Database.DatabaseDriver
    public List<String> getTableNames(String databaseId) {
        if (this.mTableNames == null) {
            this.mTableNames = new ArrayList();
            for (ContentProviderSchema schema : this.mContentProviderSchemas) {
                this.mTableNames.add(schema.getTableName());
            }
        }
        return this.mTableNames;
    }

    @Override // com.facebook.stetho.inspector.protocol.module.Database.DatabaseDriver
    public Database.ExecuteSQLResponse executeSQL(String databaseName, String query, Database.DatabaseDriver.ExecuteResultHandler<Database.ExecuteSQLResponse> handler) throws SQLiteException {
        String tableName = fetchTableName(query);
        int index = this.mTableNames.indexOf(tableName);
        ContentProviderSchema contentProviderSchema = this.mContentProviderSchemas[index];
        ContentResolver contentResolver = this.mContext.getContentResolver();
        Cursor cursor = contentResolver.query(contentProviderSchema.getUri(), contentProviderSchema.getProjection(), null, null, null);
        try {
            Database.ExecuteSQLResponse handleSelect = handler.handleSelect(cursor);
            cursor.close();
            return handleSelect;
        } catch (Throwable th) {
            cursor.close();
            throw th;
        }
    }

    private String fetchTableName(String query) {
        for (String tableName : this.mTableNames) {
            if (query.contains(tableName)) {
                return tableName;
            }
        }
        return BuildConfig.FLAVOR;
    }
}
