package org.msgpack.type;

import java.io.IOException;
import java.math.BigInteger;
import org.msgpack.MessageTypeException;
import org.msgpack.packer.Packer;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/type/IntValueImpl.class */
class IntValueImpl extends IntegerValue {
    private int value;
    private static int BYTE_MAX = 127;
    private static int SHORT_MAX = 32767;
    private static int BYTE_MIN = -128;
    private static int SHORT_MIN = -32768;

    IntValueImpl(int value) {
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
        return this.value;
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
        return this.value;
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
            return this.value == v.asIntegerValue().getInt();
        } catch (MessageTypeException e) {
            return false;
        }
    }

    public int hashCode() {
        return this.value;
    }

    public String toString() {
        return Integer.toString(this.value);
    }

    @Override // org.msgpack.type.Value
    public StringBuilder toString(StringBuilder sb) {
        return sb.append(Integer.toString(this.value));
    }
}
