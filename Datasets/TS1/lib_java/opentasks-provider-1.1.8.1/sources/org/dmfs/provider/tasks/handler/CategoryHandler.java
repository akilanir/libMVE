package org.dmfs.provider.tasks.handler;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import org.dmfs.provider.tasks.TaskContract;
import org.dmfs.provider.tasks.TaskDatabaseHelper;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/handler/CategoryHandler.class */
public class CategoryHandler extends PropertyHandler {
    private static final String[] CATEGORY_ID_PROJECTION = {"_id", "name", TaskContract.CategoriesColumns.COLOR};
    private static final String CATEGORY_ID_SELECTION = "_id=? and account_name=? and account_type=?";
    private static final String CATEGORY_NAME_SELECTION = "name=? and account_name=? and account_type=?";
    public static final String IS_NEW_CATEGORY = "is_new_category";

    /* JADX WARN: Removed duplicated region for block: B:38:0x0191 A[Catch: all -> 0x01ab, TryCatch #0 {all -> 0x01ab, blocks: (B:35:0x0131, B:37:0x013c, B:38:0x0191), top: B:50:0x0131 }] */
    @Override // org.dmfs.provider.tasks.handler.PropertyHandler
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public android.content.ContentValues validateValues(android.database.sqlite.SQLiteDatabase r10, long r11, long r13, boolean r15, android.content.ContentValues r16, boolean r17) {
        /*
            Method dump skipped, instructions count: 447
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.dmfs.provider.tasks.handler.CategoryHandler.validateValues(android.database.sqlite.SQLiteDatabase, long, long, boolean, android.content.ContentValues, boolean):android.content.ContentValues");
    }

    @Override // org.dmfs.provider.tasks.handler.PropertyHandler
    public long insert(SQLiteDatabase sQLiteDatabase, long j, ContentValues contentValues, boolean z) {
        ContentValues orInsertCategory = getOrInsertCategory(sQLiteDatabase, validateValues(sQLiteDatabase, j, -1L, true, contentValues, z));
        long insert = super.insert(sQLiteDatabase, j, orInsertCategory, z);
        insertRelation(sQLiteDatabase, j, orInsertCategory.getAsLong("data0").longValue(), insert);
        updateFTSEntry(sQLiteDatabase, j, insert, orInsertCategory.getAsString("data1"));
        return insert;
    }

    @Override // org.dmfs.provider.tasks.handler.PropertyHandler
    public int update(SQLiteDatabase sQLiteDatabase, long j, long j2, ContentValues contentValues, Cursor cursor, boolean z) {
        ContentValues orInsertCategory = getOrInsertCategory(sQLiteDatabase, validateValues(sQLiteDatabase, j, j2, false, contentValues, z));
        if (orInsertCategory.containsKey("data1")) {
            updateFTSEntry(sQLiteDatabase, j, j2, orInsertCategory.getAsString("data1"));
        }
        return super.update(sQLiteDatabase, j, j2, orInsertCategory, cursor, z);
    }

    private ContentValues getOrInsertCategory(SQLiteDatabase sQLiteDatabase, ContentValues contentValues) {
        if (contentValues.getAsBoolean(IS_NEW_CATEGORY).booleanValue()) {
            ContentValues contentValues2 = new ContentValues(4);
            contentValues2.put("account_name", contentValues.getAsString("account_name"));
            contentValues2.put("account_type", contentValues.getAsString("account_type"));
            contentValues2.put("name", contentValues.getAsString("data1"));
            contentValues2.put(TaskContract.CategoriesColumns.COLOR, contentValues.getAsInteger("data2"));
            contentValues.put("data0", Long.valueOf(sQLiteDatabase.insert(TaskDatabaseHelper.Tables.CATEGORIES, "", contentValues2)));
        }
        contentValues.remove(IS_NEW_CATEGORY);
        contentValues.remove("account_name");
        contentValues.remove("account_type");
        return contentValues;
    }

    private long insertRelation(SQLiteDatabase sQLiteDatabase, long j, long j2, long j3) {
        ContentValues contentValues = new ContentValues(3);
        contentValues.put("task_id", Long.valueOf(j));
        contentValues.put(TaskDatabaseHelper.CategoriesMapping.CATEGORY_ID, Long.valueOf(j2));
        contentValues.put("property_id", Long.valueOf(j3));
        return sQLiteDatabase.insert(TaskDatabaseHelper.Tables.CATEGORIES_MAPPING, "", contentValues);
    }
}
