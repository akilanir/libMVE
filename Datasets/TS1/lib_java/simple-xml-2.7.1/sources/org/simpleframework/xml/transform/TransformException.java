package org.simpleframework.xml.transform;

import org.simpleframework.xml.core.PersistenceException;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/transform/TransformException.class */
public class TransformException extends PersistenceException {
    public TransformException(String text, Object... list) {
        super(String.format(text, list), new Object[0]);
    }

    public TransformException(Throwable cause, String text, Object... list) {
        super(String.format(text, list), cause);
    }
}
