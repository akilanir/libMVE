package org.msgpack.unpacker;

import java.math.BigInteger;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/unpacker/BigIntegerAccept.class */
final class BigIntegerAccept extends Accept {
    BigInteger value;

    BigIntegerAccept() {
        super("integer");
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptInteger(byte v) {
        this.value = BigInteger.valueOf(v);
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptInteger(short v) {
        this.value = BigInteger.valueOf(v);
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptInteger(int v) {
        this.value = BigInteger.valueOf(v);
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptInteger(long v) {
        this.value = BigInteger.valueOf(v);
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptUnsignedInteger(byte v) {
        this.value = BigInteger.valueOf(v & 255);
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptUnsignedInteger(short v) {
        this.value = BigInteger.valueOf(v & 65535);
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptUnsignedInteger(int v) {
        if (v < 0) {
            this.value = BigInteger.valueOf((v & Integer.MAX_VALUE) + 2147483648L);
        } else {
            this.value = BigInteger.valueOf(v);
        }
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptUnsignedInteger(long v) {
        if (v < 0) {
            this.value = BigInteger.valueOf(v + Long.MAX_VALUE + 1).setBit(63);
        } else {
            this.value = BigInteger.valueOf(v);
        }
    }
}
