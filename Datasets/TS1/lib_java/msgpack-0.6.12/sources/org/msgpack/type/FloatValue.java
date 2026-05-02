package org.msgpack.type;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/type/FloatValue.class */
public abstract class FloatValue extends NumberValue {
    public abstract float getFloat();

    public abstract double getDouble();

    @Override // org.msgpack.type.Value
    public ValueType getType() {
        return ValueType.FLOAT;
    }

    @Override // org.msgpack.type.NumberValue, org.msgpack.type.Value
    public boolean isFloatValue() {
        return true;
    }

    @Override // org.msgpack.type.NumberValue, org.msgpack.type.Value
    public FloatValue asFloatValue() {
        return this;
    }
}
