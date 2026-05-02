package org.msgpack.type;

import org.msgpack.MessageTypeException;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/type/AbstractValue.class */
abstract class AbstractValue implements Value {
    AbstractValue() {
    }

    @Override // org.msgpack.type.Value
    public boolean isNilValue() {
        return false;
    }

    @Override // org.msgpack.type.Value
    public boolean isBooleanValue() {
        return false;
    }

    @Override // org.msgpack.type.Value
    public boolean isIntegerValue() {
        return false;
    }

    @Override // org.msgpack.type.Value
    public boolean isFloatValue() {
        return false;
    }

    @Override // org.msgpack.type.Value
    public boolean isArrayValue() {
        return false;
    }

    @Override // org.msgpack.type.Value
    public boolean isMapValue() {
        return false;
    }

    @Override // org.msgpack.type.Value
    public boolean isRawValue() {
        return false;
    }

    @Override // org.msgpack.type.Value
    public NilValue asNilValue() {
        throw new MessageTypeException();
    }

    @Override // org.msgpack.type.Value
    public BooleanValue asBooleanValue() {
        throw new MessageTypeException();
    }

    @Override // org.msgpack.type.Value
    public IntegerValue asIntegerValue() {
        throw new MessageTypeException();
    }

    @Override // org.msgpack.type.Value
    public FloatValue asFloatValue() {
        throw new MessageTypeException();
    }

    @Override // org.msgpack.type.Value
    public ArrayValue asArrayValue() {
        throw new MessageTypeException();
    }

    @Override // org.msgpack.type.Value
    public MapValue asMapValue() {
        throw new MessageTypeException();
    }

    @Override // org.msgpack.type.Value
    public RawValue asRawValue() {
        throw new MessageTypeException();
    }
}
