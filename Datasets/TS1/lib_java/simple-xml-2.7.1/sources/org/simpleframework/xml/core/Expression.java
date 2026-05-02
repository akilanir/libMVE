package org.simpleframework.xml.core;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/Expression.class */
interface Expression extends Iterable<String> {
    int getIndex();

    String getPrefix();

    String getFirst();

    String getLast();

    String getPath();

    String getElement(String str);

    String getAttribute(String str);

    Expression getPath(int i);

    Expression getPath(int i, int i2);

    boolean isAttribute();

    boolean isPath();

    boolean isEmpty();

    String toString();
}
