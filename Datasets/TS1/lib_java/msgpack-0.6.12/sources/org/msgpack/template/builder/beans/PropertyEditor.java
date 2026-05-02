package org.msgpack.template.builder.beans;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/beans/PropertyEditor.class */
public interface PropertyEditor {
    void setAsText(String str) throws IllegalArgumentException;

    String[] getTags();

    String getJavaInitializationString();

    String getAsText();

    void setValue(Object obj);

    Object getValue();

    void removePropertyChangeListener(PropertyChangeListener propertyChangeListener);

    void addPropertyChangeListener(PropertyChangeListener propertyChangeListener);

    boolean supportsCustomEditor();

    boolean isPaintable();
}
