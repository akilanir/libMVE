package org.dmfs.provider.tasks.processors.lists;

import android.database.sqlite.SQLiteDatabase;
import android.text.TextUtils;
import org.dmfs.provider.tasks.model.ListAdapter;
import org.dmfs.provider.tasks.processors.AbstractEntityProcessor;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/processors/lists/ListValidatorProcessor.class */
public class ListValidatorProcessor extends AbstractEntityProcessor<ListAdapter> {
    @Override // org.dmfs.provider.tasks.processors.AbstractEntityProcessor, org.dmfs.provider.tasks.processors.EntityProcessor
    public void beforeInsert(SQLiteDatabase sQLiteDatabase, ListAdapter listAdapter, boolean z) {
        if (!z) {
            throw new UnsupportedOperationException("Caller must be a sync adapter to create task lists");
        }
        if (TextUtils.isEmpty((CharSequence) listAdapter.valueOf(ListAdapter.ACCOUNT_NAME))) {
            throw new IllegalArgumentException("ACCOUNT_NAME is required on INSERT");
        }
        if (TextUtils.isEmpty((CharSequence) listAdapter.valueOf(ListAdapter.ACCOUNT_TYPE))) {
            throw new IllegalArgumentException("ACCOUNT_TYPE is required on INSERT");
        }
        verifyCommon(listAdapter, z);
    }

    @Override // org.dmfs.provider.tasks.processors.AbstractEntityProcessor, org.dmfs.provider.tasks.processors.EntityProcessor
    public void beforeUpdate(SQLiteDatabase sQLiteDatabase, ListAdapter listAdapter, boolean z) {
        if (listAdapter.isUpdated(ListAdapter.ACCOUNT_NAME)) {
            throw new IllegalArgumentException("ACCOUNT_NAME is write-once");
        }
        if (listAdapter.isUpdated(ListAdapter.ACCOUNT_TYPE)) {
            throw new IllegalArgumentException("ACCOUNT_TYPE is write-once");
        }
        verifyCommon(listAdapter, z);
    }

    @Override // org.dmfs.provider.tasks.processors.AbstractEntityProcessor, org.dmfs.provider.tasks.processors.EntityProcessor
    public void beforeDelete(SQLiteDatabase sQLiteDatabase, ListAdapter listAdapter, boolean z) {
        if (!z) {
            throw new UnsupportedOperationException("Caller must be a sync adapter to delete task lists");
        }
    }

    private void verifyCommon(ListAdapter listAdapter, boolean z) {
        if (listAdapter.isUpdated(ListAdapter._ID)) {
            throw new IllegalArgumentException("_ID can not be set manually");
        }
        if (z) {
            return;
        }
        if (listAdapter.isUpdated(ListAdapter.LIST_COLOR)) {
            throw new IllegalArgumentException("Only sync adapters can change the LIST_COLOR.");
        }
        if (listAdapter.isUpdated(ListAdapter.LIST_NAME)) {
            throw new IllegalArgumentException("Only sync adapters can change the LIST_NAME.");
        }
        if (listAdapter.isUpdated(ListAdapter.SYNC_ID)) {
            throw new IllegalArgumentException("Only sync adapters can change the _SYNC_ID.");
        }
        if (listAdapter.isUpdated(ListAdapter.SYNC_VERSION)) {
            throw new IllegalArgumentException("Only sync adapters can change SYNC_VERSION.");
        }
        if (listAdapter.isUpdated(ListAdapter.OWNER)) {
            throw new IllegalArgumentException("Only sync adapters can change the list OWNER.");
        }
    }
}
