package org.dmfs.provider.tasks.model;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import org.dmfs.provider.tasks.TaskDatabaseHelper;
import org.dmfs.provider.tasks.model.adapters.FieldAdapter;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/model/CursorContentValuesTaskAdapter.class */
public class CursorContentValuesTaskAdapter extends AbstractTaskAdapter {
    private final long mId;
    private final Cursor mCursor;
    private final ContentValues mValues;

    public CursorContentValuesTaskAdapter(Cursor cursor, ContentValues contentValues) {
        if (cursor != null || _ID.existsIn(contentValues)) {
            this.mId = _ID.getFrom(cursor).longValue();
        } else {
            this.mId = -1L;
        }
        this.mCursor = cursor;
        this.mValues = contentValues;
    }

    public CursorContentValuesTaskAdapter(long j, Cursor cursor, ContentValues contentValues) {
        this.mId = j;
        this.mCursor = cursor;
        this.mValues = contentValues;
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public long id() {
        return this.mId;
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public <T> T valueOf(FieldAdapter<T, TaskAdapter> fieldAdapter) {
        return this.mValues == null ? fieldAdapter.getFrom(this.mCursor) : fieldAdapter.getFrom(this.mCursor, this.mValues);
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public <T> T oldValueOf(FieldAdapter<T, TaskAdapter> fieldAdapter) {
        return fieldAdapter.getFrom(this.mCursor);
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public <T> boolean isUpdated(FieldAdapter<T, TaskAdapter> fieldAdapter) {
        return this.mValues != null && fieldAdapter.isSetIn(this.mValues);
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public boolean isWriteable() {
        return this.mValues != null;
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public boolean hasUpdates() {
        return this.mValues != null && this.mValues.size() > 0;
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
        return sQLiteDatabase.update(TaskDatabaseHelper.Tables.TASKS, this.mValues, "_id=" + this.mId, null);
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    /* renamed from: duplicate */
    public EntityAdapter<TaskAdapter> duplicate2() {
        ContentValues contentValues = new ContentValues(this.mValues);
        int columnCount = this.mCursor.getColumnCount();
        for (int i = 0; i < columnCount; i++) {
            String columnName = this.mCursor.getColumnName(i);
            if (!contentValues.containsKey(columnName) && !"_id".equals(columnName)) {
                contentValues.put(columnName, this.mCursor.getString(i));
            }
        }
        return new ContentValuesTaskAdapter(contentValues);
    }
}
