package com.fasterxml.jackson.databind.deser.impl;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import java.io.IOException;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/deser/impl/TypeWrappedDeserializer.class */
public final class TypeWrappedDeserializer extends JsonDeserializer<Object> {
    final TypeDeserializer _typeDeserializer;
    final JsonDeserializer<Object> _deserializer;

    public TypeWrappedDeserializer(TypeDeserializer typeDeser, JsonDeserializer<Object> deser) {
        this._typeDeserializer = typeDeser;
        this._deserializer = deser;
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public Class<?> handledType() {
        return this._deserializer.handledType();
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public Object deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        return this._deserializer.deserializeWithType(jp, ctxt, this._typeDeserializer);
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public Object deserializeWithType(JsonParser jp, DeserializationContext ctxt, TypeDeserializer typeDeserializer) throws IOException, JsonProcessingException {
        throw new IllegalStateException("Type-wrapped deserializer's deserializeWithType should never get called");
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public Object deserialize(JsonParser jp, DeserializationContext ctxt, Object intoValue) throws IOException, JsonProcessingException {
        return this._deserializer.deserialize(jp, ctxt, intoValue);
    }
}
