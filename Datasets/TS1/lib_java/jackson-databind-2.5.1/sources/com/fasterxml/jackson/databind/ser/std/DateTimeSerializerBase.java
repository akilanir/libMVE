package com.fasterxml.jackson.databind.ser.std;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitorWrapper;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonIntegerFormatVisitor;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonStringFormatVisitor;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonValueFormat;
import com.fasterxml.jackson.databind.ser.ContextualSerializer;
import com.fasterxml.jackson.databind.util.StdDateFormat;
import java.io.IOException;
import java.lang.reflect.Type;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Locale;
import java.util.TimeZone;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ser/std/DateTimeSerializerBase.class */
public abstract class DateTimeSerializerBase<T> extends StdScalarSerializer<T> implements ContextualSerializer {
    protected final Boolean _useTimestamp;
    protected final DateFormat _customFormat;

    /* renamed from: withFormat */
    public abstract DateTimeSerializerBase<T> withFormat2(Boolean bool, DateFormat dateFormat);

    protected abstract long _timestamp(T t);

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
    public abstract void serialize(T t, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws IOException, JsonGenerationException;

    protected DateTimeSerializerBase(Class<T> type, Boolean useTimestamp, DateFormat customFormat) {
        super(type);
        this._useTimestamp = useTimestamp;
        this._customFormat = customFormat;
    }

    @Override // com.fasterxml.jackson.databind.ser.ContextualSerializer
    public JsonSerializer<?> createContextual(SerializerProvider prov, BeanProperty property) throws JsonMappingException {
        JsonFormat.Value format;
        DateFormat df;
        if (property != null && (format = prov.getAnnotationIntrospector().findFormat(property.getMember())) != null) {
            if (format.getShape().isNumeric()) {
                return withFormat2(Boolean.TRUE, null);
            }
            Boolean asNumber = format.getShape() == JsonFormat.Shape.STRING ? Boolean.FALSE : null;
            TimeZone tz = format.getTimeZone();
            if (format.hasPattern()) {
                String pattern = format.getPattern();
                Locale loc = format.hasLocale() ? format.getLocale() : prov.getLocale();
                SimpleDateFormat df2 = new SimpleDateFormat(pattern, loc);
                if (tz == null) {
                    tz = prov.getTimeZone();
                }
                df2.setTimeZone(tz);
                return withFormat2(asNumber, df2);
            }
            if (tz != null) {
                DateFormat df3 = prov.getConfig().getDateFormat();
                if (df3.getClass() == StdDateFormat.class) {
                    Locale loc2 = format.hasLocale() ? format.getLocale() : prov.getLocale();
                    df = StdDateFormat.getISO8601Format(tz, loc2);
                } else {
                    df = (DateFormat) df3.clone();
                    df.setTimeZone(tz);
                }
                return withFormat2(asNumber, df);
            }
        }
        return this;
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public boolean isEmpty(T value) {
        return value == null || _timestamp(value) == 0;
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdScalarSerializer, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.jsonschema.SchemaAware
    public JsonNode getSchema(SerializerProvider provider, Type typeHint) {
        return createSchemaNode(_asTimestamp(provider) ? "number" : "string", true);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdScalarSerializer, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer, com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable
    public void acceptJsonFormatVisitor(JsonFormatVisitorWrapper visitor, JavaType typeHint) throws JsonMappingException {
        _acceptJsonFormatVisitor(visitor, typeHint, _asTimestamp(visitor.getProvider()));
    }

    protected boolean _asTimestamp(SerializerProvider provider) {
        if (this._useTimestamp != null) {
            return this._useTimestamp.booleanValue();
        }
        if (this._customFormat == null) {
            if (provider != null) {
                return provider.isEnabled(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);
            }
            throw new IllegalArgumentException("Null 'provider' passed for " + handledType().getName());
        }
        return false;
    }

    protected void _acceptJsonFormatVisitor(JsonFormatVisitorWrapper visitor, JavaType typeHint, boolean asNumber) throws JsonMappingException {
        if (asNumber) {
            JsonIntegerFormatVisitor v2 = visitor.expectIntegerFormat(typeHint);
            if (v2 != null) {
                v2.numberType(JsonParser.NumberType.LONG);
                v2.format(JsonValueFormat.UTC_MILLISEC);
                return;
            }
            return;
        }
        JsonStringFormatVisitor v22 = visitor.expectStringFormat(typeHint);
        if (v22 != null) {
            v22.format(JsonValueFormat.DATE_TIME);
        }
    }
}
