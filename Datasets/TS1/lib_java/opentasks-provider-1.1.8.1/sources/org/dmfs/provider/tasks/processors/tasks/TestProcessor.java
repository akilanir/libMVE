package org.dmfs.provider.tasks.processors.tasks;

import android.database.sqlite.SQLiteDatabase;
import android.util.Log;
import org.dmfs.provider.tasks.model.TaskAdapter;
import org.dmfs.provider.tasks.processors.AbstractEntityProcessor;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/processors/tasks/TestProcessor.class */
public class TestProcessor extends AbstractEntityProcessor<TaskAdapter> {
    @Override // org.dmfs.provider.tasks.processors.AbstractEntityProcessor, org.dmfs.provider.tasks.processors.EntityProcessor
    public void beforeInsert(SQLiteDatabase sQLiteDatabase, TaskAdapter taskAdapter, boolean z) {
        Log.d("TestProcessor", "before insert processor called");
    }

    @Override // org.dmfs.provider.tasks.processors.AbstractEntityProcessor, org.dmfs.provider.tasks.processors.EntityProcessor
    public void afterInsert(SQLiteDatabase sQLiteDatabase, TaskAdapter taskAdapter, boolean z) {
        Log.d("TestProcessor", "after insert processor called for " + taskAdapter.id());
    }

    @Override // org.dmfs.provider.tasks.processors.AbstractEntityProcessor, org.dmfs.provider.tasks.processors.EntityProcessor
    public void beforeUpdate(SQLiteDatabase sQLiteDatabase, TaskAdapter taskAdapter, boolean z) {
        Log.d("TestProcessor", "before update processor called for " + taskAdapter.id());
    }

    @Override // org.dmfs.provider.tasks.processors.AbstractEntityProcessor, org.dmfs.provider.tasks.processors.EntityProcessor
    public void afterUpdate(SQLiteDatabase sQLiteDatabase, TaskAdapter taskAdapter, boolean z) {
        Log.d("TestProcessor", "after update processor called for " + taskAdapter.id());
    }

    @Override // org.dmfs.provider.tasks.processors.AbstractEntityProcessor, org.dmfs.provider.tasks.processors.EntityProcessor
    public void beforeDelete(SQLiteDatabase sQLiteDatabase, TaskAdapter taskAdapter, boolean z) {
        Log.d("TestProcessor", "before delete processor called for " + taskAdapter.id());
    }

    @Override // org.dmfs.provider.tasks.processors.AbstractEntityProcessor, org.dmfs.provider.tasks.processors.EntityProcessor
    public void afterDelete(SQLiteDatabase sQLiteDatabase, TaskAdapter taskAdapter, boolean z) {
        Log.i("TestProcessor", "after delete processor called for " + taskAdapter.id());
    }
}
