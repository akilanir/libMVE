package com.fasterxml.jackson.databind.deser.impl;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import java.io.IOException;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/impl/NoClassDefFoundDeserializer.class */
public class NoClassDefFoundDeserializer<T> extends JsonDeserializer<T> {
    private final NoClassDefFoundError _cause;

    public NoClassDefFoundDeserializer(NoClassDefFoundError cause) {
        this._cause = cause;
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public T deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        throw this._cause;
    }
}
