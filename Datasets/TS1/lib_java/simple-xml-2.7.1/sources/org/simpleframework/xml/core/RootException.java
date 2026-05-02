package org.simpleframework.xml.core;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/RootException.class */
public class RootException extends PersistenceException {
    public RootException(String text, Object... list) {
        super(text, list);
    }

    public RootException(Throwable cause, String text, Object... list) {
        super(cause, text, list);
    }
}
