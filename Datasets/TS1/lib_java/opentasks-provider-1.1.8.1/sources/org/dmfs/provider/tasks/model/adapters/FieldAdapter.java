package org.dmfs.provider.tasks.model.adapters;

import android.content.ContentValues;
import android.database.Cursor;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/model/adapters/FieldAdapter.class */
public interface FieldAdapter<FieldType, EntitType> {
    boolean existsIn(ContentValues contentValues);

    boolean isSetIn(ContentValues contentValues);

    FieldType getFrom(ContentValues contentValues);

    boolean existsIn(Cursor cursor);

    FieldType getFrom(Cursor cursor);

    boolean existsIn(Cursor cursor, ContentValues contentValues);

    FieldType getFrom(Cursor cursor, ContentValues contentValues);

    void setIn(ContentValues contentValues, FieldType fieldtype);

    void removeFrom(ContentValues contentValues);

    void copyValue(Cursor cursor, ContentValues contentValues);

    void copyValue(ContentValues contentValues, ContentValues contentValues2);
}
