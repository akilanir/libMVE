package org.dmfs.provider.tasks.model;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import org.dmfs.provider.tasks.TaskDatabaseHelper;
import org.dmfs.provider.tasks.model.adapters.FieldAdapter;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/model/CursorContentValuesListAdapter.class */
public class CursorContentValuesListAdapter extends AbstractListAdapter {
    private final long mId;
    private final Cursor mCursor;
    private final ContentValues mValues;

    public CursorContentValuesListAdapter(long j, Cursor cursor, ContentValues contentValues) {
        this.mId = j;
        this.mCursor = cursor;
        this.mValues = contentValues;
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public long id() {
        return this.mId;
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public <T> T valueOf(FieldAdapter<T, ListAdapter> fieldAdapter) {
        return fieldAdapter.getFrom(this.mCursor, this.mValues);
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public <T> T oldValueOf(FieldAdapter<T, ListAdapter> fieldAdapter) {
        return fieldAdapter.getFrom(this.mCursor);
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public <T> boolean isUpdated(FieldAdapter<T, ListAdapter> fieldAdapter) {
        return this.mValues != null && fieldAdapter.isSetIn(this.mValues);
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public boolean isWriteable() {
        return true;
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    public boolean hasUpdates() {
        return this.mValues != null && this.mValues.size() > 0;
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
        return sQLiteDatabase.update(TaskDatabaseHelper.Tables.LISTS, this.mValues, "_id=" + this.mId, null);
    }

    @Override // org.dmfs.provider.tasks.model.EntityAdapter
    /* renamed from: duplicate */
    public EntityAdapter<ListAdapter> duplicate2() {
        ContentValues contentValues = new ContentValues(this.mValues);
        int columnCount = this.mCursor.getColumnCount();
        for (int i = 0; i < columnCount; i++) {
            String columnName = this.mCursor.getColumnName(i);
            if (!contentValues.containsKey(columnName) && !"_id".equals(columnName)) {
                contentValues.put(columnName, this.mCursor.getString(i));
            }
        }
        return new ContentValuesListAdapter(contentValues);
    }
}
