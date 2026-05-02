package org.dmfs.provider.tasks.model;

import android.content.ContentValues;
import android.database.sqlite.SQLiteDatabase;
import org.dmfs.provider.tasks.TaskDatabaseHelper;
import org.dmfs.provider.tasks.model.adapters.FieldAdapter;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/model/ContentValuesTaskAdapter.class */
public class ContentValuesTaskAdapter extends AbstractTaskAdapter {
    private long mId;
    private final ContentValues mValues;

    public ContentValuesTaskAdapter(ContentValues contentValues) {
        this(-1L, contentValues);
    }

    public ContentValuesTaskAdapter(long j, ContentValues contentValues) {
        this.mId = j;
        this.mValues = contentValues;
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public long id() {
        return this.mId;
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public <T> T valueOf(FieldAdapter<T, TaskAdapter> fieldAdapter) {
        return fieldAdapter.getFrom(this.mValues);
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public <T> T oldValueOf(FieldAdapter<T, TaskAdapter> fieldAdapter) {
        return null;
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public <T> boolean isUpdated(FieldAdapter<T, TaskAdapter> fieldAdapter) {
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
    public <T> void set(FieldAdapter<T, TaskAdapter> fieldAdapter, T t) throws IllegalStateException {
        fieldAdapter.setIn(this.mValues, t);
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public <T> void unset(FieldAdapter<T, TaskAdapter> fieldAdapter) throws IllegalStateException {
        fieldAdapter.removeFrom(this.mValues);
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public int commit(SQLiteDatabase sQLiteDatabase) {
        if (this.mValues.size() == 0) {
            return 0;
        }
        if (this.mId >= 0) {
            return sQLiteDatabase.update(TaskDatabaseHelper.Tables.TASKS, this.mValues, "_id=" + this.mId, null);
        }
        this.mId = sQLiteDatabase.insert(TaskDatabaseHelper.Tables.TASKS, null, this.mValues);
        return this.mId > 0 ? 1 : 0;
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    /* renamed from: duplicate */
    public EntityAdapter<TaskAdapter> duplicate2() {
        return new ContentValuesTaskAdapter(new ContentValues(this.mValues));
    }
}
