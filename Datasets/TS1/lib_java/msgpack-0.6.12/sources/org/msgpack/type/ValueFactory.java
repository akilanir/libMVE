package org.msgpack.type;

import java.math.BigInteger;
import java.nio.ByteBuffer;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/type/ValueFactory.class */
public final class ValueFactory {
    public static NilValue createNilValue() {
        return NilValue.getInstance();
    }

    public static BooleanValue createBooleanValue(boolean v) {
        if (v) {
            return TrueValueImpl.getInstance();
        }
        return FalseValueImpl.getInstance();
    }

    public static IntegerValue createIntegerValue(byte v) {
        return new IntValueImpl(v);
    }

    public static IntegerValue createIntegerValue(short v) {
        return new IntValueImpl(v);
    }

    public static IntegerValue createIntegerValue(int v) {
        return new IntValueImpl(v);
    }

    public static IntegerValue createIntegerValue(long v) {
        return new LongValueImpl(v);
    }

    public static IntegerValue createIntegerValue(BigInteger v) {
        return new BigIntegerValueImpl(v);
    }

    public static FloatValue createFloatValue(float v) {
        return new FloatValueImpl(v);
    }

    public static FloatValue createFloatValue(double v) {
        return new DoubleValueImpl(v);
    }

    public static RawValue createRawValue() {
        return ByteArrayRawValueImpl.getEmptyInstance();
    }

    public static RawValue createRawValue(byte[] b) {
        return createRawValue(b, false);
    }

    public static RawValue createRawValue(byte[] b, boolean gift) {
        return new ByteArrayRawValueImpl(b, gift);
    }

    public static RawValue createRawValue(byte[] b, int off, int len) {
        return new ByteArrayRawValueImpl(b, off, len);
    }

    public static RawValue createRawValue(String s) {
        return new StringRawValueImpl(s);
    }

    public static RawValue createRawValue(ByteBuffer bb) {
        int pos = bb.position();
        try {
            byte[] buf = new byte[bb.remaining()];
            bb.get(buf);
            ByteArrayRawValueImpl byteArrayRawValueImpl = new ByteArrayRawValueImpl(buf, true);
            bb.position(pos);
            return byteArrayRawValueImpl;
        } catch (Throwable th) {
            bb.position(pos);
            throw th;
        }
    }

    public static ArrayValue createArrayValue() {
        return ArrayValueImpl.getEmptyInstance();
    }

    public static ArrayValue createArrayValue(Value[] array) {
        if (array.length == 0) {
            return ArrayValueImpl.getEmptyInstance();
        }
        return createArrayValue(array, false);
    }

    public static ArrayValue createArrayValue(Value[] array, boolean gift) {
        if (array.length == 0) {
            return ArrayValueImpl.getEmptyInstance();
        }
        return new ArrayValueImpl(array, gift);
    }

    public static MapValue createMapValue() {
        return SequentialMapValueImpl.getEmptyInstance();
    }

    public static MapValue createMapValue(Value[] kvs) {
        if (kvs.length == 0) {
            return SequentialMapValueImpl.getEmptyInstance();
        }
        return createMapValue(kvs, false);
    }

    public static MapValue createMapValue(Value[] kvs, boolean gift) {
        if (kvs.length == 0) {
            return SequentialMapValueImpl.getEmptyInstance();
        }
        return new SequentialMapValueImpl(kvs, gift);
    }

    private ValueFactory() {
    }
}
