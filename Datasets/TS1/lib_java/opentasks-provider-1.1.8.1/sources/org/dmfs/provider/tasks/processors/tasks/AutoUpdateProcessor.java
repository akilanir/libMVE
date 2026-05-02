package org.dmfs.provider.tasks.processors.tasks;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import org.dmfs.provider.tasks.TaskContract;
import org.dmfs.provider.tasks.TaskDatabaseHelper;
import org.dmfs.provider.tasks.model.TaskAdapter;
import org.dmfs.provider.tasks.processors.AbstractEntityProcessor;
import org.dmfs.rfc5545.DateTime;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/processors/tasks/AutoUpdateProcessor.class */
public class AutoUpdateProcessor extends AbstractEntityProcessor<TaskAdapter> {
    private static final String[] TASK_ID_PROJECTION = {"_id"};
    private static final String[] TASK_SYNC_ID_PROJECTION = {TaskContract.CommonSyncColumns._SYNC_ID};
    private static final String SYNC_ID_SELECTION = "_sync_id=?";
    private static final String TASK_ID_SELECTION = "_id=?";

    @Override // org.dmfs.provider.tasks.processors.AbstractEntityProcessor, org.dmfs.provider.tasks.processors.EntityProcessor
    public void beforeInsert(SQLiteDatabase sQLiteDatabase, TaskAdapter taskAdapter, boolean z) {
        updateFields(sQLiteDatabase, taskAdapter, z);
        if (z) {
            return;
        }
        taskAdapter.set(TaskAdapter.CREATED, new DateTime(System.currentTimeMillis()));
    }

    @Override // org.dmfs.provider.tasks.processors.AbstractEntityProcessor, org.dmfs.provider.tasks.processors.EntityProcessor
    public void afterInsert(SQLiteDatabase sQLiteDatabase, TaskAdapter taskAdapter, boolean z) {
        if (z && taskAdapter.isRecurring()) {
            ContentValues contentValues = new ContentValues(1);
            TaskAdapter.ORIGINAL_INSTANCE_ID.setIn(contentValues, Long.valueOf(taskAdapter.id()));
            sQLiteDatabase.update(TaskDatabaseHelper.Tables.TASKS, contentValues, "original_instance_sync_id=? and original_instance_id is null", new String[]{(String) taskAdapter.valueOf(TaskAdapter.SYNC_ID)});
        }
    }

    @Override // org.dmfs.provider.tasks.processors.AbstractEntityProcessor, org.dmfs.provider.tasks.processors.EntityProcessor
    public void beforeUpdate(SQLiteDatabase sQLiteDatabase, TaskAdapter taskAdapter, boolean z) {
        updateFields(sQLiteDatabase, taskAdapter, z);
    }

    @Override // org.dmfs.provider.tasks.processors.AbstractEntityProcessor, org.dmfs.provider.tasks.processors.EntityProcessor
    public void afterUpdate(SQLiteDatabase sQLiteDatabase, TaskAdapter taskAdapter, boolean z) {
        if (z && taskAdapter.isRecurring() && taskAdapter.isUpdated(TaskAdapter.SYNC_ID)) {
            ContentValues contentValues = new ContentValues(1);
            TaskAdapter.ORIGINAL_INSTANCE_SYNC_ID.setIn(contentValues, (String) taskAdapter.valueOf(TaskAdapter.SYNC_ID));
            sQLiteDatabase.update(TaskDatabaseHelper.Tables.TASKS, contentValues, "original_instance_id=" + taskAdapter.id(), null);
        }
    }

