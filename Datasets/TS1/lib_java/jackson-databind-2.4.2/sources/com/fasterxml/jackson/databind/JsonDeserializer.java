package com.fasterxml.jackson.databind;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.deser.SettableBeanProperty;
import com.fasterxml.jackson.databind.deser.impl.ObjectIdReader;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import com.fasterxml.jackson.databind.util.NameTransformer;
import java.io.IOException;
import java.util.Collection;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/JsonDeserializer.class */
public abstract class JsonDeserializer<T> {
    public abstract T deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException;

    public T deserialize(JsonParser jp, DeserializationContext ctxt, T intoValue) throws IOException, JsonProcessingException {
        throw new UnsupportedOperationException("Can not update object of type " + intoValue.getClass().getName() + " (by deserializer of type " + getClass().getName() + ")");
    }

    public Object deserializeWithType(JsonParser jp, DeserializationContext ctxt, TypeDeserializer typeDeserializer) throws IOException, JsonProcessingException {
        return typeDeserializer.deserializeTypedFromAny(jp, ctxt);
    }

    public JsonDeserializer<T> unwrappingDeserializer(NameTransformer unwrapper) {
        return this;
    }

    public JsonDeserializer<?> replaceDelegatee(JsonDeserializer<?> delegatee) {
        throw new UnsupportedOperationException();
    }

    public Class<?> handledType() {
        return null;
    }

    public T getNullValue() {
        return null;
    }

    public T getEmptyValue() {
        return getNullValue();
    }

    public Collection<Object> getKnownPropertyNames() {
        return null;
    }

    public boolean isCachable() {
        return false;
    }

    public ObjectIdReader getObjectIdReader() {
        return null;
    }

    public JsonDeserializer<?> getDelegatee() {
        return null;
    }

    public SettableBeanProperty findBackReference(String refName) {
        throw new IllegalArgumentException("Can not handle managed/back reference '" + refName + "': type: value deserializer of type " + getClass().getName() + " does not support them");
    }

    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/JsonDeserializer$None.class */
    public static abstract class None extends JsonDeserializer<Object> {
        private None() {
        }
    }
}
