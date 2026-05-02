package org.msgpack.util.android;

import java.io.Serializable;
import java.util.Map;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/util/android/PortedImmutableEntry.class */
public class PortedImmutableEntry<K, V> implements Map.Entry<K, V>, Serializable {
    private static final long serialVersionUID = -4564047655287765373L;
    private final K key;
    private final V value;

    public PortedImmutableEntry(K theKey, V theValue) {
        this.key = theKey;
        this.value = theValue;
    }

    public PortedImmutableEntry(Map.Entry<? extends K, ? extends V> copyFrom) {
        this.key = copyFrom.getKey();
        this.value = copyFrom.getValue();
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
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map.Entry
    public boolean equals(Object object) {
        if (this == object) {
            return true;
        }
        if (object instanceof Map.Entry) {
            Map.Entry<?, ?> entry = (Map.Entry) object;
            if (this.key != null ? this.key.equals(entry.getKey()) : entry.getKey() == null) {
                if (this.value != null ? this.value.equals(entry.getValue()) : entry.getValue() == null) {
                    return true;
                }
            }
            return false;
        }
        return false;
    }

    @Override // java.util.Map.Entry
    public int hashCode() {
        return (this.key == null ? 0 : this.key.hashCode()) ^ (this.value == null ? 0 : this.value.hashCode());
    }

    public String toString() {
        return this.key + "=" + this.value;
    }
}
