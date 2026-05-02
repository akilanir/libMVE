package org.dmfs.provider.tasks.model.adapters;

import android.content.ContentValues;
import android.database.Cursor;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/model/adapters/StringFieldAdapter.class */
public final class StringFieldAdapter<EntityType> extends SimpleFieldAdapter<String, EntityType> {
    private final String mFieldName;

    public StringFieldAdapter(String str) {
        if (str == null) {
            throw new IllegalArgumentException("fieldName must not be null");
        }
        this.mFieldName = str;
    }

    @Override // org.dmfs.provider.tasks.model.adapters.SimpleFieldAdapter
    String fieldName() {
        return this.mFieldName;
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public String getFrom(ContentValues contentValues) {
        return contentValues.getAsString(this.mFieldName);
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public String getFrom(Cursor cursor) {
        int columnIndex = cursor.getColumnIndex(this.mFieldName);
        if (columnIndex < 0) {
            throw new IllegalArgumentException("The column '" + this.mFieldName + "' is missing in cursor.");
        }
        return cursor.getString(columnIndex);
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public void setIn(ContentValues contentValues, String str) {
        if (str != null) {
            contentValues.put(this.mFieldName, str);
        } else {
            contentValues.putNull(this.mFieldName);
        }
    }
}
