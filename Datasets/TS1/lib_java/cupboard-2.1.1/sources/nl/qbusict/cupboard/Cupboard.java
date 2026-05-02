package nl.qbusict.cupboard;

import android.content.ContentProviderOperation;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import nl.qbusict.cupboard.convert.EntityConverter;
import nl.qbusict.cupboard.convert.EntityConverterFactory;
import nl.qbusict.cupboard.convert.FieldConverter;
import nl.qbusict.cupboard.convert.FieldConverterFactory;
import nl.qbusict.cupboard.internal.convert.ConverterRegistry;

/* loaded from: cupboard-2.1.1.jar:nl/qbusict/cupboard/Cupboard.class */
public class Cupboard {
    private boolean mUseAnnotations = false;
    private Set<Class<?>> mEntities = new HashSet(128);
    private final ConverterRegistry mConverterRegistry = new ConverterRegistry(this);

    public <T> void register(Class<T> clz) {
        this.mEntities.add(clz);
    }

    public DatabaseCompartment withDatabase(SQLiteDatabase db) {
        return new DatabaseCompartment(this, db);
    }

    public CursorCompartment withCursor(Cursor cursor) {
        return new CursorCompartment(this, cursor);
    }

    public ProviderCompartment withContext(Context context) {
        return new ProviderCompartment(this, context);
    }

    public ProviderOperationsCompartment withOperations(ArrayList<ContentProviderOperation> operations) {
        return new ProviderOperationsCompartment(this, operations);
    }

    public <T> EntityCompartment<T> withEntity(Class<T> entityClass) {
        return new EntityCompartment<>(this, entityClass);
    }

    public <T> String getTable(Class<T> clz) {
        return withEntity(clz).getTable();
    }

    public Collection<Class<?>> getRegisteredEntities() {
        return Collections.unmodifiableSet(this.mEntities);
    }

    public boolean isUseAnnotations() {
        return this.mUseAnnotations;
    }

    void setUseAnnotations(boolean useAnnotations) {
        this.mUseAnnotations = useAnnotations;
    }

    public FieldConverter<?> getFieldConverter(Type type) throws IllegalArgumentException {
        return this.mConverterRegistry.getFieldConverter(type);
    }

    public <T> EntityConverter<T> getEntityConverter(Class<T> entityClass) throws IllegalArgumentException {
        if (!isRegisteredEntity(entityClass)) {
            throw new IllegalArgumentException("Entity is not registered: " + entityClass);
        }
        return this.mConverterRegistry.getEntityConverter(entityClass);
    }

    public FieldConverter<?> getDelegateFieldConverter(FieldConverterFactory skipPast, Type type) throws IllegalArgumentException {
        return this.mConverterRegistry.getDelegateFieldConverter(skipPast, type);
    }

    public <T> EntityConverter<T> getDelegateEntityConverter(EntityConverterFactory skipPast, Class<T> entityClass) throws IllegalArgumentException {
        return this.mConverterRegistry.getDelegateEntityConverter(skipPast, entityClass);
    }

    void registerEntityConverterFactory(EntityConverterFactory factory) {
        this.mConverterRegistry.registerEntityConverterFactory(factory);
    }

    void registerFieldConverterFactory(FieldConverterFactory factory) {
        this.mConverterRegistry.registerFieldConverterFactory(factory);
    }

    <T> void registerFieldConverter(Class<T> fieldClass, FieldConverter<T> converter) {
        this.mConverterRegistry.registerFieldConverter(fieldClass, converter);
    }

    public boolean isRegisteredEntity(Class<?> entityClass) {
        return this.mEntities.contains(entityClass);
    }
}
