package com.fasterxml.jackson.databind.ser.impl;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import java.io.IOException;

/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/ser/impl/TypeWrappedSerializer.class */
public final class TypeWrappedSerializer extends JsonSerializer<Object> {
    protected final TypeSerializer _typeSerializer;
    protected final JsonSerializer<Object> _serializer;

    public TypeWrappedSerializer(TypeSerializer typeSer, JsonSerializer<?> ser) {
        this._typeSerializer = typeSer;
        this._serializer = ser;
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public void serialize(Object value, JsonGenerator jgen, SerializerProvider provider) throws IOException {
        this._serializer.serializeWithType(value, jgen, provider, this._typeSerializer);
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public void serializeWithType(Object value, JsonGenerator jgen, SerializerProvider provider, TypeSerializer typeSer) throws IOException {
        this._serializer.serializeWithType(value, jgen, provider, typeSer);
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public Class<Object> handledType() {
        return Object.class;
    }

    public JsonSerializer<Object> valueSerializer() {
        return this._serializer;
    }

    public TypeSerializer typeSerializer() {
        return this._typeSerializer;
    }
}
