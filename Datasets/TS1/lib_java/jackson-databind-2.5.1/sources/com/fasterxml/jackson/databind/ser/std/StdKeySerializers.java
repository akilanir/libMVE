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

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ser/std/StdKeySerializers.class */
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
                return ClassKeySerializer.instance;
            }
            if (Date.class.isAssignableFrom(rawKeyType)) {
                return DateKeySerializer.instance;
            }
            if (Calendar.class.isAssignableFrom(rawKeyType)) {
                return CalendarKeySerializer.instance;
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

    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ser/std/StdKeySerializers$StringKeySerializer.class */
    public static class StringKeySerializer extends StdSerializer<String> {
        public StringKeySerializer() {
            super(String.class);
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
        public void serialize(String value, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonGenerationException {
            jgen.writeFieldName(value);
        }
    }

    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ser/std/StdKeySerializers$DateKeySerializer.class */
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

    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ser/std/StdKeySerializers$CalendarKeySerializer.class */
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

    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ser/std/StdKeySerializers$ClassKeySerializer.class */
    public static class ClassKeySerializer extends StdSerializer<Class<?>> {
        protected static final JsonSerializer<?> instance = new ClassKeySerializer();

        public ClassKeySerializer() {
            super(Class.class, false);
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
        public void serialize(Class<?> value, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonGenerationException {
            jgen.writeFieldName(value.getName());
        }
    }
}
