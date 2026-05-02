package org.msgpack.unpacker;

import org.msgpack.MessageTypeException;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/unpacker/IntAccept.class */
final class IntAccept extends Accept {
    int value;

    IntAccept() {
        super("integer");
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptInteger(byte v) {
        this.value = v;
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptInteger(short v) {
        this.value = v;
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptInteger(int v) {
        this.value = v;
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptInteger(long v) {
        if (v < -2147483648L || v > 2147483647L) {
            throw new MessageTypeException();
        }
        this.value = (int) v;
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptUnsignedInteger(byte v) {
        this.value = v & 255;
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptUnsignedInteger(short v) {
        this.value = v & 65535;
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptUnsignedInteger(int v) {
        if (v < 0) {
            throw new MessageTypeException();
        }
        this.value = v;
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptUnsignedInteger(long v) {
        if (v < 0 || v > 2147483647L) {
            throw new MessageTypeException();
        }
        this.value = (int) v;
    }
}
