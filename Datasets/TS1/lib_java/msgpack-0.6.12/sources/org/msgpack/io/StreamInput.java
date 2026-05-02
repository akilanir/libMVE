package org.msgpack.io;

import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/io/StreamInput.class */
public class StreamInput extends AbstractInput {
    private final InputStream in;
    private byte[] castBuffer = new byte[8];
    private ByteBuffer castByteBuffer = ByteBuffer.wrap(this.castBuffer);
    private int filled = 0;

    @Override // org.msgpack.io.AbstractInput, org.msgpack.io.Input
    public /* bridge */ /* synthetic */ void resetReadByteCount() {
        super.resetReadByteCount();
    }

    @Override // org.msgpack.io.AbstractInput, org.msgpack.io.Input
    public /* bridge */ /* synthetic */ int getReadByteCount() {
        return super.getReadByteCount();
    }

    public StreamInput(InputStream in) {
        this.in = in;
    }

    @Override // org.msgpack.io.Input
    public int read(byte[] b, int off, int len) throws IOException {
        int remain = len;
        while (remain > 0) {
            int n = this.in.read(b, off, remain);
            if (n <= 0) {
                throw new EOFException();
            }
            incrReadByteCount(n);
            remain -= n;
            off += n;
        }
        return len;
    }

    @Override // org.msgpack.io.Input
    public boolean tryRefer(BufferReferer ref, int size) throws IOException {
        return false;
    }

    @Override // org.msgpack.io.Input
    public byte readByte() throws IOException {
        int n = this.in.read();
        if (n < 0) {
            throw new EOFException();
        }
        incrReadOneByteCount();
        return (byte) n;
    }

    @Override // org.msgpack.io.Input
    public void advance() {
        incrReadByteCount(this.filled);
        this.filled = 0;
    }

    private void require(int len) throws IOException {
        while (this.filled < len) {
            int n = this.in.read(this.castBuffer, this.filled, len - this.filled);
            if (n < 0) {
                throw new EOFException();
            }
            this.filled += n;
        }
    }

    @Override // org.msgpack.io.Input
    public byte getByte() throws IOException {
        require(1);
        return this.castBuffer[0];
    }

    @Override // org.msgpack.io.Input
    public short getShort() throws IOException {
        require(2);
        return this.castByteBuffer.getShort(0);
    }

    @Override // org.msgpack.io.Input
    public int getInt() throws IOException {
        require(4);
        return this.castByteBuffer.getInt(0);
    }

    @Override // org.msgpack.io.Input
    public long getLong() throws IOException {
        require(8);
        return this.castByteBuffer.getLong(0);
    }

    @Override // org.msgpack.io.Input
    public float getFloat() throws IOException {
        require(4);
        return this.castByteBuffer.getFloat(0);
    }

    @Override // org.msgpack.io.Input
    public double getDouble() throws IOException {
        require(8);
        return this.castByteBuffer.getDouble(0);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.in.close();
    }
}
