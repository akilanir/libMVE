package org.simpleframework.xml.core;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/ValueRequiredException.class */
public class ValueRequiredException extends PersistenceException {
    public ValueRequiredException(String text, Object... list) {
        super(text, list);
    }

    public ValueRequiredException(Throwable cause, String text, Object... list) {
        super(cause, text, list);
    }
}
