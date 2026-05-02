package org.simpleframework.xml.core;

import org.simpleframework.xml.strategy.Value;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/OverrideValue.class */
class OverrideValue implements Value {
    private final Value value;
    private final Class type;

    public OverrideValue(Value value, Class type) {
        this.value = value;
        this.type = type;
    }

    @Override // org.simpleframework.xml.strategy.Value
    public Object getValue() {
        return this.value.getValue();
    }

    @Override // org.simpleframework.xml.strategy.Value
    public void setValue(Object instance) {
        this.value.setValue(instance);
    }

    @Override // org.simpleframework.xml.strategy.Value
    public Class getType() {
        return this.type;
    }

    @Override // org.simpleframework.xml.strategy.Value
    public int getLength() {
        return this.value.getLength();
    }

    @Override // org.simpleframework.xml.strategy.Value
    public boolean isReference() {
        return this.value.isReference();
    }
}
