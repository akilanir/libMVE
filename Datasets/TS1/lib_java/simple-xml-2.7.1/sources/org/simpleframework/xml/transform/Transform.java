package org.simpleframework.xml.transform;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/transform/Transform.class */
public interface Transform<T> {
    T read(String str) throws Exception;

    String write(T t) throws Exception;
}
