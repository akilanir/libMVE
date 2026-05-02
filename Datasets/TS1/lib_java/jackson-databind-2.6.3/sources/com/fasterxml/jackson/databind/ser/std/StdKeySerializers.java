package com.fasterxml.jackson.databind.ser.std;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializationConfig;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.ser.impl.PropertySerializerMap;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/ser/std/StdKeySerializers.class */
public class StdKeySerializers {
    protected static final JsonSerializer<Object> DEFAULT_KEY_SERIALIZER = new StdKeySerializer();
    protected static final JsonSerializer<Object> DEFAULT_STRING_SERIALIZER = new StringKeySerializer();

    private StdKeySerializers() {
    }

    public static JsonSerializer<Object> getStdKeySerializer(SerializationConfig config, Class<?> rawKeyType, boolean useDefault) {
        if (rawKeyType == null || rawKeyType == Object.class) {
            return new Dynamic();
        }
        if (rawKeyType == String.class) {
            return DEFAULT_STRING_SERIALIZER;
        }
        if (rawKeyType.isPrimitive() || Number.class.isAssignableFrom(rawKeyType)) {
            return DEFAULT_KEY_SERIALIZER;
        }
        if (rawKeyType == Class.class) {
            return new Default(3, rawKeyType);
        }
        if (Date.class.isAssignableFrom(rawKeyType)) {
            return new Default(1, rawKeyType);
        }
        if (Calendar.class.isAssignableFrom(rawKeyType)) {
            return new Default(2, rawKeyType);
        }
        if (rawKeyType == UUID.class) {
            return new Default(5, rawKeyType);
        }
        if (useDefault) {
            return DEFAULT_KEY_SERIALIZER;
        }
        return null;
    }

    public static JsonSerializer<Object> getFallbackKeySerializer(SerializationConfig config, Class<?> rawKeyType) {
        if (rawKeyType != null) {
            if (rawKeyType == Enum.class) {
                return new Dynamic();
            }
            if (rawKeyType.isEnum()) {
                return new Default(4, rawKeyType);
            }
        }
        return DEFAULT_KEY_SERIALIZER;
    }

    @Deprecated
    public static JsonSerializer<Object> getStdKeySerializer(JavaType keyType) {
        return getStdKeySerializer(null, keyType.getRawClass(), true);
    }

    @Deprecated
    public static JsonSerializer<Object> getDefault() {
        return DEFAULT_KEY_SERIALIZER;
    }

    /* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/ser/std/StdKeySerializers$Default.class */
    public static class Default extends StdSerializer<Object> {
        static final int TYPE_DATE = 1;
        static final int TYPE_CALENDAR = 2;
        static final int TYPE_CLASS = 3;
        static final int TYPE_ENUM = 4;
        static final int TYPE_TO_STRING = 5;
        protected final int _typeId;

        public Default(int typeId, Class<?> type) {
            super(type, false);
            this._typeId = typeId;
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
        public void serialize(Object value, JsonGenerator g, SerializerProvider provider) throws IOException {
            switch (this._typeId) {
                case 1:
                    provider.defaultSerializeDateKey((Date) value, g);
                    break;
                case 2:
                    provider.defaultSerializeDateKey(((Calendar) value).getTimeInMillis(), g);
                    break;
                case 3:
                    g.writeFieldName(((Class) value).getName());
                    break;
                case 4:
                    String str = provider.isEnabled(SerializationFeature.WRITE_ENUMS_USING_TO_STRING) ? value.toString() : ((Enum) value).name();
                    g.writeFieldName(str);
                    break;
                case 5:
                default:
                    g.writeFieldName(value.toString());
                    break;
            }
        }
    }

    /* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/ser/std/StdKeySerializers$Dynamic.class */
    public static class Dynamic extends StdSerializer<Object> {
        protected transient PropertySerializerMap _dynamicSerializers;

        public Dynamic() {
            super(String.class, false);
            this._dynamicSerializers = PropertySerializerMap.emptyForProperties();
        }

        Object readResolve() {
            this._dynamicSerializers = PropertySerializerMap.emptyForProperties();
            return this;
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
        public void serialize(Object value, JsonGenerator g, SerializerProvider provider) throws IOException {
            Class<?> cls = value.getClass();
            PropertySerializerMap m = this._dynamicSerializers;
            JsonSerializer<Object> ser = m.serializerFor(cls);
            if (ser == null) {
                ser = _findAndAddDynamic(m, cls, provider);
            }
            ser.serialize(value, g, provider);
        }

        protected JsonSerializer<Object> _findAndAddDynamic(PropertySerializerMap map, Class<?> type, SerializerProvider provider) throws JsonMappingException {
            PropertySerializerMap.SerializerAndMapResult result = map.findAndAddKeySerializer(type, provider, null);
            if (map != result.map) {
                this._dynamicSerializers = result.map;
            }
            return result.serializer;
        }
    }

    /* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/ser/std/StdKeySerializers$StringKeySerializer.class */
    public static class StringKeySerializer extends StdSerializer<Object> {
        public StringKeySerializer() {
            super(String.class, false);
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
        public void serialize(Object value, JsonGenerator g, SerializerProvider provider) throws IOException {
            g.writeFieldName((String) value);
        }
    }

    @Deprecated
    /* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/ser/std/StdKeySerializers$DateKeySerializer.class */
    public static class DateKeySerializer extends StdSerializer<Date> {
        protected static final JsonSerializer<?> instance = new DateKeySerializer();

        public DateKeySerializer() {
            super(Date.class);
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
        public void serialize(Date value, JsonGenerator g, SerializerProvider provider) throws IOException {
            provider.defaultSerializeDateKey(value, g);
        }
    }

    @Deprecated
    /* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/ser/std/StdKeySerializers$CalendarKeySerializer.class */
    public static class CalendarKeySerializer extends StdSerializer<Calendar> {
        protected static final JsonSerializer<?> instance = new CalendarKeySerializer();

        public CalendarKeySerializer() {
            super(Calendar.class);
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
        public void serialize(Calendar value, JsonGenerator g, SerializerProvider provider) throws IOException {
            provider.defaultSerializeDateKey(value.getTimeInMillis(), g);
        }
    }
}
