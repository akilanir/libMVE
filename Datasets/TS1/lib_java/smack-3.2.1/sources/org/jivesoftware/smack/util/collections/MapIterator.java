package org.jivesoftware.smack.util.collections;

import java.util.Iterator;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/util/collections/MapIterator.class */
public interface MapIterator<K, V> extends Iterator<K> {
    @Override // java.util.Iterator
    boolean hasNext();

    @Override // java.util.Iterator
    K next();

    K getKey();

    V getValue();

    @Override // java.util.Iterator
    void remove();

    V setValue(V v);
}
