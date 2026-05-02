package org.jivesoftware.smack.util.collections;

import java.util.Map;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/util/collections/AbstractMapEntry.class */
public abstract class AbstractMapEntry<K, V> extends AbstractKeyValue<K, V> implements Map.Entry<K, V> {
    protected AbstractMapEntry(K key, V value) {
        super(key, value);
    }

    public V setValue(V value) {
        V answer = this.value;
        this.value = value;
        return answer;
    }

    @Override // java.util.Map.Entry
    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof Map.Entry)) {
            return false;
        }
        Map.Entry other = (Map.Entry) obj;
        if (getKey() != null ? getKey().equals(other.getKey()) : other.getKey() == null) {
            if (getValue() != null ? getValue().equals(other.getValue()) : other.getValue() == null) {
                return true;
            }
        }
        return false;
    }

    @Override // java.util.Map.Entry
    public int hashCode() {
        return (getKey() == null ? 0 : getKey().hashCode()) ^ (getValue() == null ? 0 : getValue().hashCode());
    }
}
