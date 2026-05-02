package com.fasterxml.jackson.databind;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitorWrapper;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import com.fasterxml.jackson.databind.util.NameTransformer;
import java.io.IOException;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/JsonSerializer.class */
public abstract class JsonSerializer<T> implements JsonFormatVisitable {

    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/JsonSerializer$None.class */
    public static abstract class None extends JsonSerializer<Object> {
    }

    public abstract void serialize(T t, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws IOException, JsonProcessingException;

    public JsonSerializer<T> unwrappingSerializer(NameTransformer unwrapper) {
        return this;
    }

    public JsonSerializer<T> replaceDelegatee(JsonSerializer<?> delegatee) {
        throw new UnsupportedOperationException();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void serializeWithType(T value, JsonGenerator jgen, SerializerProvider provider, TypeSerializer typeSer) throws IOException, JsonProcessingException {
        Class handledType = handledType();
        if (handledType == null) {
            handledType = value.getClass();
        }
        throw new UnsupportedOperationException("Type id handling not implemented for type " + handledType.getName());
    }

    public Class<T> handledType() {
        return null;
    }

    public boolean isEmpty(T value) {
        return value == null;
    }

    public boolean usesObjectId() {
        return false;
    }

    public boolean isUnwrappingSerializer() {
        return false;
    }

    public JsonSerializer<?> getDelegatee() {
        return null;
    }

    @Override // com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable
    public void acceptJsonFormatVisitor(JsonFormatVisitorWrapper visitor, JavaType type) throws JsonMappingException {
        if (visitor != null) {
            visitor.expectAnyFormat(type);
        }
    }
}
