package org.msgpack.io;

import java.io.IOException;
import java.nio.BufferOverflowException;
import java.nio.ByteBuffer;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/io/ByteBufferOutput.class */
public class ByteBufferOutput implements Output {
    private ByteBuffer buffer;
    private ExpandBufferCallback callback;

    /* loaded from: msgpack-0.6.12.jar:org/msgpack/io/ByteBufferOutput$ExpandBufferCallback.class */
    public interface ExpandBufferCallback {
        ByteBuffer call(ByteBuffer byteBuffer, int i) throws IOException;
    }

    public ByteBufferOutput(ByteBuffer buffer) {
        this(buffer, null);
    }

    public ByteBufferOutput(ByteBuffer buffer, ExpandBufferCallback callback) {
        this.buffer = buffer;
        this.callback = callback;
    }

    private void reserve(int len) throws IOException {
        if (len <= this.buffer.remaining()) {
            return;
        }
        if (this.callback == null) {
            throw new BufferOverflowException();
        }
        this.buffer = this.callback.call(this.buffer, len);
    }

    @Override // org.msgpack.io.Output
    public void write(byte[] b, int off, int len) throws IOException {
        reserve(len);
        this.buffer.put(b, off, len);
    }

    @Override // org.msgpack.io.Output
    public void write(ByteBuffer bb) throws IOException {
        reserve(bb.remaining());
        this.buffer.put(bb);
    }

    @Override // org.msgpack.io.Output
    public void writeByte(byte v) throws IOException {
        reserve(1);
        this.buffer.put(v);
    }

    @Override // org.msgpack.io.Output
    public void writeShort(short v) throws IOException {
        reserve(2);
        this.buffer.putShort(v);
    }

    @Override // org.msgpack.io.Output
    public void writeInt(int v) throws IOException {
        reserve(4);
        this.buffer.putInt(v);
    }

    @Override // org.msgpack.io.Output
    public void writeLong(long v) throws IOException {
        reserve(8);
        this.buffer.putLong(v);
    }

    @Override // org.msgpack.io.Output
    public void writeFloat(float v) throws IOException {
        reserve(4);
        this.buffer.putFloat(v);
    }

    @Override // org.msgpack.io.Output
    public void writeDouble(double v) throws IOException {
        reserve(8);
        this.buffer.putDouble(v);
    }

    @Override // org.msgpack.io.Output
    public void writeByteAndByte(byte b, byte v) throws IOException {
        reserve(2);
        this.buffer.put(b);
        this.buffer.put(v);
    }

    @Override // org.msgpack.io.Output
    public void writeByteAndShort(byte b, short v) throws IOException {
        reserve(3);
        this.buffer.put(b);
        this.buffer.putShort(v);
    }

    @Override // org.msgpack.io.Output
    public void writeByteAndInt(byte b, int v) throws IOException {
        reserve(5);
        this.buffer.put(b);
        this.buffer.putInt(v);
    }

    @Override // org.msgpack.io.Output
    public void writeByteAndLong(byte b, long v) throws IOException {
        reserve(9);
        this.buffer.put(b);
        this.buffer.putLong(v);
    }

    @Override // org.msgpack.io.Output
    public void writeByteAndFloat(byte b, float v) throws IOException {
        reserve(5);
        this.buffer.put(b);
        this.buffer.putFloat(v);
    }

    @Override // org.msgpack.io.Output
    public void writeByteAndDouble(byte b, double v) throws IOException {
        reserve(9);
        this.buffer.put(b);
        this.buffer.putDouble(v);
    }

    @Override // java.io.Flushable
    public void flush() throws IOException {
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
    }
}
