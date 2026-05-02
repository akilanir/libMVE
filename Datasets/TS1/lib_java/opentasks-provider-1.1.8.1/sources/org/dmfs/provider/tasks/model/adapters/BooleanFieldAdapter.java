package org.dmfs.provider.tasks.model.adapters;

import android.content.ContentValues;
import android.database.Cursor;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/model/adapters/BooleanFieldAdapter.class */
public final class BooleanFieldAdapter<EntityType> extends SimpleFieldAdapter<Boolean, EntityType> {
    private final String mFieldName;

    public BooleanFieldAdapter(String str) {
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
    public Boolean getFrom(ContentValues contentValues) {
        Integer asInteger = contentValues.getAsInteger(this.mFieldName);
        return Boolean.valueOf(asInteger != null && asInteger.intValue() > 0);
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public Boolean getFrom(Cursor cursor) {
        int columnIndex = cursor.getColumnIndex(this.mFieldName);
        if (columnIndex < 0) {
            throw new IllegalArgumentException("The column '" + this.mFieldName + "' is missing in cursor.");
        }
        return Boolean.valueOf(!cursor.isNull(columnIndex) && cursor.getInt(columnIndex) > 0);
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public void setIn(ContentValues contentValues, Boolean bool) {
        contentValues.put(this.mFieldName, Integer.valueOf(bool.booleanValue() ? 1 : 0));
    }
}
