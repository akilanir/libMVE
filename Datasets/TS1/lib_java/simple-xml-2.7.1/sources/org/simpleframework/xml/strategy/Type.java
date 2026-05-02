package org.simpleframework.xml.strategy;

import java.lang.annotation.Annotation;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/strategy/Type.class */
public interface Type {
    Class getType();

    <T extends Annotation> T getAnnotation(Class<T> cls);

    String toString();
}
