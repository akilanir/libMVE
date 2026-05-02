package nl.qbusict.cupboard.internal.convert;

import android.content.ContentValues;
import android.database.Cursor;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import nl.qbusict.cupboard.Cupboard;
import nl.qbusict.cupboard.convert.EntityConverter;
import nl.qbusict.cupboard.convert.EntityConverterFactory;
import nl.qbusict.cupboard.convert.FieldConverter;
import nl.qbusict.cupboard.convert.FieldConverterFactory;
import nl.qbusict.cupboard.convert.ReflectiveEntityConverter;

/* loaded from: cupboard-2.1.1.jar:nl/qbusict/cupboard/internal/convert/ConverterRegistry.class */
public class ConverterRegistry {
    private List<FieldConverterFactory> mFieldConverterFactories = new ArrayList(256);
    private List<EntityConverterFactory> mEntityConverterFactories = new ArrayList(64);
    private final ThreadLocal<Map<Type, FutureFieldConverter<?>>> mFieldConverterCalls = new ThreadLocal<>();
    private final ThreadLocal<Map<Class<?>, EntityConverter<?>>> mEntityConverterCalls = new ThreadLocal<>();
    private Map<Class<?>, EntityConverter<?>> mEntityConverterCache = new HashMap(128);
    private Map<Type, FieldConverter<?>> mFieldConverterCache = new HashMap(128);
    private Cupboard mCupboard;

    public ConverterRegistry(Cupboard cupboard) {
        this.mCupboard = cupboard;
        addDefaultEntityConverterFactories();
        addDefaultFieldConverterFactories();
    }

    /* loaded from: cupboard-2.1.1.jar:nl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureFieldConverter.class */
    private static class FutureFieldConverter<T> implements FieldConverter<T> {
        private FieldConverter<T> mDelegate;

        private FutureFieldConverter() {
        }

        @Override // nl.qbusict.cupboard.convert.FieldConverter
        public T fromCursorValue(Cursor cursor, int columnIndex) {
            if (this.mDelegate == null) {
                throw new IllegalStateException();
            }
            return this.mDelegate.fromCursorValue(cursor, columnIndex);
        }

        @Override // nl.qbusict.cupboard.convert.FieldConverter
        public void toContentValue(T value, String key, ContentValues values) {
            if (this.mDelegate == null) {
                throw new IllegalStateException();
            }
            this.mDelegate.toContentValue(value, key, values);
        }

        @Override // nl.qbusict.cupboard.convert.FieldConverter
        public EntityConverter.ColumnType getColumnType() {
            if (this.mDelegate == null) {
                throw new IllegalStateException();
            }
            return this.mDelegate.getColumnType();
        }

        void setDelegate(FieldConverter<T> delegate) {
            if (this.mDelegate != null) {
                throw new AssertionError();
            }
            this.mDelegate = delegate;
        }
    }

    /* loaded from: cupboard-2.1.1.jar:nl/qbusict/cupboard/internal/convert/ConverterRegistry$FutureEntityConverter.class */
    private static class FutureEntityConverter<T> implements EntityConverter<T> {
        private EntityConverter<T> mDelegate;

        private FutureEntityConverter() {
        }

        @Override // nl.qbusict.cupboard.convert.EntityConverter
        public T fromCursor(Cursor cursor) {
            if (this.mDelegate == null) {
                throw new IllegalStateException();
            }
            return this.mDelegate.fromCursor(cursor);
        }

        @Override // nl.qbusict.cupboard.convert.EntityConverter
        public void toValues(T object, ContentValues values) {
            if (this.mDelegate == null) {
                throw new IllegalStateException();
            }
            this.mDelegate.toValues(object, values);
        }

        @Override // nl.qbusict.cupboard.convert.EntityConverter
        public List<EntityConverter.Column> getColumns() {
            if (this.mDelegate == null) {
                throw new IllegalStateException();
            }
            return this.mDelegate.getColumns();
        }

        @Override // nl.qbusict.cupboard.convert.EntityConverter
        public void setId(Long id, T instance) {
            if (this.mDelegate == null) {
                throw new IllegalStateException();
            }
            this.mDelegate.setId(id, instance);
        }

        @Override // nl.qbusict.cupboard.convert.EntityConverter
        public Long getId(T instance) {
            if (this.mDelegate == null) {
                throw new IllegalStateException();
            }
            return this.mDelegate.getId(instance);
        }

        @Override // nl.qbusict.cupboard.convert.EntityConverter
        public String getTable() {
            if (this.mDelegate == null) {
                throw new IllegalStateException();
            }
            return this.mDelegate.getTable();
        }

        void setDelegate(EntityConverter<T> delegate) {
            if (this.mDelegate != null) {
                throw new AssertionError();
            }
            this.mDelegate = delegate;
        }
    }

    private void addDefaultFieldConverterFactories() {
        this.mFieldConverterFactories.add(new DefaultFieldConverterFactory());
        this.mFieldConverterFactories.add(new EnumFieldConverterFactory());
        this.mFieldConverterFactories.add(new EntityFieldConverterFactory());
    }

    private void addDefaultEntityConverterFactories() {
        this.mEntityConverterFactories.add(new EntityConverterFactory() { // from class: nl.qbusict.cupboard.internal.convert.ConverterRegistry.1
            @Override // nl.qbusict.cupboard.convert.EntityConverterFactory
            public <T> EntityConverter<T> create(Cupboard cupboard, Class<T> type) {
                return new ReflectiveEntityConverter(cupboard, type);
            }
        });
    }

