package org.simpleframework.xml.core;

import java.lang.annotation.Annotation;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/Parameter.class */
interface Parameter {
    Object getKey();

    Class getType();

    int getIndex();

    Annotation getAnnotation();

    Expression getExpression();

    String getName();

    String getPath();

    boolean isRequired();

    boolean isPrimitive();

    boolean isAttribute();

    boolean isText();

    String toString();
}
