package org.simpleframework.xml.strategy;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/strategy/Reference.class */
class Reference implements Value {
    private Object value;
    private Class type;

    public Reference(Object value, Class type) {
        this.value = value;
        this.type = type;
    }

    @Override // org.simpleframework.xml.strategy.Value
    public Object getValue() {
        return this.value;
    }

    @Override // org.simpleframework.xml.strategy.Value
    public void setValue(Object value) {
        this.value = value;
    }

    @Override // org.simpleframework.xml.strategy.Value
    public Class getType() {
        return this.type;
    }

    @Override // org.simpleframework.xml.strategy.Value
    public int getLength() {
        return 0;
    }

    @Override // org.simpleframework.xml.strategy.Value
    public boolean isReference() {
        return true;
    }
}
