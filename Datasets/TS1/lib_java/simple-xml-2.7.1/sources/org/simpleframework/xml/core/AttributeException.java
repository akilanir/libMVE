package org.simpleframework.xml.core;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/AttributeException.class */
public class AttributeException extends PersistenceException {
    public AttributeException(String text, Object... list) {
        super(text, list);
    }

    public AttributeException(Throwable cause, String text, Object... list) {
        super(cause, text, list);
    }
}
