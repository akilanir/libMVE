package org.msgpack.packer;

import org.msgpack.MessagePack;
import org.msgpack.io.LinkedBufferOutput;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/packer/MessagePackBufferPacker.class */
public class MessagePackBufferPacker extends MessagePackPacker implements BufferPacker {
    private static final int DEFAULT_BUFFER_SIZE = 512;

    public MessagePackBufferPacker(MessagePack msgpack) {
        this(msgpack, DEFAULT_BUFFER_SIZE);
    }

    public MessagePackBufferPacker(MessagePack msgpack, int bufferSize) {
        super(msgpack, new LinkedBufferOutput(bufferSize));
    }

    @Override // org.msgpack.packer.BufferPacker
    public int getBufferSize() {
        return ((LinkedBufferOutput) this.out).getSize();
    }

    @Override // org.msgpack.packer.BufferPacker
    public byte[] toByteArray() {
        return ((LinkedBufferOutput) this.out).toByteArray();
    }

    @Override // org.msgpack.packer.BufferPacker
    public void clear() {
        reset();
        ((LinkedBufferOutput) this.out).clear();
    }
}
