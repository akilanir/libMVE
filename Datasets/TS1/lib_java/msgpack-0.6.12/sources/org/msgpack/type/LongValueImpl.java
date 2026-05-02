package org.msgpack.type;

import java.io.IOException;
import java.math.BigInteger;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/type/LongValueImpl.class */
class LongValueImpl extends IntegerValue {
    private long value;
    private static long BYTE_MAX = 127;
    private static long SHORT_MAX = 32767;
    private static long INT_MAX = 2147483647L;
    private static long BYTE_MIN = -128;
    private static long SHORT_MIN = -32768;
    private static long INT_MIN = -2147483648L;

    LongValueImpl(long value) {
        this.value = value;
    }

    @Override // org.msgpack.type.IntegerValue
    public byte getByte() {
        if (this.value > BYTE_MAX || this.value < BYTE_MIN) {
            throw new MessageTypeException();
        }
        return (byte) this.value;
    }

    @Override // org.msgpack.type.IntegerValue
    public short getShort() {
        if (this.value > SHORT_MAX || this.value < SHORT_MIN) {
            throw new MessageTypeException();
        }
        return (short) this.value;
    }

    @Override // org.msgpack.type.IntegerValue
    public int getInt() {
        if (this.value > INT_MAX || this.value < INT_MIN) {
            throw new MessageTypeException();
        }
        return (int) this.value;
    }

    @Override // org.msgpack.type.IntegerValue
    public long getLong() {
        return this.value;
    }

    @Override // org.msgpack.type.IntegerValue
    public BigInteger getBigInteger() {
        return BigInteger.valueOf(this.value);
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
        return this.value;
    }

    @Override // org.msgpack.type.NumberValue
    public BigInteger bigIntegerValue() {
        return BigInteger.valueOf(this.value);
    }

    @Override // java.lang.Number
    public float floatValue() {
        return this.value;
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
        if (!v.isIntegerValue()) {
            return false;
        }
        try {
            return this.value == v.asIntegerValue().getLong();
        } catch (MessageTypeException e) {
            return false;
        }
    }

    public int hashCode() {
        if (INT_MIN <= this.value && this.value <= INT_MAX) {
            return (int) this.value;
        }
        return (int) (this.value ^ (this.value >>> 32));
    }

    public String toString() {
        return Long.toString(this.value);
    }

    @Override // org.msgpack.type.Value
    public StringBuilder toString(StringBuilder sb) {
        return sb.append(Long.toString(this.value));
    }
}
