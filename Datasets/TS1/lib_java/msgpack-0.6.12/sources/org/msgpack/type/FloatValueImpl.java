package org.msgpack.type;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import org.msgpack.packer.Packer;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/type/FloatValueImpl.class */
class FloatValueImpl extends FloatValue {
    private float value;

    FloatValueImpl(float value) {
        this.value = value;
    }

    @Override // org.msgpack.type.FloatValue
    public float getFloat() {
        return this.value;
    }

    @Override // org.msgpack.type.FloatValue
    public double getDouble() {
        return this.value;
    }

    @Override // java.lang.Number
    public byte byteValue() {
        return (byte) this.value;
    }

    @Override // java.lang.Number
    public short shortValue() {
        return (short) this.value;
    }

    @Override // java.lang.Number
    public int intValue() {
        return (int) this.value;
    }

    @Override // java.lang.Number
    public long longValue() {
        return (long) this.value;
    }

    @Override // org.msgpack.type.NumberValue
    public BigInteger bigIntegerValue() {
        return new BigDecimal(this.value).toBigInteger();
    }

    @Override // java.lang.Number
    public float floatValue() {
        return this.value;
    }

    @Override // java.lang.Number
    public double doubleValue() {
        return this.value;
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof Value)) {
            return false;
        }
        Value v = (Value) o;
        return v.isFloatValue() && ((double) this.value) == v.asFloatValue().getDouble();
    }

    @Override // org.msgpack.type.Value
    public void writeTo(Packer pk) throws IOException {
        pk.write(this.value);
    }

    public int hashCode() {
        return Float.floatToIntBits(this.value);
    }

    public String toString() {
        return Float.toString(this.value);
    }

    @Override // org.msgpack.type.Value
    public StringBuilder toString(StringBuilder sb) {
        return sb.append(Float.toString(this.value));
    }
}
