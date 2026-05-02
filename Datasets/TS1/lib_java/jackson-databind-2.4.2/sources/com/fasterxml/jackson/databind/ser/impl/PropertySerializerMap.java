package com.fasterxml.jackson.databind.ser.impl;

import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/impl/PropertySerializerMap.class */
public abstract class PropertySerializerMap {
    public abstract JsonSerializer<Object> serializerFor(Class<?> cls);

    public abstract PropertySerializerMap newWith(Class<?> cls, JsonSerializer<Object> jsonSerializer);

    @Deprecated
    public final SerializerAndMapResult findAndAddSerializer(Class<?> type, SerializerProvider provider, BeanProperty property) throws JsonMappingException {
        return findAndAddSecondarySerializer(type, provider, property);
    }

    @Deprecated
    public final SerializerAndMapResult findAndAddSerializer(JavaType type, SerializerProvider provider, BeanProperty property) throws JsonMappingException {
        return findAndAddSecondarySerializer(type, provider, property);
    }

    public final SerializerAndMapResult findAndAddPrimarySerializer(Class<?> type, SerializerProvider provider, BeanProperty property) throws JsonMappingException {
        JsonSerializer<Object> serializer = provider.findPrimaryPropertySerializer(type, property);
        return new SerializerAndMapResult(serializer, newWith(type, serializer));
    }

    public final SerializerAndMapResult findAndAddPrimarySerializer(JavaType type, SerializerProvider provider, BeanProperty property) throws JsonMappingException {
        JsonSerializer<Object> serializer = provider.findPrimaryPropertySerializer(type, property);
        return new SerializerAndMapResult(serializer, newWith(type.getRawClass(), serializer));
    }

    public final SerializerAndMapResult findAndAddSecondarySerializer(Class<?> type, SerializerProvider provider, BeanProperty property) throws JsonMappingException {
        JsonSerializer<Object> serializer = provider.findValueSerializer(type, property);
        return new SerializerAndMapResult(serializer, newWith(type, serializer));
    }

    public final SerializerAndMapResult findAndAddSecondarySerializer(JavaType type, SerializerProvider provider, BeanProperty property) throws JsonMappingException {
        JsonSerializer<Object> serializer = provider.findValueSerializer(type, property);
        return new SerializerAndMapResult(serializer, newWith(type.getRawClass(), serializer));
    }

    public static PropertySerializerMap emptyMap() {
        return Empty.instance;
    }

    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/impl/PropertySerializerMap$SerializerAndMapResult.class */
    public static final class SerializerAndMapResult {
        public final JsonSerializer<Object> serializer;
        public final PropertySerializerMap map;

        public SerializerAndMapResult(JsonSerializer<Object> serializer, PropertySerializerMap map) {
            this.serializer = serializer;
            this.map = map;
        }
    }

    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/impl/PropertySerializerMap$TypeAndSerializer.class */
    private static final class TypeAndSerializer {
        public final Class<?> type;
        public final JsonSerializer<Object> serializer;

        public TypeAndSerializer(Class<?> type, JsonSerializer<Object> serializer) {
            this.type = type;
            this.serializer = serializer;
        }
    }

    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/impl/PropertySerializerMap$Empty.class */
    private static final class Empty extends PropertySerializerMap {
        protected static final Empty instance = new Empty();

        private Empty() {
        }

        @Override // com.fasterxml.jackson.databind.ser.impl.PropertySerializerMap
        public JsonSerializer<Object> serializerFor(Class<?> type) {
            return null;
        }

        @Override // com.fasterxml.jackson.databind.ser.impl.PropertySerializerMap
        public PropertySerializerMap newWith(Class<?> type, JsonSerializer<Object> serializer) {
            return new Single(type, serializer);
        }
    }

    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/impl/PropertySerializerMap$Single.class */
    private static final class Single extends PropertySerializerMap {
        private final Class<?> _type;
        private final JsonSerializer<Object> _serializer;

        public Single(Class<?> type, JsonSerializer<Object> serializer) {
            this._type = type;
            this._serializer = serializer;
        }

        @Override // com.fasterxml.jackson.databind.ser.impl.PropertySerializerMap
        public JsonSerializer<Object> serializerFor(Class<?> type) {
            if (type == this._type) {
                return this._serializer;
            }
            return null;
        }

        @Override // com.fasterxml.jackson.databind.ser.impl.PropertySerializerMap
        public PropertySerializerMap newWith(Class<?> type, JsonSerializer<Object> serializer) {
            return new Double(this._type, this._serializer, type, serializer);
        }
    }

    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/impl/PropertySerializerMap$Double.class */
    private static final class Double extends PropertySerializerMap {
        private final Class<?> _type1;
        private final Class<?> _type2;
        private final JsonSerializer<Object> _serializer1;
        private final JsonSerializer<Object> _serializer2;

        public Double(Class<?> type1, JsonSerializer<Object> serializer1, Class<?> type2, JsonSerializer<Object> serializer2) {
            this._type1 = type1;
            this._serializer1 = serializer1;
            this._type2 = type2;
            this._serializer2 = serializer2;
        }

        @Override // com.fasterxml.jackson.databind.ser.impl.PropertySerializerMap
        public JsonSerializer<Object> serializerFor(Class<?> type) {
            if (type == this._type1) {
                return this._serializer1;
            }
            if (type == this._type2) {
                return this._serializer2;
            }
            return null;
        }

        @Override // com.fasterxml.jackson.databind.ser.impl.PropertySerializerMap
        public PropertySerializerMap newWith(Class<?> type, JsonSerializer<Object> serializer) {
            TypeAndSerializer[] ts = {new TypeAndSerializer(this._type1, this._serializer1), new TypeAndSerializer(this._type2, this._serializer2)};
            return new Multi(ts);
        }
    }

    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/impl/PropertySerializerMap$Multi.class */
    private static final class Multi extends PropertySerializerMap {
        private static final int MAX_ENTRIES = 8;
        private final TypeAndSerializer[] _entries;

        public Multi(TypeAndSerializer[] entries) {
            this._entries = entries;
        }

        @Override // com.fasterxml.jackson.databind.ser.impl.PropertySerializerMap
        public JsonSerializer<Object> serializerFor(Class<?> type) {
            int len = this._entries.length;
            for (int i = 0; i < len; i++) {
                TypeAndSerializer entry = this._entries[i];
                if (entry.type == type) {
                    return entry.serializer;
                }
            }
            return null;
        }

        @Override // com.fasterxml.jackson.databind.ser.impl.PropertySerializerMap
        public PropertySerializerMap newWith(Class<?> type, JsonSerializer<Object> serializer) {
            int len = this._entries.length;
            if (len == 8) {
                return this;
            }
            TypeAndSerializer[] entries = new TypeAndSerializer[len + 1];
            System.arraycopy(this._entries, 0, entries, 0, len);
            entries[len] = new TypeAndSerializer(type, serializer);
            return new Multi(entries);
        }
    }
}
