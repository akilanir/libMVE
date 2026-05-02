package org.simpleframework.xml.strategy;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/strategy/Value.class */
public interface Value {
    Object getValue();

    void setValue(Object obj);

    Class getType();

    int getLength();

    boolean isReference();
}
