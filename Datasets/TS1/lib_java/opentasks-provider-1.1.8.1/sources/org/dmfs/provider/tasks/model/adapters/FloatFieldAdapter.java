package org.dmfs.provider.tasks.model.adapters;

import android.content.ContentValues;
import android.database.Cursor;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/model/adapters/FloatFieldAdapter.class */
public final class FloatFieldAdapter<EntityType> extends SimpleFieldAdapter<Float, EntityType> {
    private final String mFieldName;

    public FloatFieldAdapter(String str) {
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
    public Float getFrom(ContentValues contentValues) {
        return contentValues.getAsFloat(this.mFieldName);
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public Float getFrom(Cursor cursor) {
        int columnIndex = cursor.getColumnIndex(this.mFieldName);
        if (columnIndex < 0) {
            throw new IllegalArgumentException("The column '" + this.mFieldName + "' is missing in cursor.");
        }
        if (cursor.isNull(columnIndex)) {
            return null;
        }
        return Float.valueOf(cursor.getFloat(columnIndex));
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public void setIn(ContentValues contentValues, Float f) {
        if (f != null) {
            contentValues.put(this.mFieldName, f);
        } else {
            contentValues.putNull(this.mFieldName);
        }
    }
}
