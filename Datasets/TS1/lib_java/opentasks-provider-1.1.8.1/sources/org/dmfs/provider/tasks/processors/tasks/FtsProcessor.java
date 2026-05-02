package org.dmfs.provider.tasks.processors.tasks;

import android.database.sqlite.SQLiteDatabase;
import org.dmfs.provider.tasks.FTSDatabaseHelper;
import org.dmfs.provider.tasks.model.TaskAdapter;
import org.dmfs.provider.tasks.processors.AbstractEntityProcessor;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/processors/tasks/FtsProcessor.class */
public class FtsProcessor extends AbstractEntityProcessor<TaskAdapter> {
    @Override // org.dmfs.provider.tasks.processors.AbstractEntityProcessor, org.dmfs.provider.tasks.processors.EntityProcessor
    public void afterInsert(SQLiteDatabase sQLiteDatabase, TaskAdapter taskAdapter, boolean z) {
        FTSDatabaseHelper.updateTaskFTSEntries(sQLiteDatabase, taskAdapter);
    }

    @Override // org.dmfs.provider.tasks.processors.AbstractEntityProcessor, org.dmfs.provider.tasks.processors.EntityProcessor
    public void afterUpdate(SQLiteDatabase sQLiteDatabase, TaskAdapter taskAdapter, boolean z) {
        FTSDatabaseHelper.updateTaskFTSEntries(sQLiteDatabase, taskAdapter);
    }
}
