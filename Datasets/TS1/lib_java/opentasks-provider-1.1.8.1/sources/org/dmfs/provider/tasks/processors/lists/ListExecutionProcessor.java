package org.dmfs.provider.tasks.processors.lists;

import android.database.sqlite.SQLiteDatabase;
import org.dmfs.provider.tasks.TaskDatabaseHelper;
import org.dmfs.provider.tasks.model.ListAdapter;
import org.dmfs.provider.tasks.processors.AbstractEntityProcessor;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/processors/lists/ListExecutionProcessor.class */
public class ListExecutionProcessor extends AbstractEntityProcessor<ListAdapter> {
    @Override // org.dmfs.provider.tasks.processors.AbstractEntityProcessor, org.dmfs.provider.tasks.processors.EntityProcessor
    public void beforeInsert(SQLiteDatabase sQLiteDatabase, ListAdapter listAdapter, boolean z) {
        listAdapter.commit(sQLiteDatabase);
    }

    @Override // org.dmfs.provider.tasks.processors.AbstractEntityProcessor, org.dmfs.provider.tasks.processors.EntityProcessor
    public void beforeUpdate(SQLiteDatabase sQLiteDatabase, ListAdapter listAdapter, boolean z) {
        listAdapter.commit(sQLiteDatabase);
    }

    @Override // org.dmfs.provider.tasks.processors.AbstractEntityProcessor, org.dmfs.provider.tasks.processors.EntityProcessor
    public void beforeDelete(SQLiteDatabase sQLiteDatabase, ListAdapter listAdapter, boolean z) {
        sQLiteDatabase.delete(TaskDatabaseHelper.Tables.LISTS, "_id=" + listAdapter.id(), null);
    }
}
