package org.dmfs.provider.tasks.processors.tasks;

import android.content.ContentValues;
import android.database.sqlite.SQLiteDatabase;
import org.dmfs.provider.tasks.TaskContract;
import org.dmfs.provider.tasks.TaskDatabaseHelper;
import org.dmfs.provider.tasks.model.TaskAdapter;
import org.dmfs.provider.tasks.processors.AbstractEntityProcessor;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/processors/tasks/RelationProcessor.class */
public class RelationProcessor extends AbstractEntityProcessor<TaskAdapter> {
    @Override // org.dmfs.provider.tasks.processors.AbstractEntityProcessor, org.dmfs.provider.tasks.processors.EntityProcessor
    public void afterInsert(SQLiteDatabase sQLiteDatabase, TaskAdapter taskAdapter, boolean z) {
        String str;
        if (z && (str = (String) taskAdapter.valueOf(TaskAdapter._UID)) != null) {
            ContentValues contentValues = new ContentValues(1);
            contentValues.put("data1", Long.valueOf(taskAdapter.id()));
            sQLiteDatabase.update(TaskDatabaseHelper.Tables.PROPERTIES, contentValues, "mimetype= ? AND data3=?", new String[]{TaskContract.Property.Relation.CONTENT_ITEM_TYPE, str});
        }
    }

    @Override // org.dmfs.provider.tasks.processors.AbstractEntityProcessor, org.dmfs.provider.tasks.processors.EntityProcessor
    public void afterUpdate(SQLiteDatabase sQLiteDatabase, TaskAdapter taskAdapter, boolean z) {
        String str;
        if (z && (str = (String) taskAdapter.valueOf(TaskAdapter._UID)) != null) {
            ContentValues contentValues = new ContentValues(1);
            contentValues.put("data3", str);
            sQLiteDatabase.update(TaskDatabaseHelper.Tables.PROPERTIES, contentValues, "mimetype= ? AND data1=?", new String[]{TaskContract.Property.Relation.CONTENT_ITEM_TYPE, Long.toString(taskAdapter.id())});
        }
    }

    @Override // org.dmfs.provider.tasks.processors.AbstractEntityProcessor, org.dmfs.provider.tasks.processors.EntityProcessor
    public void afterDelete(SQLiteDatabase sQLiteDatabase, TaskAdapter taskAdapter, boolean z) {
        if (z) {
            sQLiteDatabase.delete(TaskDatabaseHelper.Tables.PROPERTIES, "mimetype= ? AND data1=?", new String[]{TaskContract.Property.Relation.CONTENT_ITEM_TYPE, Long.toString(taskAdapter.id())});
        }
    }
}
