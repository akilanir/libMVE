package org.msgpack.packer;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/packer/BufferPacker.class */
public interface BufferPacker extends Packer {
    int getBufferSize();

    byte[] toByteArray();

    void clear();
}
