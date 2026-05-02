package org.simpleframework.xml.convert;

import org.simpleframework.xml.strategy.Value;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/convert/Reference.class */
class Reference implements Value {
    private Value value;
    private Object data;
    private Class actual;

    public Reference(Value value, Object data, Class actual) {
        this.actual = actual;
        this.value = value;
        this.data = data;
    }

    @Override // org.simpleframework.xml.strategy.Value
    public int getLength() {
        return 0;
    }

    @Override // org.simpleframework.xml.strategy.Value
    public Class getType() {
        if (this.data != null) {
            return this.data.getClass();
        }
        return this.actual;
    }

    @Override // org.simpleframework.xml.strategy.Value
    public Object getValue() {
        return this.data;
    }

    @Override // org.simpleframework.xml.strategy.Value
    public boolean isReference() {
        return true;
    }

    @Override // org.simpleframework.xml.strategy.Value
    public void setValue(Object data) {
        if (this.value != null) {
            this.value.setValue(data);
        }
        this.data = data;
    }
}
