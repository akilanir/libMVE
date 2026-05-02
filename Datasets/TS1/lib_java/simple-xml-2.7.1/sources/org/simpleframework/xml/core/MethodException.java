package org.simpleframework.xml.core;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/MethodException.class */
public class MethodException extends PersistenceException {
    public MethodException(String text, Object... list) {
        super(text, list);
    }

    public MethodException(Throwable cause, String text, Object... list) {
        super(cause, text, list);
    }
}
