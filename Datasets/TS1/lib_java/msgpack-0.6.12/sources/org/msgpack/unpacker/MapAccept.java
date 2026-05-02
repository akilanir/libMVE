package org.msgpack.unpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/unpacker/MapAccept.class */
final class MapAccept extends Accept {
    int size;

    MapAccept() {
        super("map");
    }

    @Override // org.msgpack.unpacker.Accept
    void acceptMap(int size) {
        this.size = size;
    }
}
