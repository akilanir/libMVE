package com.fasterxml.jackson.databind.ser.impl;

import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.ser.SerializerCache;
import java.util.HashMap;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ser/impl/ReadOnlyClassToSerializerMap.class */
public final class ReadOnlyClassToSerializerMap {
    protected final JsonSerializerMap _map;
    protected SerializerCache.TypeKey _cacheKey = null;

    private ReadOnlyClassToSerializerMap(JsonSerializerMap map) {
        this._map = map;
    }

    public ReadOnlyClassToSerializerMap instance() {
        return new ReadOnlyClassToSerializerMap(this._map);
    }

    public static ReadOnlyClassToSerializerMap from(HashMap<SerializerCache.TypeKey, JsonSerializer<Object>> src) {
        return new ReadOnlyClassToSerializerMap(new JsonSerializerMap(src));
    }

    public JsonSerializer<Object> typedValueSerializer(JavaType type) {
        if (this._cacheKey == null) {
            this._cacheKey = new SerializerCache.TypeKey(type, true);
        } else {
            this._cacheKey.resetTyped(type);
        }
        return this._map.find(this._cacheKey);
    }

    public JsonSerializer<Object> typedValueSerializer(Class<?> cls) {
        if (this._cacheKey == null) {
            this._cacheKey = new SerializerCache.TypeKey(cls, true);
        } else {
            this._cacheKey.resetTyped(cls);
        }
        return this._map.find(this._cacheKey);
    }

    public JsonSerializer<Object> untypedValueSerializer(JavaType type) {
        if (this._cacheKey == null) {
            this._cacheKey = new SerializerCache.TypeKey(type, false);
        } else {
            this._cacheKey.resetUntyped(type);
        }
        return this._map.find(this._cacheKey);
    }

    public JsonSerializer<Object> untypedValueSerializer(Class<?> cls) {
        if (this._cacheKey == null) {
            this._cacheKey = new SerializerCache.TypeKey(cls, false);
        } else {
            this._cacheKey.resetUntyped(cls);
        }
        return this._map.find(this._cacheKey);
    }
}
