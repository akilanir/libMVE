package nl.qbusict.cupboard.internal.convert;

import android.content.ContentValues;
import android.database.Cursor;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import nl.qbusict.cupboard.Cupboard;
import nl.qbusict.cupboard.convert.EntityConverter;
import nl.qbusict.cupboard.convert.FieldConverter;
import nl.qbusict.cupboard.convert.FieldConverterFactory;

/* loaded from: cupboard-2.1.1.jar:nl/qbusict/cupboard/internal/convert/EnumFieldConverterFactory.class */
public class EnumFieldConverterFactory implements FieldConverterFactory {

    /* loaded from: cupboard-2.1.1.jar:nl/qbusict/cupboard/internal/convert/EnumFieldConverterFactory$EnumConverter.class */
    private static class EnumConverter<E extends Enum> implements FieldConverter<E> {
        private final Class<E> mEnumClass;

        public EnumConverter(Class<E> enumClass) {
            this.mEnumClass = enumClass;
        }

        @Override // nl.qbusict.cupboard.convert.FieldConverter
        public E fromCursorValue(Cursor cursor, int i) {
            return (E) Enum.valueOf(this.mEnumClass, cursor.getString(i));
        }

        @Override // nl.qbusict.cupboard.convert.FieldConverter
        public void toContentValue(E value, String key, ContentValues values) {
            values.put(key, value.toString());
        }

        @Override // nl.qbusict.cupboard.convert.FieldConverter
        public EntityConverter.ColumnType getColumnType() {
            return EntityConverter.ColumnType.TEXT;
        }
    }

    @Override // nl.qbusict.cupboard.convert.FieldConverterFactory
    public FieldConverter<?> create(Cupboard cupboard, Type type) {
        if ((type instanceof ParameterizedType) && ((ParameterizedType) type).getRawType() == Enum.class) {
            type = ((ParameterizedType) type).getActualTypeArguments()[0];
        }
        if (!(type instanceof Class)) {
            return null;
        }
        Class<?> clz = (Class) type;
        if (clz.isEnum()) {
            return new EnumConverter(clz);
        }
        return null;
    }
}
