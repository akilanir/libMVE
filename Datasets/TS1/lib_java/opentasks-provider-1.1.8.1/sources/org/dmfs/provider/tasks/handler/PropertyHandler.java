package org.dmfs.provider.tasks.handler;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import org.dmfs.provider.tasks.FTSDatabaseHelper;
import org.dmfs.provider.tasks.TaskDatabaseHelper;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/handler/PropertyHandler.class */
public abstract class PropertyHandler {
    public abstract ContentValues validateValues(SQLiteDatabase sQLiteDatabase, long j, long j2, boolean z, ContentValues contentValues, boolean z2);

    public long insert(SQLiteDatabase sQLiteDatabase, long j, ContentValues contentValues, boolean z) {
        return sQLiteDatabase.insert(TaskDatabaseHelper.Tables.PROPERTIES, "", contentValues);
    }

    public int update(SQLiteDatabase sQLiteDatabase, long j, long j2, ContentValues contentValues, Cursor cursor, boolean z) {
        return sQLiteDatabase.update(TaskDatabaseHelper.Tables.PROPERTIES, contentValues, "property_id=" + j2, null);
    }

    public int delete(SQLiteDatabase sQLiteDatabase, long j, long j2, Cursor cursor, boolean z) {
        return sQLiteDatabase.delete(TaskDatabaseHelper.Tables.PROPERTIES, "property_id=" + j2, null);
    }

    protected void updateFTSEntry(SQLiteDatabase sQLiteDatabase, long j, long j2, String str) {
        FTSDatabaseHelper.updatePropertyFTSEntry(sQLiteDatabase, j, j2, str);
    }
}
