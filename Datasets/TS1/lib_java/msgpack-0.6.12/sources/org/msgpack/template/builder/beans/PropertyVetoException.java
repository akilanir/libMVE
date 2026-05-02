package org.msgpack.template.builder.beans;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/beans/PropertyVetoException.class */
public class PropertyVetoException extends Exception {
    private static final long serialVersionUID = 129596057694162164L;
    private final PropertyChangeEvent evt;

    public PropertyVetoException(String message, PropertyChangeEvent event) {
        super(message);
        this.evt = event;
    }

    public PropertyChangeEvent getPropertyChangeEvent() {
        return this.evt;
    }
}
