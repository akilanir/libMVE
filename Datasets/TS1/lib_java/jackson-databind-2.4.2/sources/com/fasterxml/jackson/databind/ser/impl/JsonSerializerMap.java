package com.fasterxml.jackson.databind.ser.impl;

import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.ser.SerializerCache;
import java.util.Map;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/impl/JsonSerializerMap.class */
public class JsonSerializerMap {
    private final Bucket[] _buckets;
    private final int _size;

    public JsonSerializerMap(Map<SerializerCache.TypeKey, JsonSerializer<Object>> serializers) {
        int size = findSize(serializers.size());
        this._size = size;
        int hashMask = size - 1;
        Bucket[] buckets = new Bucket[size];
        for (Map.Entry<SerializerCache.TypeKey, JsonSerializer<Object>> entry : serializers.entrySet()) {
            SerializerCache.TypeKey key = entry.getKey();
            int index = key.hashCode() & hashMask;
            buckets[index] = new Bucket(buckets[index], key, entry.getValue());
        }
        this._buckets = buckets;
    }

    private static final int findSize(int size) {
        int needed = size <= 64 ? size + size : size + (size >> 2);
        int i = 8;
        while (true) {
            int result = i;
            if (result < needed) {
                i = result + result;
            } else {
                return result;
            }
        }
    }

    public int size() {
        return this._size;
    }

    public JsonSerializer<Object> find(SerializerCache.TypeKey key) {
        int index = key.hashCode() & (this._buckets.length - 1);
        Bucket bucket = this._buckets[index];
        if (bucket == null) {
            return null;
        }
        if (key.equals(bucket.key)) {
            return bucket.value;
        }
        do {
            Bucket bucket2 = bucket.next;
            bucket = bucket2;
            if (bucket2 == null) {
                return null;
            }
        } while (!key.equals(bucket.key));
        return bucket.value;
    }

    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/impl/JsonSerializerMap$Bucket.class */
    private static final class Bucket {
        public final SerializerCache.TypeKey key;
        public final JsonSerializer<Object> value;
        public final Bucket next;

        public Bucket(Bucket next, SerializerCache.TypeKey key, JsonSerializer<Object> value) {
            this.next = next;
            this.key = key;
            this.value = value;
        }
    }
}
