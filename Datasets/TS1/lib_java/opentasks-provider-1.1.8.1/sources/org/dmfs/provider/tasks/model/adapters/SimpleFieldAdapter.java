package org.dmfs.provider.tasks.model.adapters;

import android.content.ContentValues;
import android.database.Cursor;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/model/adapters/SimpleFieldAdapter.class */
public abstract class SimpleFieldAdapter<FieldType, EntityType> implements FieldAdapter<FieldType, EntityType> {
    abstract String fieldName();

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public boolean existsIn(ContentValues contentValues) {
        return contentValues.get(fieldName()) != null;
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public boolean isSetIn(ContentValues contentValues) {
        return contentValues.containsKey(fieldName());
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public boolean existsIn(Cursor cursor) {
        int columnIndex = cursor.getColumnIndex(fieldName());
        if (columnIndex < 0) {
            throw new IllegalArgumentException("The column '" + fieldName() + "' is missing in cursor.");
        }
        return !cursor.isNull(columnIndex);
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public FieldType getFrom(Cursor cursor, ContentValues contentValues) {
        return contentValues.containsKey(fieldName()) ? getFrom(contentValues) : getFrom(cursor);
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public boolean existsIn(Cursor cursor, ContentValues contentValues) {
        return existsIn(contentValues) || existsIn(cursor);
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public void removeFrom(ContentValues contentValues) {
        contentValues.remove(fieldName());
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public void copyValue(Cursor cursor, ContentValues contentValues) {
        setIn(contentValues, getFrom(cursor));
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public void copyValue(ContentValues contentValues, ContentValues contentValues2) {
        setIn(contentValues2, getFrom(contentValues));
    }
}
