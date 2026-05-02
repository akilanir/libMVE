package org.dmfs.provider.tasks.model.adapters;

import android.content.ContentValues;
import android.database.Cursor;
import java.net.URI;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/model/adapters/UrlFieldAdapter.class */
public final class UrlFieldAdapter<EntityType> extends SimpleFieldAdapter<URI, EntityType> {
    private final String mFieldName;

    public UrlFieldAdapter(String str) {
        if (str == null) {
            throw new IllegalArgumentException("urlField must not be null");
        }
        this.mFieldName = str;
    }

    @Override // org.dmfs.provider.tasks.model.adapters.SimpleFieldAdapter
    String fieldName() {
        return this.mFieldName;
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public URI getFrom(ContentValues contentValues) {
        if (contentValues.get(this.mFieldName) == null) {
            return null;
        }
        return URI.create(contentValues.getAsString(this.mFieldName));
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public URI getFrom(Cursor cursor) {
        int columnIndex = cursor.getColumnIndex(this.mFieldName);
        if (columnIndex < 0) {
            throw new IllegalArgumentException("The column '" + this.mFieldName + "' is missing in cursor.");
        }
        if (cursor.isNull(columnIndex)) {
            return null;
        }
        return URI.create(cursor.getString(columnIndex));
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public void setIn(ContentValues contentValues, URI uri) {
        if (uri != null) {
            contentValues.put(this.mFieldName, uri.toASCIIString());
        } else {
            contentValues.putNull(this.mFieldName);
        }
    }
}
