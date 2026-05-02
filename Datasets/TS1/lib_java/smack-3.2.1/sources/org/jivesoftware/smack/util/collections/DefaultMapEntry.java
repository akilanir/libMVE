package org.jivesoftware.smack.util.collections;

import java.util.Map;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/util/collections/DefaultMapEntry.class */
public final class DefaultMapEntry<K, V> extends AbstractMapEntry<K, V> {
    public DefaultMapEntry(K key, V value) {
        super(key, value);
    }

    public DefaultMapEntry(KeyValue<K, V> pair) {
        super(pair.getKey(), pair.getValue());
    }

    public DefaultMapEntry(Map.Entry<K, V> entry) {
        super(entry.getKey(), entry.getValue());
    }
}
