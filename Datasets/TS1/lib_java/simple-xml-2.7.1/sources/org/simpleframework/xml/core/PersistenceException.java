package org.simpleframework.xml.core;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/PersistenceException.class */
public class PersistenceException extends Exception {
    public PersistenceException(String text, Object... list) {
        super(String.format(text, list));
    }

    public PersistenceException(Throwable cause, String text, Object... list) {
        super(String.format(text, list), cause);
    }
}
