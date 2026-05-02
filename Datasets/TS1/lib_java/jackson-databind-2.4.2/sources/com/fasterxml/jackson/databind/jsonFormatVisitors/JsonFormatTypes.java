package com.fasterxml.jackson.databind.jsonFormatVisitors;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/jsonFormatVisitors/JsonFormatTypes.class */
public enum JsonFormatTypes {
    STRING,
    NUMBER,
    INTEGER,
    BOOLEAN,
    OBJECT,
    ARRAY,
    NULL,
    ANY;

    @JsonValue
    public String value() {
        return name().toLowerCase();
    }

    @JsonCreator
    public static JsonFormatTypes forValue(String s) {
        return valueOf(s.toUpperCase());
    }
}
