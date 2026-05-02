package org.simpleframework.xml.core;

import java.lang.annotation.Annotation;
import java.lang.reflect.Method;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/MethodPart.class */
interface MethodPart {
    String getName();

    Annotation getAnnotation();

    <T extends Annotation> T getAnnotation(Class<T> cls);

    Class getType();

    Class getDependent();

    Class[] getDependents();

    Class getDeclaringClass();

    Method getMethod();

    MethodType getMethodType();

    String toString();
}
