package com.fasterxml.jackson.core;

/* loaded from: jackson-core-2.4.2.jar:com/fasterxml/jackson/core/JsonParseException.class */
public class JsonParseException extends JsonProcessingException {
    private static final long serialVersionUID = 1;

    public JsonParseException(String msg, JsonLocation loc) {
        super(msg, loc);
    }

    public JsonParseException(String msg, JsonLocation loc, Throwable root) {
        super(msg, loc, root);
    }
}
