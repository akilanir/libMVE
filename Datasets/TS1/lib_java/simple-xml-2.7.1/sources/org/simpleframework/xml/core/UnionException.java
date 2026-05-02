package org.simpleframework.xml.core;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/UnionException.class */
public class UnionException extends PersistenceException {
    public UnionException(String text, Object... list) {
        super(String.format(text, list), new Object[0]);
    }
}
