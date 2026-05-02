package org.jivesoftware.smack.util.collections;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/util/collections/AbstractKeyValue.class */
public abstract class AbstractKeyValue<K, V> implements KeyValue<K, V> {
    protected K key;
    protected V value;

    protected AbstractKeyValue(K key, V value) {
        this.key = key;
        this.value = value;
    }

    @Override // org.jivesoftware.smack.util.collections.KeyValue
    public K getKey() {
        return this.key;
    }

    @Override // org.jivesoftware.smack.util.collections.KeyValue
    public V getValue() {
        return this.value;
    }

    public String toString() {
        return new StringBuilder().append(getKey()).append('=').append(getValue()).toString();
    }
}
