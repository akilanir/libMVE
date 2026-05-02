package org.dmfs.provider.tasks.model.adapters;

import android.content.ContentValues;
import android.database.Cursor;
import java.io.IOException;
import java.util.TimeZone;
import java.util.regex.Pattern;
import org.dmfs.rfc5545.DateTime;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/model/adapters/DateTimeArrayFieldAdapter.class */
public final class DateTimeArrayFieldAdapter<EntityType> extends SimpleFieldAdapter<DateTime[], EntityType> {
    private static final Pattern SEPARATOR_PATTERN = Pattern.compile(",");
    private final String mDateTimeListFieldName;
    private final String mTimeZoneFieldName;

    public DateTimeArrayFieldAdapter(String str, String str2) {
        if (str == null) {
            throw new IllegalArgumentException("datetimeListFieldName must not be null");
        }
        this.mDateTimeListFieldName = str;
        this.mTimeZoneFieldName = str2;
    }

    @Override // org.dmfs.provider.tasks.model.adapters.SimpleFieldAdapter
    String fieldName() {
        return this.mDateTimeListFieldName;
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public DateTime[] getFrom(ContentValues contentValues) {
        String asString = contentValues.getAsString(this.mDateTimeListFieldName);
        if (asString == null) {
            return null;
        }
        String asString2 = this.mTimeZoneFieldName == null ? null : contentValues.getAsString(this.mTimeZoneFieldName);
        TimeZone timeZone = asString2 == null ? null : TimeZone.getTimeZone(asString2);
        String[] split = SEPARATOR_PATTERN.split(asString);
        DateTime[] dateTimeArr = new DateTime[split.length];
        int length = split.length;
        for (int i = 0; i < length; i++) {
            DateTime parse = DateTime.parse(timeZone, split[i]);
            if (!parse.isAllDay() && parse.isFloating()) {
                throw new IllegalArgumentException("DateTime values must not be floating, unless they are all-day.");
            }
            dateTimeArr[i] = parse;
            if (i > 0 && dateTimeArr[0].isAllDay() != parse.isAllDay()) {
                throw new IllegalArgumentException("DateTime values must all be of the same type.");
            }
        }
        return dateTimeArr;
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public DateTime[] getFrom(Cursor cursor) {
        int columnIndex = cursor.getColumnIndex(this.mDateTimeListFieldName);
        int columnIndex2 = this.mTimeZoneFieldName == null ? -1 : cursor.getColumnIndex(this.mTimeZoneFieldName);
        if (columnIndex < 0 || (this.mTimeZoneFieldName != null && columnIndex2 < 0)) {
            throw new IllegalArgumentException("At least one column is missing in cursor.");
        }
        if (cursor.isNull(columnIndex)) {
            return null;
        }
        String string = cursor.getString(columnIndex);
        String string2 = this.mTimeZoneFieldName == null ? null : cursor.getString(columnIndex2);
        TimeZone timeZone = string2 == null ? null : TimeZone.getTimeZone(string2);
        String[] split = SEPARATOR_PATTERN.split(string);
        DateTime[] dateTimeArr = new DateTime[split.length];
        int length = split.length;
        for (int i = 0; i < length; i++) {
            DateTime parse = DateTime.parse(timeZone, split[i]);
            if (!parse.isAllDay() && parse.isFloating()) {
                throw new IllegalArgumentException("DateTime values must not be floating, unless they are all-day.");
            }
            dateTimeArr[i] = parse;
            if (i > 0 && dateTimeArr[0].isAllDay() != parse.isAllDay()) {
                throw new IllegalArgumentException("DateTime values must all be of the same type.");
            }
        }
        return dateTimeArr;
    }

    @Override // org.dmfs.provider.tasks.model.adapters.SimpleFieldAdapter, org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public DateTime[] getFrom(Cursor cursor, ContentValues contentValues) {
        int columnIndex;
        String string;
        int columnIndex2;
        String str = null;
        if (contentValues == null || !contentValues.containsKey(this.mDateTimeListFieldName)) {
            if (cursor == null || (columnIndex = cursor.getColumnIndex(this.mDateTimeListFieldName)) < 0) {
                throw new IllegalArgumentException("Missing date time list column.");
            }
            if (cursor.isNull(columnIndex)) {
                return null;
            }
            string = cursor.getString(columnIndex);
        } else {
            if (contentValues.getAsLong(this.mDateTimeListFieldName) == null) {
                return null;
            }
            string = contentValues.getAsString(this.mDateTimeListFieldName);
        }
        if (this.mTimeZoneFieldName != null) {
            if (contentValues != null && contentValues.containsKey(this.mTimeZoneFieldName)) {
                str = contentValues.getAsString(this.mTimeZoneFieldName);
            } else {
                if (cursor == null || (columnIndex2 = cursor.getColumnIndex(this.mTimeZoneFieldName)) < 0) {
                    throw new IllegalArgumentException("Missing timezone column.");
                }
                str = cursor.getString(columnIndex2);
            }
        }
        TimeZone timeZone = str == null ? null : TimeZone.getTimeZone(str);
        String[] split = SEPARATOR_PATTERN.split(string);
        DateTime[] dateTimeArr = new DateTime[split.length];
        int length = split.length;
        for (int i = 0; i < length; i++) {
            DateTime parse = DateTime.parse(timeZone, split[i]);
            if (!parse.isAllDay() && parse.isFloating()) {
                throw new IllegalArgumentException("DateTime values must not be floating, unless they are all-day.");
            }
            dateTimeArr[i] = parse;
            if (i > 0 && dateTimeArr[0].isAllDay() != parse.isAllDay()) {
                throw new IllegalArgumentException("DateTime values must all be of the same type.");
            }
        }
        return dateTimeArr;
    }

    @Override // org.dmfs.provider.tasks.model.adapters.FieldAdapter
    public void setIn(ContentValues contentValues, DateTime[] dateTimeArr) {
        if (dateTimeArr == null || dateTimeArr.length <= 0) {
            contentValues.put(this.mDateTimeListFieldName, (Long) null);
            return;
        }
        try {
            StringBuilder sb = new StringBuilder(dateTimeArr.length * 17);
            boolean z = true;
            for (DateTime dateTime : dateTimeArr) {
                if (z) {
                    z = false;
                } else {
                    sb.append(',');
                }
                (dateTime.isFloating() ? dateTime : dateTime.shiftTimeZone(DateTime.UTC)).writeTo(sb);
            }
            contentValues.put(this.mDateTimeListFieldName, sb.toString());
        } catch (IOException e) {
            throw new RuntimeException("Can not serialize datetime list.");
        }
    }
}