    public <T> EntityConverter<T> getEntityConverter(Class<T> type) throws IllegalArgumentException {
        EntityConverter<T> entityConverter = (EntityConverter) this.mEntityConverterCache.get(type);
        if (entityConverter != null) {
            return entityConverter;
        }
        boolean requiresThreadLocalCleanup = false;
        Map<Class<?>, EntityConverter<?>> threadCalls = this.mEntityConverterCalls.get();
        if (threadCalls == null) {
            threadCalls = new HashMap(16);
            this.mEntityConverterCalls.set(threadCalls);
            requiresThreadLocalCleanup = true;
        }
        FutureEntityConverter<T> ongoingCall = (FutureEntityConverter) threadCalls.get(type);
        if (ongoingCall != null) {
            return ongoingCall;
        }
        try {
            FutureEntityConverter<T> call = new FutureEntityConverter<>();
            threadCalls.put(type, call);
            for (EntityConverterFactory factory : this.mEntityConverterFactories) {
                EntityConverter<T> candidate = factory.create(this.mCupboard, type);
                if (candidate != null) {
                    call.setDelegate(candidate);
                    this.mEntityConverterCache.put(type, candidate);
                    threadCalls.remove(type);
                    if (requiresThreadLocalCleanup) {
                        this.mEntityConverterCalls.remove();
                    }
                    return candidate;
                }
            }
            throw new IllegalArgumentException("Cannot convert entity of type " + type);
        } catch (Throwable th) {
            threadCalls.remove(type);
            if (requiresThreadLocalCleanup) {
                this.mEntityConverterCalls.remove();
            }
            throw th;
        }
    }

    public <T> FieldConverter<T> getFieldConverter(Type type) throws IllegalArgumentException {
        FieldConverter<T> fieldConverter = (FieldConverter) this.mFieldConverterCache.get(type);
        if (fieldConverter != null) {
            return fieldConverter;
        }
        boolean z = false;
        Map<Type, FutureFieldConverter<?>> map = this.mFieldConverterCalls.get();
        if (map == null) {
            map = new HashMap(16);
            this.mFieldConverterCalls.set(map);
            z = true;
        }
        FutureFieldConverter<?> futureFieldConverter = map.get(type);
        if (futureFieldConverter != null) {
            Map<Class<?>, EntityConverter<?>> map2 = this.mEntityConverterCalls.get();
            if (!(type instanceof Class) || !this.mCupboard.isRegisteredEntity((Class) type) || !map2.containsKey(type)) {
                return futureFieldConverter;
            }
        }
        try {
            FutureFieldConverter futureFieldConverter2 = new FutureFieldConverter();
            map.put(type, futureFieldConverter2);
            Iterator<FieldConverterFactory> it = this.mFieldConverterFactories.iterator();
            while (it.hasNext()) {
                FieldConverter<T> fieldConverter2 = (FieldConverter<T>) it.next().create(this.mCupboard, type);
                if (fieldConverter2 != null) {
                    futureFieldConverter2.setDelegate(fieldConverter2);
                    this.mFieldConverterCache.put(type, fieldConverter2);
                    map.remove(type);
                    if (z) {
                        this.mFieldConverterCalls.remove();
                    }
                    return fieldConverter2;
                }
            }
            throw new IllegalArgumentException("Cannot convert field of type" + type);
        } catch (Throwable th) {
            map.remove(type);
            if (z) {
                this.mFieldConverterCalls.remove();
            }
            throw th;
        }
    }

    public <T> EntityConverter<T> getDelegateEntityConverter(EntityConverterFactory skipPast, Class<T> entityClass) throws IllegalArgumentException {
        boolean factoryFound = false;
        for (EntityConverterFactory factory : this.mEntityConverterFactories) {
            if (!factoryFound) {
                if (factory == skipPast) {
                    factoryFound = true;
                }
            } else {
                EntityConverter<T> candidate = factory.create(this.mCupboard, entityClass);
                if (candidate != null) {
                    return candidate;
                }
            }
        }
        throw new IllegalArgumentException("Cannot convert entity of type " + entityClass);
    }

    public FieldConverter getDelegateFieldConverter(FieldConverterFactory skipPast, Type fieldType) throws IllegalArgumentException {
        boolean factoryFound = false;
        for (FieldConverterFactory factory : this.mFieldConverterFactories) {
            if (!factoryFound) {
                if (factory == skipPast) {
                    factoryFound = true;
                }
            } else {
                FieldConverter candidate = factory.create(this.mCupboard, fieldType);
                if (candidate != null) {
                    return candidate;
                }
            }
        }
        throw new IllegalArgumentException("Cannot convert field of type " + fieldType);
    }

    public void registerEntityConverterFactory(EntityConverterFactory factory) {
        this.mEntityConverterFactories.add(0, factory);
    }

    public void registerFieldConverterFactory(FieldConverterFactory factory) {
        this.mFieldConverterFactories.add(0, factory);
    }

    public <T> void registerFieldConverter(Class<T> clz, FieldConverter<T> converter) {
        this.mFieldConverterCache.put(clz, converter);
    }
}
