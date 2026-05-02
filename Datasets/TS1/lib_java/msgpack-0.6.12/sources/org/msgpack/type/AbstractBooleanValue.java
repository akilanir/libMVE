package org.msgpack.type;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/type/AbstractBooleanValue.class */
abstract class AbstractBooleanValue extends AbstractValue implements BooleanValue {
    AbstractBooleanValue() {
    }

    @Override // org.msgpack.type.Value
    public ValueType getType() {
        return ValueType.BOOLEAN;
    }

    @Override // org.msgpack.type.AbstractValue, org.msgpack.type.Value
    public boolean isBooleanValue() {
        return true;
    }

    public boolean isTrue() {
        return getBoolean();
    }

    public boolean isFalse() {
        return !getBoolean();
    }

    @Override // org.msgpack.type.AbstractValue, org.msgpack.type.Value
    public BooleanValue asBooleanValue() {
        return this;
    }
}
