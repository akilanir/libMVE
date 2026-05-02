package org.dmfs.provider.tasks;

import android.database.sqlite.SQLiteDatabase;
import java.util.Iterator;
import java.util.List;
import org.dmfs.provider.tasks.model.EntityAdapter;
import org.dmfs.provider.tasks.processors.EntityProcessor;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/ProviderOperation.class */
public enum ProviderOperation {
    INSERT { // from class: org.dmfs.provider.tasks.ProviderOperation.1
        @Override // org.dmfs.provider.tasks.ProviderOperation
        <T extends EntityAdapter<?>> void executeBeforeProcessor(SQLiteDatabase sQLiteDatabase, EntityProcessor<T> entityProcessor, T t, boolean z) {
            entityProcessor.beforeInsert(sQLiteDatabase, t, z);
        }

        @Override // org.dmfs.provider.tasks.ProviderOperation
        <T extends EntityAdapter<?>> void executeAfterProcessor(SQLiteDatabase sQLiteDatabase, EntityProcessor<T> entityProcessor, T t, boolean z) {
            entityProcessor.afterInsert(sQLiteDatabase, t, z);
        }
    },
    UPDATE { // from class: org.dmfs.provider.tasks.ProviderOperation.2
        @Override // org.dmfs.provider.tasks.ProviderOperation
        <T extends EntityAdapter<?>> void executeBeforeProcessor(SQLiteDatabase sQLiteDatabase, EntityProcessor<T> entityProcessor, T t, boolean z) {
            entityProcessor.beforeUpdate(sQLiteDatabase, t, z);
        }

        @Override // org.dmfs.provider.tasks.ProviderOperation
        <T extends EntityAdapter<?>> void executeAfterProcessor(SQLiteDatabase sQLiteDatabase, EntityProcessor<T> entityProcessor, T t, boolean z) {
            entityProcessor.afterUpdate(sQLiteDatabase, t, z);
        }
    },
    DELETE { // from class: org.dmfs.provider.tasks.ProviderOperation.3
        @Override // org.dmfs.provider.tasks.ProviderOperation
        <T extends EntityAdapter<?>> void executeBeforeProcessor(SQLiteDatabase sQLiteDatabase, EntityProcessor<T> entityProcessor, T t, boolean z) {
            entityProcessor.beforeDelete(sQLiteDatabase, t, z);
        }

        @Override // org.dmfs.provider.tasks.ProviderOperation
        <T extends EntityAdapter<?>> void executeAfterProcessor(SQLiteDatabase sQLiteDatabase, EntityProcessor<T> entityProcessor, T t, boolean z) {
            entityProcessor.afterDelete(sQLiteDatabase, t, z);
        }
    };

    private static final String TAG = "OpenTasks.Operation";

    abstract <T extends EntityAdapter<?>> void executeBeforeProcessor(SQLiteDatabase sQLiteDatabase, EntityProcessor<T> entityProcessor, T t, boolean z);

    abstract <T extends EntityAdapter<?>> void executeAfterProcessor(SQLiteDatabase sQLiteDatabase, EntityProcessor<T> entityProcessor, T t, boolean z);

    public <T extends EntityAdapter<?>> void execute(SQLiteDatabase sQLiteDatabase, List<EntityProcessor<T>> list, T t, boolean z, ProviderOperationsLog providerOperationsLog, String str) {
        System.currentTimeMillis();
        Iterator<EntityProcessor<T>> it = list.iterator();
        while (it.hasNext()) {
            executeBeforeProcessor(sQLiteDatabase, it.next(), t, z);
        }
        Iterator<EntityProcessor<T>> it2 = list.iterator();
        while (it2.hasNext()) {
            executeAfterProcessor(sQLiteDatabase, it2.next(), t, z);
        }
        if (this != UPDATE || t.hasUpdates()) {
            providerOperationsLog.log(this, t.uri(str));
        }
    }
}
