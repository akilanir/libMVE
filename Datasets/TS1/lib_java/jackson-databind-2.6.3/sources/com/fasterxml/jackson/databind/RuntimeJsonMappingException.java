package com.fasterxml.jackson.databind;

/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/RuntimeJsonMappingException.class */
public class RuntimeJsonMappingException extends RuntimeException {
    /* JADX WARN: Multi-variable type inference failed */
    public RuntimeJsonMappingException(JsonMappingException jsonMappingException) {
        super((Throwable) jsonMappingException);
    }

    public RuntimeJsonMappingException(String message) {
        super(message);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public RuntimeJsonMappingException(String message, JsonMappingException jsonMappingException) {
        super(message, jsonMappingException);
    }
}
