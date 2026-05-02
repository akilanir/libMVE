package org.dmfs.provider.tasks.handler;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import org.dmfs.provider.tasks.TaskContract;
import org.dmfs.provider.tasks.TaskDatabaseHelper;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/handler/RelationHandler.class */
public class RelationHandler extends PropertyHandler {
    @Override // org.dmfs.provider.tasks.handler.PropertyHandler
    public ContentValues validateValues(SQLiteDatabase sQLiteDatabase, long j, long j2, boolean z, ContentValues contentValues, boolean z2) {
        if (contentValues.containsKey("data5")) {
            throw new IllegalArgumentException("setting of RELATED_CONTENT_URI not allowed");
        }
        Long asLong = contentValues.getAsLong("data1");
        String asString = contentValues.getAsString("data3");
        String asString2 = contentValues.getAsString("data4");
        if (asLong == null && asString2 == null && asString != null) {
            contentValues.putNull("data1");
            contentValues.putNull("data4");
        } else if (asLong == null && asString == null && asString2 != null) {
            contentValues.putNull("data1");
            contentValues.putNull("data3");
        } else {
            if (asLong == null || asString != null || asString2 != null) {
                throw new IllegalArgumentException("exactly one of RELATED_ID, RELATED_UID and RELATED_URI must be non-null");
            }
            contentValues.putNull("data4");
            contentValues.putNull("data3");
        }
        return contentValues;
    }

    @Override // org.dmfs.provider.tasks.handler.PropertyHandler
    public long insert(SQLiteDatabase sQLiteDatabase, long j, ContentValues contentValues, boolean z) {
        validateValues(sQLiteDatabase, j, -1L, true, contentValues, z);
        resolveFields(sQLiteDatabase, contentValues);
        updateParentId(sQLiteDatabase, j, contentValues, null);
        return super.insert(sQLiteDatabase, j, contentValues, z);
    }

    @Override // org.dmfs.provider.tasks.handler.PropertyHandler
    public int update(SQLiteDatabase sQLiteDatabase, long j, long j2, ContentValues contentValues, Cursor cursor, boolean z) {
        validateValues(sQLiteDatabase, j, j2, false, contentValues, z);
        resolveFields(sQLiteDatabase, contentValues);
        updateParentId(sQLiteDatabase, j, contentValues, cursor);
        return super.update(sQLiteDatabase, j, j2, contentValues, cursor, z);
    }

    @Override // org.dmfs.provider.tasks.handler.PropertyHandler
    public int delete(SQLiteDatabase sQLiteDatabase, long j, long j2, Cursor cursor, boolean z) {
        clearParentId(sQLiteDatabase, j, cursor);
        return super.delete(sQLiteDatabase, j, j2, cursor, z);
    }

    private void resolveFields(SQLiteDatabase sQLiteDatabase, ContentValues contentValues) {
        Long asLong = contentValues.getAsLong("data1");
        String asString = contentValues.getAsString("data3");
        if (asLong != null) {
            contentValues.put("data3", resolveTaskStringField(sQLiteDatabase, "_id", asLong.toString(), TaskContract.TaskSyncColumns._UID));
        } else if (asString != null) {
            contentValues.put("data1", resolveTaskLongField(sQLiteDatabase, TaskContract.TaskSyncColumns._UID, asString, "_id"));
        }
    }

    private Long resolveTaskLongField(SQLiteDatabase sQLiteDatabase, String str, String str2, String str3) {
        String resolveTaskStringField = resolveTaskStringField(sQLiteDatabase, str, str2, str3);
        if (resolveTaskStringField != null) {
            return Long.valueOf(Long.parseLong(resolveTaskStringField));
        }
        return null;
    }

    private String resolveTaskStringField(SQLiteDatabase sQLiteDatabase, String str, String str2, String str3) {
        Cursor query = sQLiteDatabase.query(TaskDatabaseHelper.Tables.TASKS, new String[]{str3}, str + "=?", new String[]{str2}, null, null, null);
        if (query == null) {
            return null;
        }
        try {
            if (!query.moveToNext()) {
                query.close();
                return null;
            }
            String string = query.getString(0);
            query.close();
            return string;
        } catch (Throwable th) {
            query.close();
            throw th;
        }
    }

    private void updateParentId(SQLiteDatabase sQLiteDatabase, long j, ContentValues contentValues, Cursor cursor) {
        int intValue = contentValues.containsKey("data2") ? contentValues.getAsInteger("data2").intValue() : cursor.getInt(cursor.getColumnIndex("data2"));
        if (intValue == TaskContract.Property.Relation.RelType.PARENT.ordinal()) {
            if (contentValues.containsKey("data1")) {
                ContentValues contentValues2 = new ContentValues(1);
                contentValues2.put(TaskContract.TaskColumns.PARENT_ID, contentValues.getAsLong("data1"));
                sQLiteDatabase.update(TaskDatabaseHelper.Tables.TASKS, contentValues2, "_id=" + j, null);
                return;
            }
            return;
        }
        if (intValue == TaskContract.Property.Relation.RelType.CHILD.ordinal()) {
            if (contentValues.getAsLong("data1") != null) {
                ContentValues contentValues3 = new ContentValues(1);
                contentValues3.put(TaskContract.TaskColumns.PARENT_ID, Long.valueOf(j));
                sQLiteDatabase.update(TaskDatabaseHelper.Tables.TASKS, contentValues3, "_id=" + contentValues.getAsLong("data1"), null);
                return;
            }
            return;
        }
        if (intValue != TaskContract.Property.Relation.RelType.SIBLING.ordinal() || contentValues.getAsLong("data1") == null) {
            return;
        }
        Long resolveTaskLongField = resolveTaskLongField(sQLiteDatabase, "_id", contentValues.getAsString("data1"), TaskContract.TaskColumns.PARENT_ID);
        ContentValues contentValues4 = new ContentValues(1);
        contentValues4.put(TaskContract.TaskColumns.PARENT_ID, resolveTaskLongField);
        sQLiteDatabase.update(TaskDatabaseHelper.Tables.TASKS, contentValues4, "_id=" + j, null);
    }

    private void clearParentId(SQLiteDatabase sQLiteDatabase, long j, Cursor cursor) {
        int i = cursor.getInt(cursor.getColumnIndex("data2"));
        if (i == TaskContract.Property.Relation.RelType.PARENT.ordinal()) {
            ContentValues contentValues = new ContentValues(1);
            contentValues.putNull(TaskContract.TaskColumns.PARENT_ID);
            sQLiteDatabase.update(TaskDatabaseHelper.Tables.TASKS, contentValues, "_id=" + j, null);
        } else {
            if (i != TaskContract.Property.Relation.RelType.CHILD.ordinal()) {
                if (i == TaskContract.Property.Relation.RelType.SIBLING.ordinal()) {
                }
                return;
            }
            int columnIndex = cursor.getColumnIndex("data1");
            if (cursor.isNull(columnIndex)) {
                return;
            }
            ContentValues contentValues2 = new ContentValues(1);
            contentValues2.putNull(TaskContract.TaskColumns.PARENT_ID);
            sQLiteDatabase.update(TaskDatabaseHelper.Tables.TASKS, contentValues2, "_id=" + cursor.getLong(columnIndex), null);
        }
    }
}
