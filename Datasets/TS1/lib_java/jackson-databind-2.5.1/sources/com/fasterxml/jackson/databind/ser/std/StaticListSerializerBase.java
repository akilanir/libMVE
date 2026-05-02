package com.fasterxml.jackson.databind.ser.std;

import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitorWrapper;
import java.lang.reflect.Type;
import java.util.Collection;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ser/std/StaticListSerializerBase.class */
public abstract class StaticListSerializerBase<T extends Collection<?>> extends StdSerializer<T> {
    protected abstract JsonNode contentSchema();

    protected abstract void acceptContentVisitor(JsonArrayFormatVisitor jsonArrayFormatVisitor) throws JsonMappingException;

    protected StaticListSerializerBase(Class<?> cls) {
        super(cls, false);
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
