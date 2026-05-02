package nl.qbusict.cupboard;

import android.database.Cursor;
import java.util.List;
import nl.qbusict.cupboard.convert.EntityConverter;

/* loaded from: cupboard-2.1.1.jar:nl/qbusict/cupboard/CursorCompartment.class */
public class CursorCompartment extends BaseCompartment {
    private final Cursor mCursor;

    protected CursorCompartment(Cupboard cupboard, Cursor cursor) {
        super(cupboard);
        this.mCursor = cursor;
    }

    public <T> QueryResultIterable<T> iterate(Class<T> clz) {
        EntityConverter<T> converter = getConverter(clz);
        return new QueryResultIterable<>(this.mCursor, converter);
    }

    public <T> T get(Class<T> clz) {
        return iterate(clz).get(false);
    }

    public <T> List<T> list(Class<T> clz) {
        return iterate(clz).list(false);
    }
}
