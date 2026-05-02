package org.dmfs.provider.tasks.processors.tasks;

import android.database.sqlite.SQLiteDatabase;
import org.dmfs.provider.tasks.TaskContract;
import org.dmfs.provider.tasks.TaskDatabaseHelper;
import org.dmfs.provider.tasks.model.TaskAdapter;
import org.dmfs.provider.tasks.processors.AbstractEntityProcessor;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/processors/tasks/TaskExecutionProcessor.class */
public class TaskExecutionProcessor extends AbstractEntityProcessor<TaskAdapter> {
    @Override // org.dmfs.provider.tasks.processors.AbstractEntityProcessor, org.dmfs.provider.tasks.processors.EntityProcessor
    public void beforeInsert(SQLiteDatabase sQLiteDatabase, TaskAdapter taskAdapter, boolean z) {
        taskAdapter.commit(sQLiteDatabase);
    }

    @Override // org.dmfs.provider.tasks.processors.AbstractEntityProcessor, org.dmfs.provider.tasks.processors.EntityProcessor
    public void beforeUpdate(SQLiteDatabase sQLiteDatabase, TaskAdapter taskAdapter, boolean z) {
        taskAdapter.commit(sQLiteDatabase);
    }

    @Override // org.dmfs.provider.tasks.processors.AbstractEntityProcessor, org.dmfs.provider.tasks.processors.EntityProcessor
    public void beforeDelete(SQLiteDatabase sQLiteDatabase, TaskAdapter taskAdapter, boolean z) {
        String str = (String) taskAdapter.valueOf(TaskAdapter.ACCOUNT_TYPE);
        if (z || TaskContract.LOCAL_ACCOUNT_TYPE.equals(str)) {
            sQLiteDatabase.delete(TaskDatabaseHelper.Tables.TASKS, "_id=" + taskAdapter.id(), null);
        } else {
            taskAdapter.set(TaskAdapter._DELETED, true);
            taskAdapter.commit(sQLiteDatabase);
        }
    }
}
