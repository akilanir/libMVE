package org.achartengine.util;

import java.util.Map;

/* loaded from: achartengine-1.2.0.jar:org/achartengine/util/XYEntry.class */
public class XYEntry<K, V> implements Map.Entry<K, V> {
    private final K key;
    private V value;

    public XYEntry(K key, V value) {
        this.key = key;
        this.value = value;
    }

    @Override // java.util.Map.Entry
    public K getKey() {
        return this.key;
    }

    @Override // java.util.Map.Entry
    public V getValue() {
        return this.value;
    }

    @Override // java.util.Map.Entry
    public V setValue(V object) {
        this.value = object;
        return this.value;
    }
}
