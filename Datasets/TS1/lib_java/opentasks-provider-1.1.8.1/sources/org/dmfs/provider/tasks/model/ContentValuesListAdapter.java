package org.dmfs.provider.tasks.model;

import android.content.ContentValues;
import android.database.sqlite.SQLiteDatabase;
import org.dmfs.provider.tasks.TaskDatabaseHelper;
import org.dmfs.provider.tasks.model.adapters.FieldAdapter;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/model/ContentValuesListAdapter.class */
public class ContentValuesListAdapter extends AbstractListAdapter {
    private long mId;
    private final ContentValues mValues;

    public ContentValuesListAdapter(ContentValues contentValues) {
        this(-1L, contentValues);
    }

    public ContentValuesListAdapter(long j, ContentValues contentValues) {
        this.mId = j;
        this.mValues = contentValues;
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public long id() {
        return this.mId;
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public <T> T valueOf(FieldAdapter<T, ListAdapter> fieldAdapter) {
        return fieldAdapter.getFrom(this.mValues);
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public <T> T oldValueOf(FieldAdapter<T, ListAdapter> fieldAdapter) {
        return null;
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public <T> boolean isUpdated(FieldAdapter<T, ListAdapter> fieldAdapter) {
        return fieldAdapter.isSetIn(this.mValues);
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public boolean isWriteable() {
        return true;
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public boolean hasUpdates() {
        return this.mValues.size() > 0;
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public <T> void set(FieldAdapter<T, ListAdapter> fieldAdapter, T t) throws IllegalStateException {
        fieldAdapter.setIn(this.mValues, t);
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public <T> void unset(FieldAdapter<T, ListAdapter> fieldAdapter) throws IllegalStateException {
        fieldAdapter.removeFrom(this.mValues);
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public int commit(SQLiteDatabase sQLiteDatabase) {
        if (this.mValues.size() == 0) {
            return 0;
        }
        if (this.mId >= 0) {
            return sQLiteDatabase.update(TaskDatabaseHelper.Tables.LISTS, this.mValues, "_id=" + this.mId, null);
        }
        this.mId = sQLiteDatabase.insert(TaskDatabaseHelper.Tables.LISTS, null, this.mValues);
        return this.mId > 0 ? 1 : 0;
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    /* renamed from: duplicate, reason: merged with bridge method [inline-methods] */
    public EntityAdapter<ListAdapter> duplicate2() {
        return new ContentValuesListAdapter(new ContentValues(this.mValues));
    }
}
