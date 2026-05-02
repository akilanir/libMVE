package com.fasterxml.jackson.databind.deser;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import java.io.IOException;

/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/deser/DeserializationProblemHandler.class */
public abstract class DeserializationProblemHandler {
    public boolean handleUnknownProperty(DeserializationContext ctxt, JsonParser jp, JsonDeserializer<?> deserializer, Object beanOrClass, String propertyName) throws IOException, JsonProcessingException {
        return false;
    }
}
