package com.fasterxml.jackson.core;

/* loaded from: jackson-core-2.4.2.jar:com/fasterxml/jackson/core/JsonGenerationException.class */
public class JsonGenerationException extends JsonProcessingException {
    private static final long serialVersionUID = 123;

    public JsonGenerationException(Throwable rootCause) {
        super(rootCause);
    }

    public JsonGenerationException(String msg) {
        super(msg, (JsonLocation) null);
    }

    public JsonGenerationException(String msg, Throwable rootCause) {
        super(msg, null, rootCause);
    }
}
