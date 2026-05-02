package org.msgpack.type;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import org.msgpack.packer.Packer;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/type/DoubleValueImpl.class */
class DoubleValueImpl extends FloatValue {
    private double value;

    DoubleValueImpl(double value) {
        this.value = value;
    }

    @Override // org.msgpack.type.FloatValue
    public float getFloat() {
        return (float) this.value;
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
        return (float) this.value;
    }

    @Override // java.lang.Number
    public double doubleValue() {
        return this.value;
    }

    @Override // org.msgpack.type.Value
    public void writeTo(Packer pk) throws IOException {
        pk.write(this.value);
    }

    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (!(o instanceof Value)) {
            return false;
        }
        Value v = (Value) o;
        return v.isFloatValue() && this.value == v.asFloatValue().getDouble();
    }

    public int hashCode() {
        long v = Double.doubleToLongBits(this.value);
        return (int) (v ^ (v >>> 32));
    }

    public String toString() {
        return Double.toString(this.value);
    }

    @Override // org.msgpack.type.Value
    public StringBuilder toString(StringBuilder sb) {
        return sb.append(Double.toString(this.value));
    }
}
