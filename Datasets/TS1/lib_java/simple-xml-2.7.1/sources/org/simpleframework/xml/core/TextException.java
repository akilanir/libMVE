package org.simpleframework.xml.core;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/TextException.class */
public class TextException extends PersistenceException {
    public TextException(String text, Object... list) {
        super(text, list);
    }

    public TextException(Throwable cause, String text, Object... list) {
        super(cause, text, list);
    }
}
