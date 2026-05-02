package org.msgpack.unpacker;

import java.io.IOException;
import java.nio.ByteBuffer;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/unpacker/SkipAccept.class */
final class SkipAccept extends Accept {
    SkipAccept() {
        super(null);
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptBoolean(boolean v) {
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptInteger(byte v) {
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptInteger(short v) {
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptInteger(int v) {
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptInteger(long v) {
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptUnsignedInteger(byte v) {
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptUnsignedInteger(short v) {
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptUnsignedInteger(int v) {
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptUnsignedInteger(long v) {
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptRaw(byte[] raw) {
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptEmptyRaw() {
    }

    @Override // org.msgpack.unpacker.Accept, org.msgpack.io.BufferReferer
    public void refer(ByteBuffer bb, boolean gift) throws IOException {
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptArray(int size) {
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptMap(int size) {
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptNil() {
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptFloat(float v) {
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptDouble(double v) {
    }
}
