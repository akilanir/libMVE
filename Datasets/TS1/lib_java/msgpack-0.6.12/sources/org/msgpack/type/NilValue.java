package org.msgpack.type;

import java.io.IOException;
import org.apache.harmony.beans.BeansUtils;
import org.msgpack.packer.Packer;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/type/NilValue.class */
public class NilValue extends AbstractValue {
    private static NilValue instance = new NilValue();

    @Override // org.msgpack.type.AbstractValue, org.msgpack.type.Value
    public /* bridge */ /* synthetic */ RawValue asRawValue() {
        return super.asRawValue();
    }

    @Override // org.msgpack.type.AbstractValue, org.msgpack.type.Value
    public /* bridge */ /* synthetic */ MapValue asMapValue() {
        return super.asMapValue();
    }

    @Override // org.msgpack.type.AbstractValue, org.msgpack.type.Value
    public /* bridge */ /* synthetic */ ArrayValue asArrayValue() {
        return super.asArrayValue();
    }

    @Override // org.msgpack.type.AbstractValue, org.msgpack.type.Value
    public /* bridge */ /* synthetic */ FloatValue asFloatValue() {
        return super.asFloatValue();
    }

    @Override // org.msgpack.type.AbstractValue, org.msgpack.type.Value
    public /* bridge */ /* synthetic */ IntegerValue asIntegerValue() {
        return super.asIntegerValue();
    }

    @Override // org.msgpack.type.AbstractValue, org.msgpack.type.Value
    public /* bridge */ /* synthetic */ BooleanValue asBooleanValue() {
        return super.asBooleanValue();
    }

    @Override // org.msgpack.type.AbstractValue, org.msgpack.type.Value
    public /* bridge */ /* synthetic */ boolean isRawValue() {
        return super.isRawValue();
    }

    @Override // org.msgpack.type.AbstractValue, org.msgpack.type.Value
    public /* bridge */ /* synthetic */ boolean isMapValue() {
        return super.isMapValue();
    }

    @Override // org.msgpack.type.AbstractValue, org.msgpack.type.Value
    public /* bridge */ /* synthetic */ boolean isArrayValue() {
        return super.isArrayValue();
    }

    @Override // org.msgpack.type.AbstractValue, org.msgpack.type.Value
    public /* bridge */ /* synthetic */ boolean isFloatValue() {
        return super.isFloatValue();
    }

    @Override // org.msgpack.type.AbstractValue, org.msgpack.type.Value
    public /* bridge */ /* synthetic */ boolean isIntegerValue() {
        return super.isIntegerValue();
    }

    @Override // org.msgpack.type.AbstractValue, org.msgpack.type.Value
    public /* bridge */ /* synthetic */ boolean isBooleanValue() {
        return super.isBooleanValue();
    }

    private NilValue() {
    }

    static NilValue getInstance() {
        return instance;
    }

    @Override // org.msgpack.type.Value
    public ValueType getType() {
        return ValueType.NIL;
    }

    @Override // org.msgpack.type.AbstractValue, org.msgpack.type.Value
    public boolean isNilValue() {
        return true;
    }

    @Override // org.msgpack.type.AbstractValue, org.msgpack.type.Value
    public NilValue asNilValue() {
        return this;
    }

    public String toString() {
        return BeansUtils.NULL;
    }

    @Override // org.msgpack.type.Value
    public StringBuilder toString(StringBuilder sb) {
        return sb.append(BeansUtils.NULL);
    }

    @Override // org.msgpack.type.Value
    public void writeTo(Packer pk) throws IOException {
        pk.writeNil();
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof Value)) {
            return false;
        }
        return ((Value) o).isNilValue();
    }

    public int hashCode() {
        return 0;
    }
}
