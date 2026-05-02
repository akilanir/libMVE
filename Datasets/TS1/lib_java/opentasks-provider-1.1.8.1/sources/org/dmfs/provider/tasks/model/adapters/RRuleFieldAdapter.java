package org.dmfs.provider.tasks.model.adapters;

import android.content.ContentValues;
import android.database.Cursor;
import org.dmfs.rfc5545.recur.InvalidRecurrenceRuleException;
import org.dmfs.rfc5545.recur.RecurrenceRule;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/model/adapters/RRuleFieldAdapter.class */
public final class RRuleFieldAdapter<EntityType> extends SimpleFieldAdapter<RecurrenceRule, EntityType> {
    private final String mFieldName;

    public RRuleFieldAdapter(String str) {
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
    public RecurrenceRule getFrom(ContentValues contentValues) {
        String asString = contentValues.getAsString(this.mFieldName);
        if (asString == null) {
            return null;
        }
        try {
            return new RecurrenceRule(asString);
        } catch (InvalidRecurrenceRuleException e) {
            throw new IllegalArgumentException("can not parse RRULE '" + asString + "'", e);
        }
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public RecurrenceRule getFrom(Cursor cursor) {
        int columnIndex = cursor.getColumnIndex(this.mFieldName);
        if (columnIndex < 0) {
            throw new IllegalArgumentException("The column '" + this.mFieldName + "' is missing in cursor.");
        }
        if (cursor.isNull(columnIndex)) {
            return null;
        }
        try {
            return new RecurrenceRule(cursor.getString(columnIndex));
        } catch (InvalidRecurrenceRuleException e) {
            throw new IllegalArgumentException("can not parse RRULE '" + cursor.getString(columnIndex) + "'", e);
        }
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public void setIn(ContentValues contentValues, RecurrenceRule recurrenceRule) {
        if (recurrenceRule != null) {
            contentValues.put(this.mFieldName, recurrenceRule.toString());
        } else {
            contentValues.putNull(this.mFieldName);
        }
    }
}
