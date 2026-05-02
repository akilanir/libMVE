package org.msgpack.unpacker;

import java.io.IOException;
import java.math.BigInteger;
import java.nio.ByteBuffer;
import org.msgpack.packer.Unconverter;
import org.msgpack.type.Value;
import org.msgpack.type.ValueFactory;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/unpacker/ValueAccept.class */
final class ValueAccept extends Accept {
    private Unconverter uc;

    ValueAccept() {
        super(null);
        this.uc = null;
    }

    void setUnconverter(Unconverter uc) throws IOException {
        this.uc = uc;
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptBoolean(boolean v) throws IOException {
        this.uc.write((Value) ValueFactory.createBooleanValue(v));
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptInteger(byte v) throws IOException {
        this.uc.write((Value) ValueFactory.createIntegerValue(v));
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptInteger(short v) throws IOException {
        this.uc.write((Value) ValueFactory.createIntegerValue(v));
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptInteger(int v) throws IOException {
        this.uc.write((Value) ValueFactory.createIntegerValue(v));
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptInteger(long v) throws IOException {
        this.uc.write((Value) ValueFactory.createIntegerValue(v));
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptUnsignedInteger(byte v) throws IOException {
        this.uc.write((Value) ValueFactory.createIntegerValue(v & 255));
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptUnsignedInteger(short v) throws IOException {
        this.uc.write((Value) ValueFactory.createIntegerValue(v & 65535));
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptUnsignedInteger(int v) throws IOException {
        if (v < 0) {
            long value = (v & Integer.MAX_VALUE) + 2147483648L;
            this.uc.write((Value) ValueFactory.createIntegerValue(value));
        } else {
            this.uc.write((Value) ValueFactory.createIntegerValue(v));
        }
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptUnsignedInteger(long v) throws IOException {
        if (v < 0) {
            BigInteger value = BigInteger.valueOf(v + Long.MAX_VALUE + 1).setBit(63);
            this.uc.write((Value) ValueFactory.createIntegerValue(value));
        } else {
            this.uc.write((Value) ValueFactory.createIntegerValue(v));
        }
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptRaw(byte[] raw) throws IOException {
        this.uc.write((Value) ValueFactory.createRawValue(raw));
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptEmptyRaw() throws IOException {
        this.uc.write((Value) ValueFactory.createRawValue());
    }

    @Override // org.msgpack.unpacker.Accept, org.msgpack.io.BufferReferer
    public void refer(ByteBuffer bb, boolean gift) throws IOException {
        byte[] raw = new byte[bb.remaining()];
        bb.get(raw);
        this.uc.write((Value) ValueFactory.createRawValue(raw, true));
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptArray(int size) throws IOException {
        this.uc.writeArrayBegin(size);
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptMap(int size) throws IOException {
        this.uc.writeMapBegin(size);
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptNil() throws IOException {
        this.uc.write((Value) ValueFactory.createNilValue());
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptFloat(float v) throws IOException {
        this.uc.write((Value) ValueFactory.createFloatValue(v));
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptDouble(double v) throws IOException {
        this.uc.write((Value) ValueFactory.createFloatValue(v));
    }
}
