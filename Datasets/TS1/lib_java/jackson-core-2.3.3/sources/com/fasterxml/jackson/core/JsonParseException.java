package com.fasterxml.jackson.core;

/* loaded from: jackson-core-2.3.3.jar:com/fasterxml/jackson/core/JsonParseException.class */
public class JsonParseException extends JsonProcessingException {
    private static final long serialVersionUID = 1;

    public JsonParseException(String str, JsonLocation jsonLocation) {
        super(str, jsonLocation);
    }

    public JsonParseException(String str, JsonLocation jsonLocation, Throwable th) {
        super(str, jsonLocation, th);
    }
}
