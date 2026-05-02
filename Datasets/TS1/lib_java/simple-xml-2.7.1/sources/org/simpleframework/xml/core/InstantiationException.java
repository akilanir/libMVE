package org.simpleframework.xml.core;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/InstantiationException.class */
public class InstantiationException extends PersistenceException {
    public InstantiationException(String text, Object... list) {
        super(text, list);
    }

    public InstantiationException(Throwable cause, String text, Object... list) {
        super(cause, text, list);
    }
}
