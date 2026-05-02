package org.dmfs.provider.tasks.handler;

import android.content.ContentValues;
import android.database.sqlite.SQLiteDatabase;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/handler/DefaultPropertyHandler.class */
public class DefaultPropertyHandler extends PropertyHandler {
    @Override // org.dmfs.provider.tasks.handler.PropertyHandler
    public ContentValues validateValues(SQLiteDatabase sQLiteDatabase, long j, long j2, boolean z, ContentValues contentValues, boolean z2) {
        return contentValues;
    }
}
