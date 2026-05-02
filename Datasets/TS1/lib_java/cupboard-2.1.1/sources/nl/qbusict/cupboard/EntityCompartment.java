package nl.qbusict.cupboard;

import android.content.ContentValues;
import nl.qbusict.cupboard.convert.EntityConverter;

/* loaded from: cupboard-2.1.1.jar:nl/qbusict/cupboard/EntityCompartment.class */
public class EntityCompartment<T> extends BaseCompartment {
    private final EntityConverter<T> mConverter;

    protected EntityCompartment(Cupboard cupboard, Class<T> clz) {
        super(cupboard);
        this.mConverter = getConverter(clz);
    }

    public String getTable() {
        return this.mConverter.getTable();
    }

    public ContentValues toContentValues(T entity) {
        return toContentValues(entity, null);
    }

    public ContentValues toContentValues(T entity, ContentValues values) {
        if (values == null) {
            values = new ContentValues(this.mConverter.getColumns().size());
        }
        this.mConverter.toValues(entity, values);
        return values;
    }
}
