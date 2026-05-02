package org.dmfs.provider.tasks.processors.tasks;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import org.dmfs.provider.tasks.TaskDatabaseHelper;
import org.dmfs.provider.tasks.model.CursorContentValuesTaskAdapter;
import org.dmfs.provider.tasks.model.EntityAdapter;
import org.dmfs.provider.tasks.model.TaskAdapter;
import org.dmfs.provider.tasks.processors.AbstractEntityProcessor;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/processors/tasks/ChangeListProcessor.class */
public class ChangeListProcessor extends AbstractEntityProcessor<TaskAdapter> {
    @Override // org.dmfs.provider.tasks.processors.AbstractEntityProcessor, org.dmfs.provider.tasks.processors.EntityProcessor
    public void beforeUpdate(SQLiteDatabase sQLiteDatabase, TaskAdapter taskAdapter, boolean z) {
        Long l;
        Cursor query;
        if (!z && taskAdapter.isUpdated(TaskAdapter.LIST_ID)) {
            long longValue = ((Long) taskAdapter.oldValueOf(TaskAdapter.LIST_ID)).longValue();
            long longValue2 = ((Long) taskAdapter.valueOf(TaskAdapter.LIST_ID)).longValue();
            if (longValue == longValue2) {
                return;
            }
            Long l2 = null;
            if (taskAdapter.valueOf(TaskAdapter.ORIGINAL_INSTANCE_ID) == null && taskAdapter.valueOf(TaskAdapter.ORIGINAL_INSTANCE_SYNC_ID) == null) {
                l = Long.valueOf(taskAdapter.id());
                l2 = moveTask(sQLiteDatabase, taskAdapter, longValue, longValue2, null, false);
            } else {
                l = (Long) taskAdapter.valueOf(TaskAdapter.ORIGINAL_INSTANCE_ID);
                if (l != null) {
                    query = sQLiteDatabase.query(TaskDatabaseHelper.Tables.TASKS, null, "_id=" + l, null, null, null, null);
                    try {
                        if (query.moveToFirst()) {
                            l2 = moveTask(sQLiteDatabase, new CursorContentValuesTaskAdapter(query, new ContentValues(16)), longValue, longValue2, null, true);
                        }
                    } finally {
                        query.close();
                    }
                }
                moveTask(sQLiteDatabase, taskAdapter, longValue, longValue2, l2, false);
            }
            if (taskAdapter.isRecurring() || taskAdapter.valueOf(TaskAdapter.ORIGINAL_INSTANCE_ID) != null) {
                query = sQLiteDatabase.query(TaskDatabaseHelper.Tables.TASKS, null, "original_instance_id=" + l + " and _id!=" + taskAdapter.id(), null, null, null, null);
                while (query.moveToNext()) {
                    try {
                        moveTask(sQLiteDatabase, new CursorContentValuesTaskAdapter(query, new ContentValues(16)), longValue, longValue2, l2, true);
                    } finally {
                        query.close();
                    }
                }
                query.close();
            }
        }
    }

    private Long moveTask(SQLiteDatabase sQLiteDatabase, TaskAdapter taskAdapter, long j, long j2, Long l, boolean z) {
        Long l2 = null;
        if (taskAdapter.valueOf(TaskAdapter.SYNC_ID) != null || taskAdapter.valueOf(TaskAdapter.ORIGINAL_INSTANCE_SYNC_ID) != null || taskAdapter.valueOf(TaskAdapter.SYNC_VERSION) != null) {
            EntityAdapter<TaskAdapter> duplicate2 = taskAdapter.duplicate2();
            duplicate2.set(TaskAdapter.LIST_ID, Long.valueOf(j));
            duplicate2.set(TaskAdapter.ORIGINAL_INSTANCE_ID, l);
            duplicate2.set(TaskAdapter._DELETED, true);
            duplicate2.unset(TaskAdapter.LIST_COLOR);
            duplicate2.unset(TaskAdapter.LIST_NAME);
            duplicate2.unset(TaskAdapter.ACCOUNT_NAME);
            duplicate2.unset(TaskAdapter.ACCOUNT_TYPE);
            duplicate2.unset(TaskAdapter.LIST_OWNER);
            duplicate2.unset(TaskAdapter.LIST_ACCESS_LEVEL);
            duplicate2.unset(TaskAdapter.LIST_VISIBLE);
            duplicate2.commit(sQLiteDatabase);
            l2 = Long.valueOf(duplicate2.id());
        }
        taskAdapter.set(TaskAdapter.LIST_ID, Long.valueOf(j2));
        taskAdapter.set(TaskAdapter._DIRTY, true);
        taskAdapter.set(TaskAdapter.SYNC1, null);
        taskAdapter.set(TaskAdapter.SYNC2, null);
        taskAdapter.set(TaskAdapter.SYNC3, null);
        taskAdapter.set(TaskAdapter.SYNC4, null);
        taskAdapter.set(TaskAdapter.SYNC5, null);
        taskAdapter.set(TaskAdapter.SYNC6, null);
        taskAdapter.set(TaskAdapter.SYNC7, null);
        taskAdapter.set(TaskAdapter.SYNC8, null);
        taskAdapter.set(TaskAdapter.SYNC_ID, null);
        taskAdapter.set(TaskAdapter.SYNC_VERSION, null);
        taskAdapter.set(TaskAdapter.ORIGINAL_INSTANCE_SYNC_ID, null);
        if (z) {
            taskAdapter.commit(sQLiteDatabase);
        }
        return l2;
    }
}
