package com.google.gson;

import java.lang.reflect.Type;

/* loaded from: gson-1.7.2.jar:com/google/gson/JsonSerializer.class */
public interface JsonSerializer<T> {
    JsonElement serialize(T t, Type type, JsonSerializationContext jsonSerializationContext);
}