    private void updateFields(SQLiteDatabase sQLiteDatabase, TaskAdapter taskAdapter, boolean z) {
        Cursor query;
        Integer num;
        if (!z) {
            taskAdapter.set(TaskAdapter._DIRTY, true);
            taskAdapter.set(TaskAdapter.LAST_MODIFIED, new DateTime(System.currentTimeMillis()));
            if (taskAdapter.valueOf(TaskAdapter.COMPLETED) != null && !taskAdapter.isUpdated(TaskAdapter.STATUS)) {
                taskAdapter.set(TaskAdapter.STATUS, 2);
            }
        }
        if (taskAdapter.isUpdated(TaskAdapter.PRIORITY) && (num = (Integer) taskAdapter.valueOf(TaskAdapter.PRIORITY)) != null && num.intValue() == 0) {
            taskAdapter.set(TaskAdapter.PRIORITY, null);
        }
        if (taskAdapter.isUpdated(TaskAdapter.ORIGINAL_INSTANCE_SYNC_ID)) {
            query = sQLiteDatabase.query(TaskDatabaseHelper.Tables.TASKS, TASK_ID_PROJECTION, SYNC_ID_SELECTION, new String[]{(String) taskAdapter.valueOf(TaskAdapter.ORIGINAL_INSTANCE_SYNC_ID)}, null, null, null);
            try {
                if (query.moveToNext()) {
                    taskAdapter.set(TaskAdapter.ORIGINAL_INSTANCE_ID, Long.valueOf(query.getLong(0)));
                }
                if (query != null) {
                    query.close();
                }
            } finally {
                if (query != null) {
                    query.close();
                }
            }
        } else if (taskAdapter.isUpdated(TaskAdapter.ORIGINAL_INSTANCE_ID)) {
            query = sQLiteDatabase.query(TaskDatabaseHelper.Tables.TASKS, TASK_SYNC_ID_PROJECTION, TASK_ID_SELECTION, new String[]{Long.toString(((Long) taskAdapter.valueOf(TaskAdapter.ORIGINAL_INSTANCE_ID)).longValue())}, null, null, null);
            try {
                if (query.moveToNext()) {
                    taskAdapter.set(TaskAdapter.ORIGINAL_INSTANCE_SYNC_ID, query.getString(0));
                }
            } finally {
                if (query != null) {
                    query.close();
                }
            }
        }
        if (taskAdapter.isUpdated(TaskAdapter.PERCENT_COMPLETE)) {
            Integer num2 = (Integer) taskAdapter.valueOf(TaskAdapter.PERCENT_COMPLETE);
            if (!z && num2 != null && num2.intValue() == 100) {
                if (!taskAdapter.isUpdated(TaskAdapter.STATUS)) {
                    taskAdapter.set(TaskAdapter.STATUS, 2);
                }
                if (!taskAdapter.isUpdated(TaskAdapter.COMPLETED)) {
                    taskAdapter.set(TaskAdapter.COMPLETED, new DateTime(System.currentTimeMillis()));
                }
            } else if (!z && num2 != null && !taskAdapter.isUpdated(TaskAdapter.COMPLETED)) {
                taskAdapter.set(TaskAdapter.COMPLETED, null);
            }
        }
        if (taskAdapter.isUpdated(TaskAdapter.STATUS) || taskAdapter.id() < 0) {
            Integer num3 = (Integer) taskAdapter.valueOf(TaskAdapter.STATUS);
            if (num3 == null) {
                num3 = 0;
                taskAdapter.set(TaskAdapter.STATUS, null);
            }
            taskAdapter.set(TaskAdapter.IS_NEW, Boolean.valueOf(num3 == null || num3.intValue() == 0));
            taskAdapter.set(TaskAdapter.IS_CLOSED, Boolean.valueOf(num3 != null && (num3.intValue() == 2 || num3.intValue() == 3)));
            if (num3.intValue() != 2 || z) {
                if (z) {
                    return;
                }
                taskAdapter.set(TaskAdapter.COMPLETED, null);
            } else {
                taskAdapter.set(TaskAdapter.PERCENT_COMPLETE, 100);
                if (taskAdapter.isUpdated(TaskAdapter.COMPLETED)) {
                    return;
                }
                taskAdapter.set(TaskAdapter.COMPLETED, new DateTime(System.currentTimeMillis()));
            }
        }
    }
}
