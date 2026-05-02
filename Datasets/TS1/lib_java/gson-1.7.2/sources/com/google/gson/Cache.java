package com.google.gson;

/* loaded from: gson-1.7.2.jar:com/google/gson/Cache.class */
interface Cache<K, V> {
    void addElement(K k, V v);

    V getElement(K k);

    V removeElement(K k);
}
