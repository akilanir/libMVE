package org.msgpack.unpacker;

import java.nio.ByteBuffer;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/unpacker/BufferUnpacker.class */
public interface BufferUnpacker extends Unpacker {
    BufferUnpacker wrap(byte[] bArr);

    BufferUnpacker wrap(byte[] bArr, int i, int i2);

    BufferUnpacker wrap(ByteBuffer byteBuffer);

    BufferUnpacker feed(byte[] bArr);

    BufferUnpacker feed(byte[] bArr, boolean z);

    BufferUnpacker feed(byte[] bArr, int i, int i2);

    BufferUnpacker feed(byte[] bArr, int i, int i2, boolean z);

    BufferUnpacker feed(ByteBuffer byteBuffer);

    BufferUnpacker feed(ByteBuffer byteBuffer, boolean z);

    int getBufferSize();

    void copyReferencedBuffer();

    void clear();
}
