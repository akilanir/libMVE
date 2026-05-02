package org.msgpack.unpacker;

import java.nio.ByteBuffer;
import org.msgpack.MessagePack;
import org.msgpack.io.LinkedBufferInput;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/unpacker/MessagePackBufferUnpacker.class */
public class MessagePackBufferUnpacker extends MessagePackUnpacker implements BufferUnpacker {
    private static final int DEFAULT_BUFFER_SIZE = 512;

    public MessagePackBufferUnpacker(MessagePack msgpack) {
        this(msgpack, DEFAULT_BUFFER_SIZE);
    }

    public MessagePackBufferUnpacker(MessagePack msgpack, int bufferSize) {
        super(msgpack, new LinkedBufferInput(bufferSize));
    }

    @Override // org.msgpack.unpacker.BufferUnpacker
    public MessagePackBufferUnpacker wrap(byte[] b) {
        return wrap(b, 0, b.length);
    }

    @Override // org.msgpack.unpacker.BufferUnpacker
    public MessagePackBufferUnpacker wrap(byte[] b, int off, int len) {
        ((LinkedBufferInput) this.in).clear();
        ((LinkedBufferInput) this.in).feed(b, off, len, true);
        return this;
    }

    @Override // org.msgpack.unpacker.BufferUnpacker
    public MessagePackBufferUnpacker wrap(ByteBuffer buf) {
        ((LinkedBufferInput) this.in).clear();
        ((LinkedBufferInput) this.in).feed(buf, true);
        return this;
    }

    @Override // org.msgpack.unpacker.BufferUnpacker
    public MessagePackBufferUnpacker feed(byte[] b) {
        ((LinkedBufferInput) this.in).feed(b);
        return this;
    }

    @Override // org.msgpack.unpacker.BufferUnpacker
    public MessagePackBufferUnpacker feed(byte[] b, boolean reference) {
        ((LinkedBufferInput) this.in).feed(b, reference);
        return this;
    }

    @Override // org.msgpack.unpacker.BufferUnpacker
    public MessagePackBufferUnpacker feed(byte[] b, int off, int len) {
        ((LinkedBufferInput) this.in).feed(b, off, len);
        return this;
    }

    @Override // org.msgpack.unpacker.BufferUnpacker
    public MessagePackBufferUnpacker feed(byte[] b, int off, int len, boolean reference) {
        ((LinkedBufferInput) this.in).feed(b, off, len, reference);
        return this;
    }

    @Override // org.msgpack.unpacker.BufferUnpacker
    public MessagePackBufferUnpacker feed(ByteBuffer b) {
        ((LinkedBufferInput) this.in).feed(b);
        return this;
    }

    @Override // org.msgpack.unpacker.BufferUnpacker
    public MessagePackBufferUnpacker feed(ByteBuffer buf, boolean reference) {
        ((LinkedBufferInput) this.in).feed(buf, reference);
        return this;
    }

    @Override // org.msgpack.unpacker.BufferUnpacker
    public int getBufferSize() {
        return ((LinkedBufferInput) this.in).getSize();
    }

    @Override // org.msgpack.unpacker.BufferUnpacker
    public void copyReferencedBuffer() {
        ((LinkedBufferInput) this.in).copyReferencedBuffer();
    }

    @Override // org.msgpack.unpacker.BufferUnpacker
    public void clear() {
        ((LinkedBufferInput) this.in).clear();
        reset();
    }
}
