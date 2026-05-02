package org.msgpack.unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/unpacker/ArrayAccept.class */
final class ArrayAccept extends Accept {
    int size;

    ArrayAccept() {
        super("array");
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptArray(int size) {
        this.size = size;
    }
}
