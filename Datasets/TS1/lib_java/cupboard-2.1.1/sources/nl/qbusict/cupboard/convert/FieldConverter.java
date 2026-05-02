package nl.qbusict.cupboard.convert;

import android.content.ContentValues;
import android.database.Cursor;
import nl.qbusict.cupboard.convert.EntityConverter;

/* loaded from: cupboard-2.1.1.jar:nl/qbusict/cupboard/convert/FieldConverter.class */
public interface FieldConverter<T> {
    T fromCursorValue(Cursor cursor, int i);

    void toContentValue(T t, String str, ContentValues contentValues);

    EntityConverter.ColumnType getColumnType();
}
