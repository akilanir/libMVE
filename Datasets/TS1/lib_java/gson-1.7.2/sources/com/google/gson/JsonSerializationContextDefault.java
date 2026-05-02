package com.google.gson;

import java.lang.reflect.Type;

/* loaded from: gson-1.7.2.jar:com/google/gson/JsonSerializationContextDefault.class */
final class JsonSerializationContextDefault implements JsonSerializationContext {
    private final ObjectNavigator objectNavigator;
    private final FieldNamingStrategy2 fieldNamingPolicy;
    private final ParameterizedTypeHandlerMap<JsonSerializer<?>> serializers;
    private final boolean serializeNulls;
    private final MemoryRefStack ancestors = new MemoryRefStack();

    JsonSerializationContextDefault(ObjectNavigator objectNavigator, FieldNamingStrategy2 fieldNamingPolicy, boolean serializeNulls, ParameterizedTypeHandlerMap<JsonSerializer<?>> serializers) {
        this.objectNavigator = objectNavigator;
        this.fieldNamingPolicy = fieldNamingPolicy;
        this.serializeNulls = serializeNulls;
        this.serializers = serializers;
    }

    @Override // com.google.gson.JsonSerializationContext
    public JsonElement serialize(Object src) {
        if (src == null) {
            return JsonNull.createJsonNull();
        }
        return serialize(src, src.getClass(), false);
    }

    @Override // com.google.gson.JsonSerializationContext
    public JsonElement serialize(Object src, Type typeOfSrc) {
        return serialize(src, typeOfSrc, true);
    }

    JsonElement serialize(Object src, Type typeOfSrc, boolean preserveType) {
        if (src == null) {
            return JsonNull.createJsonNull();
        }
        JsonSerializationVisitor visitor = new JsonSerializationVisitor(this.objectNavigator, this.fieldNamingPolicy, this.serializeNulls, this.serializers, this, this.ancestors);
        this.objectNavigator.accept(new ObjectTypePair(src, typeOfSrc, preserveType), visitor);
        return visitor.getJsonElement();
    }
}
