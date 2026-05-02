package org.dmfs.provider.tasks.handler;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/handler/AlarmHandler.class */
public class AlarmHandler extends PropertyHandler {
    @Override // org.dmfs.provider.tasks.handler.PropertyHandler
    public ContentValues validateValues(SQLiteDatabase sQLiteDatabase, long j, long j2, boolean z, ContentValues contentValues, boolean z2) {
        if (contentValues.containsKey("property_id")) {
            throw new IllegalArgumentException("_ID can not be set manually");
        }
        if (!contentValues.containsKey("data0")) {
            throw new IllegalArgumentException("alarm property requires a time offset");
        }
        if (!contentValues.containsKey("data1") || contentValues.getAsInteger("data1").intValue() < 0) {
            throw new IllegalArgumentException("alarm property requires a valid reference date ");
        }
        if (contentValues.containsKey("data3")) {
            return contentValues;
        }
        throw new IllegalArgumentException("alarm property requires an alarm type");
    }

    @Override // org.dmfs.provider.tasks.handler.PropertyHandler
    public long insert(SQLiteDatabase sQLiteDatabase, long j, ContentValues contentValues, boolean z) {
        return super.insert(sQLiteDatabase, j, validateValues(sQLiteDatabase, j, -1L, true, contentValues, z), z);
    }

    @Override // org.dmfs.provider.tasks.handler.PropertyHandler
    public int update(SQLiteDatabase sQLiteDatabase, long j, long j2, ContentValues contentValues, Cursor cursor, boolean z) {
        return super.update(sQLiteDatabase, j, j2, validateValues(sQLiteDatabase, j, j2, false, contentValues, z), cursor, z);
    }
}
