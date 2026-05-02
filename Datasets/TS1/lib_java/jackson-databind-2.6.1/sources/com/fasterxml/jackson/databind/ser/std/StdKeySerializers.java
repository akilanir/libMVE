package com.fasterxml.jackson.databind.ser.std;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializationConfig;
import com.fasterxml.jackson.databind.SerializerProvider;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

/* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/ser/std/StdKeySerializers.class */
public class StdKeySerializers {
    protected static final JsonSerializer<Object> DEFAULT_KEY_SERIALIZER = new StdKeySerializer();
    protected static final JsonSerializer<Object> DEFAULT_STRING_SERIALIZER = new StringKeySerializer();

    private StdKeySerializers() {
    }

    public static JsonSerializer<Object> getStdKeySerializer(SerializationConfig config, Class<?> rawKeyType, boolean useDefault) {
        if (rawKeyType != null) {
            if (rawKeyType == String.class) {
                return DEFAULT_STRING_SERIALIZER;
            }
            if (rawKeyType == Object.class || rawKeyType.isPrimitive() || Number.class.isAssignableFrom(rawKeyType)) {
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
                return new Default(4, rawKeyType);
            }
        }
        if (useDefault) {
            return DEFAULT_KEY_SERIALIZER;
        }
        return null;
    }

    @Deprecated
    public static JsonSerializer<Object> getStdKeySerializer(JavaType keyType) {
        return getStdKeySerializer(null, keyType.getRawClass(), true);
    }

    public static JsonSerializer<Object> getDefault() {
        return DEFAULT_KEY_SERIALIZER;
    }

    /* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/ser/std/StdKeySerializers$Default.class */
    public static class Default extends StdSerializer<Object> {
        static final int TYPE_DATE = 1;
        static final int TYPE_CALENDAR = 2;
        static final int TYPE_CLASS = 3;
        static final int TYPE_TO_STRING = 4;
        protected final int _typeId;

        public Default(int typeId, Class<?> type) {
            super(type, false);
            this._typeId = typeId;
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
        public void serialize(Object value, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonGenerationException {
            switch (this._typeId) {
                case 1:
                    provider.defaultSerializeDateKey((Date) value, jgen);
                    break;
                case 2:
                    provider.defaultSerializeDateKey(((Calendar) value).getTimeInMillis(), jgen);
                    break;
                case 3:
                    jgen.writeFieldName(((Class) value).getName());
                    break;
                case 4:
                default:
                    jgen.writeFieldName(value.toString());
                    break;
            }
        }
    }

    /* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/ser/std/StdKeySerializers$StringKeySerializer.class */
    public static class StringKeySerializer extends StdSerializer<Object> {
        public StringKeySerializer() {
            super(String.class, false);
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
        public void serialize(Object value, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonGenerationException {
            jgen.writeFieldName((String) value);
        }
    }

    @Deprecated
    /* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/ser/std/StdKeySerializers$DateKeySerializer.class */
    public static class DateKeySerializer extends StdSerializer<Date> {
        protected static final JsonSerializer<?> instance = new DateKeySerializer();

        public DateKeySerializer() {
            super(Date.class);
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
        public void serialize(Date value, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonGenerationException {
            provider.defaultSerializeDateKey(value, jgen);
        }
    }

    @Deprecated
    /* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/ser/std/StdKeySerializers$CalendarKeySerializer.class */
    public static class CalendarKeySerializer extends StdSerializer<Calendar> {
        protected static final JsonSerializer<?> instance = new CalendarKeySerializer();

        public CalendarKeySerializer() {
            super(Calendar.class);
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
        public void serialize(Calendar value, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonGenerationException {
            provider.defaultSerializeDateKey(value.getTimeInMillis(), jgen);
        }
    }
}
