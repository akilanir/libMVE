package org.msgpack.type;

import java.io.IOException;
import java.math.BigInteger;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/type/BigIntegerValueImpl.class */
class BigIntegerValueImpl extends IntegerValue {
    private BigInteger value;
    private static BigInteger BYTE_MAX = BigInteger.valueOf(127);
    private static BigInteger SHORT_MAX = BigInteger.valueOf(32767);
    private static BigInteger INT_MAX = BigInteger.valueOf(2147483647L);
    private static BigInteger LONG_MAX = BigInteger.valueOf(Long.MAX_VALUE);
    private static BigInteger BYTE_MIN = BigInteger.valueOf(-128);
    private static BigInteger SHORT_MIN = BigInteger.valueOf(-32768);
    private static BigInteger INT_MIN = BigInteger.valueOf(-2147483648L);
    private static BigInteger LONG_MIN = BigInteger.valueOf(Long.MIN_VALUE);

    BigIntegerValueImpl(BigInteger value) {
        this.value = value;
    }

    @Override // org.msgpack.type.IntegerValue
    public byte getByte() {
        if (this.value.compareTo(BYTE_MAX) > 0 || this.value.compareTo(BYTE_MIN) < 0) {
            throw new MessageTypeException();
        }
        return this.value.byteValue();
    }

    @Override // org.msgpack.type.IntegerValue
    public short getShort() {
        if (this.value.compareTo(SHORT_MAX) > 0 || this.value.compareTo(SHORT_MIN) < 0) {
            throw new MessageTypeException();
        }
        return this.value.shortValue();
    }

    @Override // org.msgpack.type.IntegerValue
    public int getInt() {
        if (this.value.compareTo(INT_MAX) > 0 || this.value.compareTo(INT_MIN) < 0) {
            throw new MessageTypeException();
        }
        return this.value.intValue();
    }

    @Override // org.msgpack.type.IntegerValue
    public long getLong() {
        if (this.value.compareTo(LONG_MAX) > 0 || this.value.compareTo(LONG_MIN) < 0) {
            throw new MessageTypeException();
        }
        return this.value.longValue();
    }

    @Override // org.msgpack.type.IntegerValue
    public BigInteger getBigInteger() {
        return this.value;
    }

    @Override // java.lang.Number
    public byte byteValue() {
        return this.value.byteValue();
    }

    @Override // java.lang.Number
    public short shortValue() {
        return this.value.shortValue();
    }

    @Override // java.lang.Number
    public int intValue() {
        return this.value.intValue();
    }

    @Override // java.lang.Number
    public long longValue() {
        return this.value.longValue();
    }

    @Override // org.msgpack.type.NumberValue
    public BigInteger bigIntegerValue() {
        return this.value;
    }

    @Override // java.lang.Number
    public float floatValue() {
        return this.value.floatValue();
    }

    @Override // java.lang.Number
    public double doubleValue() {
        return this.value.doubleValue();
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
        if (!v.isIntegerValue()) {
            return false;
        }
        return this.value.equals(v.asIntegerValue().bigIntegerValue());
    }

    public int hashCode() {
        if (INT_MIN.compareTo(this.value) <= 0 && this.value.compareTo(INT_MAX) <= 0) {
            return (int) this.value.longValue();
        }
        if (LONG_MIN.compareTo(this.value) <= 0 && this.value.compareTo(LONG_MAX) <= 0) {
            long v = this.value.longValue();
            return (int) (v ^ (v >>> 32));
        }
        return this.value.hashCode();
    }

    public String toString() {
        return this.value.toString();
    }

    @Override // org.msgpack.type.Value
    public StringBuilder toString(StringBuilder sb) {
        return sb.append(this.value.toString());
    }
}
