package nl.qbusict.cupboard;

import android.content.ContentProviderOperation;
import android.content.ContentUris;
import android.content.ContentValues;
import android.net.Uri;
import java.util.ArrayList;
import nl.qbusict.cupboard.convert.EntityConverter;

/* loaded from: cupboard-2.1.1.jar:nl/qbusict/cupboard/ProviderOperationsCompartment.class */
public class ProviderOperationsCompartment extends BaseCompartment {
    private final ArrayList<ContentProviderOperation> mOperations;

    protected ProviderOperationsCompartment(Cupboard cupboard, ArrayList<ContentProviderOperation> operations) {
        super(cupboard);
        this.mOperations = operations;
    }

    public <T> ProviderOperationsCompartment put(Uri uri, T entity) {
        EntityConverter<T> converter = getConverter(entity.getClass());
        ContentValues values = new ContentValues(converter.getColumns().size());
        converter.toValues(entity, values);
        Long id = converter.getId(entity);
        if (id == null) {
            this.mOperations.add(ContentProviderOperation.newInsert(uri).withValues(values).build());
        } else {
            this.mOperations.add(ContentProviderOperation.newInsert(ContentUris.withAppendedId(uri, id.longValue())).withValues(values).build());
        }
        return this;
    }

    public <T> ProviderOperationsCompartment put(Uri uri, Class<T> entityClass, T... entities) {
        EntityConverter<T> converter = getConverter(entityClass);
        ContentValues[] values = new ContentValues[entities.length];
        int size = converter.getColumns().size();
        for (int i = 0; i < entities.length; i++) {
            values[i] = new ContentValues(size);
            converter.toValues(entities[i], values[i]);
        }
        for (T t : entities) {
            put(uri, t);
        }
        return this;
    }

    public <T> ProviderOperationsCompartment delete(Uri uri, T entity) {
        EntityConverter<T> converter = getConverter(entity.getClass());
        Long id = converter.getId(entity);
        if (id == null) {
            return this;
        }
        this.mOperations.add(ContentProviderOperation.newDelete(ContentUris.withAppendedId(uri, id.longValue())).build());
        return this;
    }

    public ArrayList<ContentProviderOperation> getOperations() {
        return this.mOperations;
    }
}
