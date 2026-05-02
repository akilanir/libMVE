package org.msgpack.util.json;

import java.io.ByteArrayInputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.nio.ByteBuffer;
import org.msgpack.MessagePack;
import org.msgpack.unpacker.BufferUnpacker;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/util/json/JSONBufferUnpacker.class */
public class JSONBufferUnpacker extends JSONUnpacker implements BufferUnpacker {
    private static final int DEFAULT_BUFFER_SIZE = 512;

    public JSONBufferUnpacker() {
        this(DEFAULT_BUFFER_SIZE);
    }

    public JSONBufferUnpacker(int bufferSize) {
        this(new MessagePack(), bufferSize);
    }

    public JSONBufferUnpacker(MessagePack msgpack) {
        this(msgpack, DEFAULT_BUFFER_SIZE);
    }

    public JSONBufferUnpacker(MessagePack msgpack, int bufferSize) {
        super(msgpack, newEmptyReader());
    }

    @Override // org.msgpack.unpacker.BufferUnpacker
    public JSONBufferUnpacker wrap(byte[] b) {
        return wrap(b, 0, b.length);
    }

    @Override // org.msgpack.unpacker.BufferUnpacker
    public JSONBufferUnpacker wrap(byte[] b, int off, int len) {
        ByteArrayInputStream in = new ByteArrayInputStream(b, off, len);
        this.in = new InputStreamReader(in);
        return this;
    }

    @Override // org.msgpack.unpacker.BufferUnpacker
    public JSONBufferUnpacker wrap(ByteBuffer buf) {
        throw new UnsupportedOperationException("JSONBufferUnpacker doesn't support wrap(ByteBuffer buf)");
    }

    @Override // org.msgpack.unpacker.BufferUnpacker
    public JSONBufferUnpacker feed(byte[] b) {
        throw new UnsupportedOperationException("JSONBufferUnpacker doesn't support feed()");
    }

    @Override // org.msgpack.unpacker.BufferUnpacker
    public JSONBufferUnpacker feed(byte[] b, boolean reference) {
        throw new UnsupportedOperationException("JSONBufferUnpacker doesn't support feed()");
    }

    @Override // org.msgpack.unpacker.BufferUnpacker
    public JSONBufferUnpacker feed(byte[] b, int off, int len) {
        throw new UnsupportedOperationException("JSONBufferUnpacker doesn't support feed()");
    }

    @Override // org.msgpack.unpacker.BufferUnpacker
    public JSONBufferUnpacker feed(byte[] b, int off, int len, boolean reference) {
        throw new UnsupportedOperationException("JSONBufferUnpacker doesn't support feed()");
    }

    @Override // org.msgpack.unpacker.BufferUnpacker
    public JSONBufferUnpacker feed(ByteBuffer buf) {
        throw new UnsupportedOperationException("JSONBufferUnpacker doesn't support feed()");
    }

    @Override // org.msgpack.unpacker.BufferUnpacker
    public JSONBufferUnpacker feed(ByteBuffer buf, boolean reference) {
        throw new UnsupportedOperationException("JSONBufferUnpacker doesn't support feed()");
    }

    @Override // org.msgpack.unpacker.BufferUnpacker
    public int getBufferSize() {
        throw new UnsupportedOperationException("JSONBufferUnpacker doesn't support getBufferSize()");
    }

    @Override // org.msgpack.unpacker.BufferUnpacker
    public void copyReferencedBuffer() {
        throw new UnsupportedOperationException("JSONBufferUnpacker doesn't support copyReferencedBuffer()");
    }

    @Override // org.msgpack.unpacker.BufferUnpacker
    public void clear() {
        reset();
        this.in = newEmptyReader();
    }

    private static Reader newEmptyReader() {
        return new InputStreamReader(new ByteArrayInputStream(new byte[0]));
    }
}
