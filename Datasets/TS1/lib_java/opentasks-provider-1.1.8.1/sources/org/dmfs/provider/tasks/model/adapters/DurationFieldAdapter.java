package org.dmfs.provider.tasks.model.adapters;

import android.content.ContentValues;
import android.database.Cursor;
import org.dmfs.rfc5545.Duration;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/model/adapters/DurationFieldAdapter.class */
public final class DurationFieldAdapter<EntityType> extends SimpleFieldAdapter<Duration, EntityType> {
    private final String mFieldName;

    public DurationFieldAdapter(String str) {
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
    public Duration getFrom(ContentValues contentValues) {
        String asString = contentValues.getAsString(this.mFieldName);
        if (asString == null) {
            return null;
        }
        return Duration.parse(asString);
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public Duration getFrom(Cursor cursor) {
        int columnIndex = cursor.getColumnIndex(this.mFieldName);
        if (columnIndex < 0) {
            throw new IllegalArgumentException("The column '" + this.mFieldName + "' is missing in cursor.");
        }
        if (cursor.isNull(columnIndex)) {
            return null;
        }
        return Duration.parse(cursor.getString(columnIndex));
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public void setIn(ContentValues contentValues, Duration duration) {
        if (duration != null) {
            contentValues.put(this.mFieldName, duration.toString());
        } else {
            contentValues.putNull(this.mFieldName);
        }
    }
}
