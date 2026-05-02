package org.dmfs.provider.tasks.model.adapters;

import android.content.ContentValues;
import android.database.Cursor;
import java.util.TimeZone;
import org.dmfs.rfc5545.DateTime;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/model/adapters/DateTimeFieldAdapter.class */
public final class DateTimeFieldAdapter<EntityType> extends SimpleFieldAdapter<DateTime, EntityType> {
    private final String mTimestampField;
    private final String mTzField;
    private final String mAllDayField;
    private final boolean mAllDayDefault;

    public DateTimeFieldAdapter(String str, String str2, String str3) {
        if (str == null) {
            throw new IllegalArgumentException("timestampField must not be null");
        }
        this.mTimestampField = str;
        this.mTzField = str2;
        this.mAllDayField = str3;
        this.mAllDayDefault = false;
    }

    @Override // org.dmfs.provider.tasks.model.adapters.SimpleFieldAdapter
    String fieldName() {
        return this.mTimestampField;
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public DateTime getFrom(ContentValues contentValues) {
        Long asLong = contentValues.getAsLong(this.mTimestampField);
        if (asLong == null) {
            return null;
        }
        String asString = this.mTzField == null ? null : contentValues.getAsString(this.mTzField);
        DateTime dateTime = new DateTime(asString == null ? DateTime.UTC : TimeZone.getTimeZone(asString), asLong.longValue());
        String str = this.mAllDayField;
        Integer asInteger = str == null ? null : contentValues.getAsInteger(str);
        if ((asInteger != null && asInteger.intValue() != 0) || (str == null && this.mAllDayDefault)) {
            dateTime = dateTime.toAllDay();
        }
        return dateTime;
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public DateTime getFrom(Cursor cursor) {
        int columnIndex = cursor.getColumnIndex(this.mTimestampField);
        int columnIndex2 = this.mTzField == null ? -1 : cursor.getColumnIndex(this.mTzField);
        int columnIndex3 = this.mAllDayField == null ? -1 : cursor.getColumnIndex(this.mAllDayField);
        if (columnIndex < 0 || ((this.mTzField != null && columnIndex2 < 0) || (this.mAllDayField != null && columnIndex3 < 0))) {
            throw new IllegalArgumentException("At least one column is missing in cursor.");
        }
        if (cursor.isNull(columnIndex)) {
            return null;
        }
        Long valueOf = Long.valueOf(cursor.getLong(columnIndex));
        String string = this.mTzField == null ? null : cursor.getString(columnIndex2);
        DateTime dateTime = new DateTime(string == null ? DateTime.UTC : TimeZone.getTimeZone(string), valueOf.longValue());
        Integer valueOf2 = columnIndex3 < 0 ? null : Integer.valueOf(cursor.getInt(columnIndex3));
        if ((valueOf2 != null && valueOf2.intValue() != 0) || (this.mAllDayField == null && this.mAllDayDefault)) {
            dateTime = dateTime.toAllDay();
        }
        return dateTime;
    }

    @Override // org.dmfs.provider.tasks.model.adapters.SimpleFieldAdapter, org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public DateTime getFrom(Cursor cursor, ContentValues contentValues) {
        int columnIndex;
        long j;
        int columnIndex2;
        int columnIndex3;
        String str = null;
        Integer num = 0;
        if (contentValues == null || !contentValues.containsKey(this.mTimestampField)) {
            if (cursor == null || (columnIndex = cursor.getColumnIndex(this.mTimestampField)) < 0) {
                throw new IllegalArgumentException("Missing timestamp column.");
            }
            if (cursor.isNull(columnIndex)) {
                return null;
            }
            j = cursor.getLong(columnIndex);
        } else {
            if (contentValues.getAsLong(this.mTimestampField) == null) {
                return null;
            }
            j = contentValues.getAsLong(this.mTimestampField).longValue();
        }
        if (this.mTzField != null) {
            if (contentValues != null && contentValues.containsKey(this.mTzField)) {
                str = contentValues.getAsString(this.mTzField);
            } else {
                if (cursor == null || (columnIndex3 = cursor.getColumnIndex(this.mTzField)) < 0) {
                    throw new IllegalArgumentException("Missing timezone column.");
                }
                str = cursor.getString(columnIndex3);
            }
        }
        if (this.mAllDayField != null) {
            if (contentValues != null && contentValues.containsKey(this.mAllDayField)) {
                num = contentValues.getAsInteger(this.mAllDayField);
            } else {
                if (cursor == null || (columnIndex2 = cursor.getColumnIndex(this.mAllDayField)) < 0) {
                    throw new IllegalArgumentException("Missing timezone column.");
                }
                num = Integer.valueOf(cursor.getInt(columnIndex2));
            }
        }
        DateTime dateTime = new DateTime(str == null ? DateTime.UTC : TimeZone.getTimeZone(str), j);
        if (num.intValue() != 0) {
            dateTime = dateTime.toAllDay();
        }
        return dateTime;
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public void setIn(ContentValues contentValues, DateTime dateTime) {
        if (dateTime == null) {
            contentValues.put(this.mTimestampField, (Long) null);
            return;
        }
        contentValues.put(this.mTimestampField, Long.valueOf(dateTime.getTimestamp()));
        if (this.mTzField != null) {
            TimeZone timeZone = dateTime.getTimeZone();
            contentValues.put(this.mTzField, timeZone == null ? null : timeZone.getID());
        }
        if (this.mAllDayField != null) {
            contentValues.put(this.mAllDayField, Integer.valueOf(dateTime.isAllDay() ? 1 : 0));
        }
    }
}
