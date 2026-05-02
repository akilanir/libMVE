package nl.qbusict.cupboard.convert;

import android.content.ContentValues;
import android.database.Cursor;
import java.util.List;
import nl.qbusict.cupboard.annotation.Index;

/* loaded from: cupboard-2.1.1.jar:nl/qbusict/cupboard/convert/EntityConverter.class */
public interface EntityConverter<T> {

    /* loaded from: cupboard-2.1.1.jar:nl/qbusict/cupboard/convert/EntityConverter$ColumnType.class */
    public enum ColumnType {
        TEXT,
        INTEGER,
        REAL,
        BLOB,
        JOIN
    }

    T fromCursor(Cursor cursor);

    void toValues(T t, ContentValues contentValues);

    List<Column> getColumns();

    void setId(Long l, T t);

    Long getId(T t);

    String getTable();

    /* loaded from: cupboard-2.1.1.jar:nl/qbusict/cupboard/convert/EntityConverter$Column.class */
    public static class Column {
        public final String name;
        public final ColumnType type;
        public final Index index;

        public Column(String name, ColumnType type) {
            this(name, type, null);
        }

        public Column(String name, ColumnType type, Index index) {
            this.name = name;
            this.type = type;
            this.index = index;
        }

        public int hashCode() {
            return 37 * this.name.hashCode();
        }

        public boolean equals(Object o) {
            if (o instanceof Column) {
                Column c = (Column) o;
                return c.name.equals(this.name) && c.type == this.type;
            }
            if (o instanceof String) {
                return this.name.equals(o);
            }
            return super.equals(o);
        }
    }
}
