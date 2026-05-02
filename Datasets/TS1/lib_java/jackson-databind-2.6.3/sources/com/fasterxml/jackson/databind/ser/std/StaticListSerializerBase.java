package com.fasterxml.jackson.databind.ser.std;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.AnnotationIntrospector;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.introspect.AnnotatedMember;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitorWrapper;
import com.fasterxml.jackson.databind.ser.ContextualSerializer;
import java.lang.reflect.Type;
import java.util.Collection;

/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/ser/std/StaticListSerializerBase.class */
public abstract class StaticListSerializerBase<T extends Collection<?>> extends StdSerializer<T> implements ContextualSerializer {
    protected final JsonSerializer<String> _serializer;
    protected final Boolean _unwrapSingle;

    public abstract JsonSerializer<?> _withResolved(BeanProperty beanProperty, JsonSerializer<?> jsonSerializer, Boolean bool);

    protected abstract JsonNode contentSchema();

    protected abstract void acceptContentVisitor(JsonArrayFormatVisitor jsonArrayFormatVisitor) throws JsonMappingException;

    protected StaticListSerializerBase(Class<?> cls) {
        super(cls, false);
        this._serializer = null;
        this._unwrapSingle = null;
    }

    /* JADX WARN: Multi-variable type inference failed */
    protected StaticListSerializerBase(StaticListSerializerBase<?> src, JsonSerializer<?> jsonSerializer, Boolean unwrapSingle) {
        super(src);
        this._serializer = jsonSerializer;
        this._unwrapSingle = unwrapSingle;
    }

    @Override // com.fasterxml.jackson.databind.ser.ContextualSerializer
    public JsonSerializer<?> createContextual(SerializerProvider provider, BeanProperty property) throws JsonMappingException {
        JsonSerializer<?> ser;
        Object serDef;
        JsonSerializer<?> ser2 = null;
        Boolean unwrapSingle = null;
        if (property != null) {
            AnnotationIntrospector intr = provider.getAnnotationIntrospector();
            AnnotatedMember m = property.getMember();
            if (m != null && (serDef = intr.findContentSerializer(m)) != null) {
                ser2 = provider.serializerInstance(m, serDef);
            }
            JsonFormat.Value format = property.findFormatOverrides(intr);
            if (format != null) {
                unwrapSingle = format.getFeature(JsonFormat.Feature.WRITE_SINGLE_ELEM_ARRAYS_UNWRAPPED);
            }
        }
        if (ser2 == null) {
            ser2 = this._serializer;
        }
        JsonSerializer<?> ser3 = findConvertingContentSerializer(provider, property, ser2);
        if (ser3 == null) {
            ser = provider.findValueSerializer(String.class, property);
        } else {
            ser = provider.handleSecondaryContextualization(ser3, property);
        }
        if (isDefaultSerializer(ser)) {
            ser = null;
        }
        if (ser == this._serializer && unwrapSingle == this._unwrapSingle) {
            return this;
        }
        return _withResolved(property, ser, unwrapSingle);
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    @Deprecated
    public boolean isEmpty(T value) {
        return isEmpty((SerializerProvider) null, (SerializerProvider) value);
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public boolean isEmpty(SerializerProvider provider, T value) {
        return value == null || value.size() == 0;
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.jsonschema.SchemaAware
    public JsonNode getSchema(SerializerProvider provider, Type typeHint) {
        return createSchemaNode("array", true).set("items", contentSchema());
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer, com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable
    public void acceptJsonFormatVisitor(JsonFormatVisitorWrapper visitor, JavaType typeHint) throws JsonMappingException {
        acceptContentVisitor(visitor.expectArrayFormat(typeHint));
    }
}
