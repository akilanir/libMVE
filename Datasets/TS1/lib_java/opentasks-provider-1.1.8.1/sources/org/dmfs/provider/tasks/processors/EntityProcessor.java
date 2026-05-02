package org.dmfs.provider.tasks.processors;

import android.database.sqlite.SQLiteDatabase;
import org.dmfs.provider.tasks.model.EntityAdapter;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/processors/EntityProcessor.class */
public interface EntityProcessor<T extends EntityAdapter<?>> {
    void beforeInsert(SQLiteDatabase sQLiteDatabase, T t, boolean z);

    void afterInsert(SQLiteDatabase sQLiteDatabase, T t, boolean z);

    void beforeUpdate(SQLiteDatabase sQLiteDatabase, T t, boolean z);

    void afterUpdate(SQLiteDatabase sQLiteDatabase, T t, boolean z);

    void beforeDelete(SQLiteDatabase sQLiteDatabase, T t, boolean z);

    void afterDelete(SQLiteDatabase sQLiteDatabase, T t, boolean z);
}
