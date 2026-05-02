package org.msgpack.io;

import java.io.DataOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/io/StreamOutput.class */
public class StreamOutput implements Output {
    private DataOutputStream out;

    public StreamOutput(OutputStream out) {
        this.out = new DataOutputStream(out);
    }

    @Override // org.msgpack.io.Output
    public void write(byte[] b, int off, int len) throws IOException {
        this.out.write(b, off, len);
    }

    @Override // org.msgpack.io.Output
    public void write(ByteBuffer bb) throws IOException {
        if (bb.hasArray()) {
            byte[] array = bb.array();
            int offset = bb.arrayOffset();
            this.out.write(array, offset, bb.remaining());
            bb.position(bb.limit());
            return;
        }
        byte[] buf = new byte[bb.remaining()];
        bb.get(buf);
        this.out.write(buf);
    }

    @Override // org.msgpack.io.Output
    public void writeByte(byte v) throws IOException {
        this.out.write(v);
    }

    @Override // org.msgpack.io.Output
    public void writeShort(short v) throws IOException {
        this.out.writeShort(v);
    }

    @Override // org.msgpack.io.Output
    public void writeInt(int v) throws IOException {
        this.out.writeInt(v);
    }

    @Override // org.msgpack.io.Output
    public void writeLong(long v) throws IOException {
        this.out.writeLong(v);
    }

    @Override // org.msgpack.io.Output
    public void writeFloat(float v) throws IOException {
        this.out.writeFloat(v);
    }

    @Override // org.msgpack.io.Output
    public void writeDouble(double v) throws IOException {
        this.out.writeDouble(v);
    }

    @Override // org.msgpack.io.Output
    public void writeByteAndByte(byte b, byte v) throws IOException {
        this.out.write(b);
        this.out.write(v);
    }

    @Override // org.msgpack.io.Output
    public void writeByteAndShort(byte b, short v) throws IOException {
        this.out.write(b);
        this.out.writeShort(v);
    }

    @Override // org.msgpack.io.Output
    public void writeByteAndInt(byte b, int v) throws IOException {
        this.out.write(b);
        this.out.writeInt(v);
    }

    @Override // org.msgpack.io.Output
    public void writeByteAndLong(byte b, long v) throws IOException {
        this.out.write(b);
        this.out.writeLong(v);
    }

    @Override // org.msgpack.io.Output
    public void writeByteAndFloat(byte b, float v) throws IOException {
        this.out.write(b);
        this.out.writeFloat(v);
    }

    @Override // org.msgpack.io.Output
    public void writeByteAndDouble(byte b, double v) throws IOException {
        this.out.write(b);
        this.out.writeDouble(v);
    }

    @Override // java.io.Flushable
    public void flush() throws IOException {
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.out.close();
    }
}
