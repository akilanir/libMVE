package org.simpleframework.xml.strategy;

import org.simpleframework.xml.core.PersistenceException;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/strategy/CycleException.class */
public class CycleException extends PersistenceException {
    public CycleException(String text, Object... list) {
        super(text, list);
    }

    public CycleException(Throwable cause, String text, Object... list) {
        super(cause, text, list);
    }
}
