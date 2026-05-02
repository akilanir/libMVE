package org.dmfs.provider.tasks.model.adapters;

import android.content.ContentValues;
import android.database.Cursor;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/model/adapters/BinaryFieldAdapter.class */
public final class BinaryFieldAdapter<EntityType> extends SimpleFieldAdapter<byte[], EntityType> {
    private final String mFieldName;

    public BinaryFieldAdapter(String str) {
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
    public byte[] getFrom(ContentValues contentValues) {
        return contentValues.getAsByteArray(this.mFieldName);
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public byte[] getFrom(Cursor cursor) {
        int columnIndex = cursor.getColumnIndex(this.mFieldName);
        if (columnIndex < 0) {
            throw new IllegalArgumentException("The column '" + this.mFieldName + "' is missing in cursor.");
        }
        if (cursor.isNull(columnIndex)) {
            return null;
        }
        return cursor.getBlob(columnIndex);
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public void setIn(ContentValues contentValues, byte[] bArr) {
        if (bArr != null) {
            contentValues.put(this.mFieldName, bArr);
        } else {
            contentValues.putNull(this.mFieldName);
        }
    }
}
