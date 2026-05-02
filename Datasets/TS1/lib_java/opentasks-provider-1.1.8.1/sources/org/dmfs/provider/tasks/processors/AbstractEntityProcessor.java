package org.dmfs.provider.tasks.processors;

import android.database.sqlite.SQLiteDatabase;
import org.dmfs.provider.tasks.model.EntityAdapter;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/processors/AbstractEntityProcessor.class */
public abstract class AbstractEntityProcessor<T extends EntityAdapter<?>> implements EntityProcessor<T> {
    @Override // org.dmfs.provider.tasks.processors.EntityProcessor
    public void beforeInsert(SQLiteDatabase sQLiteDatabase, T t, boolean z) {
    }

    @Override // org.dmfs.provider.tasks.processors.EntityProcessor
    public void afterInsert(SQLiteDatabase sQLiteDatabase, T t, boolean z) {
    }

    @Override // org.dmfs.provider.tasks.processors.EntityProcessor
    public void beforeUpdate(SQLiteDatabase sQLiteDatabase, T t, boolean z) {
    }

    @Override // org.dmfs.provider.tasks.processors.EntityProcessor
    public void afterUpdate(SQLiteDatabase sQLiteDatabase, T t, boolean z) {
    }

    @Override // org.dmfs.provider.tasks.processors.EntityProcessor
    public void beforeDelete(SQLiteDatabase sQLiteDatabase, T t, boolean z) {
    }

    @Override // org.dmfs.provider.tasks.processors.EntityProcessor
    public void afterDelete(SQLiteDatabase sQLiteDatabase, T t, boolean z) {
    }
}
