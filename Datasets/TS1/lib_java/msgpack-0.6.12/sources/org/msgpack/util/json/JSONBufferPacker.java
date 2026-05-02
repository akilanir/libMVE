package org.msgpack.util.json;

import org.msgpack.MessagePack;
import org.msgpack.io.LinkedBufferOutput;
import org.msgpack.packer.BufferPacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/util/json/JSONBufferPacker.class */
public class JSONBufferPacker extends JSONPacker implements BufferPacker {
    private static final int DEFAULT_BUFFER_SIZE = 512;

    public JSONBufferPacker() {
        this(DEFAULT_BUFFER_SIZE);
    }

    public JSONBufferPacker(int bufferSize) {
        this(new MessagePack(), bufferSize);
    }

    public JSONBufferPacker(MessagePack msgpack) {
        this(msgpack, DEFAULT_BUFFER_SIZE);
    }

    public JSONBufferPacker(MessagePack msgpack, int bufferSize) {
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
