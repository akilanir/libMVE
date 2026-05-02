package org.msgpack.unpacker;

import java.io.IOException;
import java.nio.ByteBuffer;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/unpacker/ByteArrayAccept.class */
final class ByteArrayAccept extends Accept {
    byte[] value;

    ByteArrayAccept() {
        super("raw value");
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptRaw(byte[] raw) {
        this.value = raw;
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptEmptyRaw() {
        this.value = new byte[0];
    }

    @Override // org.msgpack.unpacker.Accept, org.msgpack.io.BufferReferer
    public void refer(ByteBuffer bb, boolean gift) throws IOException {
        this.value = new byte[bb.remaining()];
        bb.get(this.value);
    }
}
