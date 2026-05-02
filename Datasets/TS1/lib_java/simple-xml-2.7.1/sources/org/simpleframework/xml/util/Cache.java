package org.simpleframework.xml.util;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/util/Cache.class */
public interface Cache<T> {
    boolean isEmpty();

    void cache(Object obj, T t);

    T take(Object obj);

    T fetch(Object obj);

    boolean contains(Object obj);
}
