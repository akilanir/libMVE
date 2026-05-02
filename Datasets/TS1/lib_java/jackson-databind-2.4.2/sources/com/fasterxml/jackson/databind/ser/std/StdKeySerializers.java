package com.fasterxml.jackson.databind.ser.std;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/std/StdKeySerializers.class */
public class StdKeySerializers {
    protected static final JsonSerializer<Object> DEFAULT_KEY_SERIALIZER = new StdKeySerializer();
    protected static final JsonSerializer<Object> DEFAULT_STRING_SERIALIZER = new StringKeySerializer();

    private StdKeySerializers() {
    }

    public static JsonSerializer<Object> getStdKeySerializer(JavaType keyType) {
        if (keyType == null) {
            return DEFAULT_KEY_SERIALIZER;
        }
        Class<?> cls = keyType.getRawClass();
        if (cls == String.class) {
            return DEFAULT_STRING_SERIALIZER;
        }
        if (cls == Object.class || cls.isPrimitive() || Number.class.isAssignableFrom(cls)) {
            return DEFAULT_KEY_SERIALIZER;
        }
        if (Date.class.isAssignableFrom(cls)) {
            return DateKeySerializer.instance;
        }
        if (Calendar.class.isAssignableFrom(cls)) {
            return CalendarKeySerializer.instance;
        }
        return DEFAULT_KEY_SERIALIZER;
    }

    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/std/StdKeySerializers$StringKeySerializer.class */
    public static class StringKeySerializer extends StdSerializer<String> {
        public StringKeySerializer() {
            super(String.class);
        }

        @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
        public void serialize(String value, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonGenerationException {
            jgen.writeFieldName(value);
        }
    }

    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/std/StdKeySerializers$DateKeySerializer.class */
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

    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/std/StdKeySerializers$CalendarKeySerializer.class */
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
