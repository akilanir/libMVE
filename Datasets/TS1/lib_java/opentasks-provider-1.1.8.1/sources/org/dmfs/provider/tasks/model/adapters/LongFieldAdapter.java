package org.dmfs.provider.tasks.model.adapters;

import android.content.ContentValues;
import android.database.Cursor;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/model/adapters/LongFieldAdapter.class */
public final class LongFieldAdapter<EntityType> extends SimpleFieldAdapter<Long, EntityType> {
    private final String mFieldName;

    public LongFieldAdapter(String str) {
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
    public Long getFrom(ContentValues contentValues) {
        return contentValues.getAsLong(this.mFieldName);
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public Long getFrom(Cursor cursor) {
        int columnIndex = cursor.getColumnIndex(this.mFieldName);
        if (columnIndex < 0) {
            throw new IllegalArgumentException("The column '" + this.mFieldName + "' is missing in cursor.");
        }
        if (cursor.isNull(columnIndex)) {
            return null;
        }
        return Long.valueOf(cursor.getLong(columnIndex));
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public void setIn(ContentValues contentValues, Long l) {
        if (l != null) {
            contentValues.put(this.mFieldName, l);
        } else {
            contentValues.putNull(this.mFieldName);
        }
    }
}
