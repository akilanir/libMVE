package org.simpleframework.xml.core;

import java.lang.annotation.Annotation;
import org.simpleframework.xml.strategy.Type;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/Contact.class */
interface Contact extends Type {
    String getName();

    Class getDependent();

    Class[] getDependents();

    Class getDeclaringClass();

    Annotation getAnnotation();

    void set(Object obj, Object obj2) throws Exception;

    Object get(Object obj) throws Exception;

    boolean isReadOnly();

    @Override // org.simpleframework.xml.strategy.Type
    String toString();
}
