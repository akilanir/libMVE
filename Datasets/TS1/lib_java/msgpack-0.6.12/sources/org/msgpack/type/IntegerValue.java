package org.msgpack.type;

import java.math.BigInteger;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/type/IntegerValue.class */
public abstract class IntegerValue extends NumberValue {
    public abstract byte getByte();

    public abstract short getShort();

    public abstract int getInt();

    public abstract long getLong();

    @Override // org.msgpack.type.Value
    public ValueType getType() {
        return ValueType.INTEGER;
    }

    @Override // org.msgpack.type.NumberValue, org.msgpack.type.Value
    public boolean isIntegerValue() {
        return true;
    }

    @Override // org.msgpack.type.NumberValue, org.msgpack.type.Value
    public IntegerValue asIntegerValue() {
        return this;
    }

    public BigInteger getBigInteger() {
        return bigIntegerValue();
    }
}
