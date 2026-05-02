package com.facebook.stetho.inspector.database;

import android.content.Context;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/inspector/database/DefaultDatabaseFilesProvider.class */
public final class DefaultDatabaseFilesProvider implements DatabaseFilesProvider {
    private final Context mContext;

    public DefaultDatabaseFilesProvider(Context context) {
        this.mContext = context;
    }

    @Override // com.facebook.stetho.inspector.database.DatabaseFilesProvider
    public List<File> getDatabaseFiles() {
        List<File> databaseFiles = new ArrayList<>();
        for (String filename : this.mContext.databaseList()) {
            databaseFiles.add(new File(filename));
        }
        return databaseFiles;
    }
}
