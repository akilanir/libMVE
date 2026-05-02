package org.dmfs.provider.tasks.model.adapters;

import android.content.ContentValues;
import android.database.Cursor;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/model/adapters/IntegerFieldAdapter.class */
public final class IntegerFieldAdapter<EntityType> extends SimpleFieldAdapter<Integer, EntityType> {
    private final String mFieldName;

    public IntegerFieldAdapter(String str) {
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
    public Integer getFrom(ContentValues contentValues) {
        return contentValues.getAsInteger(this.mFieldName);
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public Integer getFrom(Cursor cursor) {
        int columnIndex = cursor.getColumnIndex(this.mFieldName);
        if (columnIndex < 0) {
            throw new IllegalArgumentException("The column '" + this.mFieldName + "' is missing in cursor.");
        }
        if (cursor.isNull(columnIndex)) {
            return null;
        }
        return Integer.valueOf(cursor.getInt(columnIndex));
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public void setIn(ContentValues contentValues, Integer num) {
        if (num != null) {
            contentValues.put(this.mFieldName, num);
        } else {
            contentValues.putNull(this.mFieldName);
        }
    }
}
