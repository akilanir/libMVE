package org.msgpack.io;

import java.io.IOException;
import java.nio.ByteBuffer;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/io/BufferedOutput.class */
abstract class BufferedOutput implements Output {
    protected byte[] buffer;
    protected int filled;
    protected final int bufferSize;
    protected ByteBuffer castByteBuffer;

    protected abstract boolean flushBuffer(byte[] bArr, int i, int i2) throws IOException;

    public BufferedOutput(int bufferSize) {
        this.bufferSize = bufferSize < 9 ? 9 : bufferSize;
    }

    private void allocateNewBuffer() {
        this.buffer = new byte[this.bufferSize];
        this.castByteBuffer = ByteBuffer.wrap(this.buffer);
    }

    private void reserve(int len) throws IOException {
        if (this.buffer == null) {
            allocateNewBuffer();
        } else if (this.bufferSize - this.filled < len) {
            if (!flushBuffer(this.buffer, 0, this.filled)) {
                this.buffer = new byte[this.bufferSize];
                this.castByteBuffer = ByteBuffer.wrap(this.buffer);
            }
            this.filled = 0;
        }
    }

    @Override // org.msgpack.io.Output
    public void write(byte[] b, int off, int len) throws IOException {
        if (this.buffer == null) {
            if (this.bufferSize < len) {
                flushBuffer(b, off, len);
                return;
            }
            allocateNewBuffer();
        }
        if (len <= this.bufferSize - this.filled) {
            System.arraycopy(b, off, this.buffer, this.filled, len);
            this.filled += len;
        } else {
            if (len <= this.bufferSize) {
                if (!flushBuffer(this.buffer, 0, this.filled)) {
                    allocateNewBuffer();
                }
                this.filled = 0;
                System.arraycopy(b, off, this.buffer, 0, len);
                this.filled = len;
                return;
            }
            flush();
            flushBuffer(b, off, len);
        }
    }

    @Override // org.msgpack.io.Output
    public void write(ByteBuffer bb) throws IOException {
        int len = bb.remaining();
        if (this.buffer == null) {
            if (this.bufferSize < len) {
                flushByteBuffer(bb);
                return;
            }
            allocateNewBuffer();
        }
        if (len <= this.bufferSize - this.filled) {
            bb.get(this.buffer, this.filled, len);
            this.filled += len;
        } else {
            if (len <= this.bufferSize) {
                if (!flushBuffer(this.buffer, 0, this.filled)) {
                    allocateNewBuffer();
                }
                this.filled = 0;
                bb.get(this.buffer, 0, len);
                this.filled = len;
                return;
            }
            flush();
            flushByteBuffer(bb);
        }
    }

    @Override // org.msgpack.io.Output
    public void writeByte(byte v) throws IOException {
        reserve(1);
        byte[] bArr = this.buffer;
        int i = this.filled;
        this.filled = i + 1;
        bArr[i] = v;
    }

    @Override // org.msgpack.io.Output
    public void writeShort(short v) throws IOException {
        reserve(2);
        this.castByteBuffer.putShort(this.filled, v);
        this.filled += 2;
    }

    @Override // org.msgpack.io.Output
    public void writeInt(int v) throws IOException {
        reserve(4);
        this.castByteBuffer.putInt(this.filled, v);
        this.filled += 4;
    }

    @Override // org.msgpack.io.Output
    public void writeLong(long v) throws IOException {
        reserve(8);
        this.castByteBuffer.putLong(this.filled, v);
        this.filled += 8;
    }

    @Override // org.msgpack.io.Output
    public void writeFloat(float v) throws IOException {
        reserve(4);
        this.castByteBuffer.putFloat(this.filled, v);
        this.filled += 4;
    }

    @Override // org.msgpack.io.Output
    public void writeDouble(double v) throws IOException {
        reserve(8);
        this.castByteBuffer.putDouble(this.filled, v);
        this.filled += 8;
    }

    @Override // org.msgpack.io.Output
    public void writeByteAndByte(byte b, byte v) throws IOException {
        reserve(2);
        byte[] bArr = this.buffer;
        int i = this.filled;
        this.filled = i + 1;
        bArr[i] = b;
        byte[] bArr2 = this.buffer;
        int i2 = this.filled;
        this.filled = i2 + 1;
        bArr2[i2] = v;
    }

    @Override // org.msgpack.io.Output
    public void writeByteAndShort(byte b, short v) throws IOException {
        reserve(3);
        byte[] bArr = this.buffer;
        int i = this.filled;
        this.filled = i + 1;
        bArr[i] = b;
        this.castByteBuffer.putShort(this.filled, v);
        this.filled += 2;
    }

    @Override // org.msgpack.io.Output
    public void writeByteAndInt(byte b, int v) throws IOException {
        reserve(5);
        byte[] bArr = this.buffer;
        int i = this.filled;
        this.filled = i + 1;
        bArr[i] = b;
        this.castByteBuffer.putInt(this.filled, v);
        this.filled += 4;
    }

    @Override // org.msgpack.io.Output
    public void writeByteAndLong(byte b, long v) throws IOException {
        reserve(9);
        byte[] bArr = this.buffer;
        int i = this.filled;
        this.filled = i + 1;
        bArr[i] = b;
        this.castByteBuffer.putLong(this.filled, v);
        this.filled += 8;
    }

    @Override // org.msgpack.io.Output
    public void writeByteAndFloat(byte b, float v) throws IOException {
        reserve(5);
        byte[] bArr = this.buffer;
        int i = this.filled;
        this.filled = i + 1;
        bArr[i] = b;
        this.castByteBuffer.putFloat(this.filled, v);
        this.filled += 4;
    }

    @Override // org.msgpack.io.Output
    public void writeByteAndDouble(byte b, double v) throws IOException {
        reserve(9);
        byte[] bArr = this.buffer;
        int i = this.filled;
        this.filled = i + 1;
        bArr[i] = b;
        this.castByteBuffer.putDouble(this.filled, v);
        this.filled += 8;
    }

    @Override // java.io.Flushable
    public void flush() throws IOException {
        if (this.filled > 0) {
            if (!flushBuffer(this.buffer, 0, this.filled)) {
                this.buffer = null;
            }
            this.filled = 0;
        }
    }

    protected void flushByteBuffer(ByteBuffer bb) throws IOException {
        if (bb.hasArray()) {
            byte[] array = bb.array();
            int offset = bb.arrayOffset();
            flushBuffer(array, offset + bb.position(), bb.remaining());
            bb.position(bb.limit());
            return;
        }
        byte[] buf = new byte[bb.remaining()];
        bb.get(buf);
        flushBuffer(buf, 0, buf.length);
    }
}
