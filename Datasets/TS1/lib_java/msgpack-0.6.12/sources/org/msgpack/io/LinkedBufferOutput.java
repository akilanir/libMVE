package org.msgpack.io;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.Iterator;
import java.util.LinkedList;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/io/LinkedBufferOutput.class */
public final class LinkedBufferOutput extends BufferedOutput {
    private LinkedList<Link> link;
    private int size;

    @Override // org.msgpack.io.BufferedOutput, java.io.Flushable
    public /* bridge */ /* synthetic */ void flush() throws IOException {
        super.flush();
    }

    @Override // org.msgpack.io.BufferedOutput, org.msgpack.io.Output
    public /* bridge */ /* synthetic */ void writeByteAndDouble(byte x0, double x1) throws IOException {
        super.writeByteAndDouble(x0, x1);
    }

    @Override // org.msgpack.io.BufferedOutput, org.msgpack.io.Output
    public /* bridge */ /* synthetic */ void writeByteAndFloat(byte x0, float x1) throws IOException {
        super.writeByteAndFloat(x0, x1);
    }

    @Override // org.msgpack.io.BufferedOutput, org.msgpack.io.Output
    public /* bridge */ /* synthetic */ void writeByteAndLong(byte x0, long x1) throws IOException {
        super.writeByteAndLong(x0, x1);
    }

    @Override // org.msgpack.io.BufferedOutput, org.msgpack.io.Output
    public /* bridge */ /* synthetic */ void writeByteAndInt(byte x0, int x1) throws IOException {
        super.writeByteAndInt(x0, x1);
    }

    @Override // org.msgpack.io.BufferedOutput, org.msgpack.io.Output
    public /* bridge */ /* synthetic */ void writeByteAndShort(byte x0, short x1) throws IOException {
        super.writeByteAndShort(x0, x1);
    }

    @Override // org.msgpack.io.BufferedOutput, org.msgpack.io.Output
    public /* bridge */ /* synthetic */ void writeByteAndByte(byte x0, byte x1) throws IOException {
        super.writeByteAndByte(x0, x1);
    }

    @Override // org.msgpack.io.BufferedOutput, org.msgpack.io.Output
    public /* bridge */ /* synthetic */ void writeDouble(double x0) throws IOException {
        super.writeDouble(x0);
    }

    @Override // org.msgpack.io.BufferedOutput, org.msgpack.io.Output
    public /* bridge */ /* synthetic */ void writeFloat(float x0) throws IOException {
        super.writeFloat(x0);
    }

    @Override // org.msgpack.io.BufferedOutput, org.msgpack.io.Output
    public /* bridge */ /* synthetic */ void writeLong(long x0) throws IOException {
        super.writeLong(x0);
    }

    @Override // org.msgpack.io.BufferedOutput, org.msgpack.io.Output
    public /* bridge */ /* synthetic */ void writeInt(int x0) throws IOException {
        super.writeInt(x0);
    }

    @Override // org.msgpack.io.BufferedOutput, org.msgpack.io.Output
    public /* bridge */ /* synthetic */ void writeShort(short x0) throws IOException {
        super.writeShort(x0);
    }

    @Override // org.msgpack.io.BufferedOutput, org.msgpack.io.Output
    public /* bridge */ /* synthetic */ void writeByte(byte x0) throws IOException {
        super.writeByte(x0);
    }

    @Override // org.msgpack.io.BufferedOutput, org.msgpack.io.Output
    public /* bridge */ /* synthetic */ void write(ByteBuffer x0) throws IOException {
        super.write(x0);
    }

    @Override // org.msgpack.io.BufferedOutput, org.msgpack.io.Output
    public /* bridge */ /* synthetic */ void write(byte[] x0, int x1, int x2) throws IOException {
        super.write(x0, x1, x2);
    }

    /* loaded from: msgpack-0.6.12.jar:org/msgpack/io/LinkedBufferOutput$Link.class */
    private static final class Link {
        final byte[] buffer;
        final int offset;
        final int size;

        Link(byte[] buffer, int offset, int size) {
            this.buffer = buffer;
            this.offset = offset;
            this.size = size;
        }
    }

    public LinkedBufferOutput(int bufferSize) {
        super(bufferSize);
        this.link = new LinkedList<>();
    }

    public byte[] toByteArray() {
        byte[] bytes = new byte[this.size + this.filled];
        int off = 0;
        Iterator i$ = this.link.iterator();
        while (i$.hasNext()) {
            Link l = i$.next();
            System.arraycopy(l.buffer, l.offset, bytes, off, l.size);
            off += l.size;
        }
        if (this.filled > 0) {
            System.arraycopy(this.buffer, 0, bytes, off, this.filled);
        }
        return bytes;
    }

    public int getSize() {
        return this.size + this.filled;
    }

    @Override // org.msgpack.io.BufferedOutput
    protected boolean flushBuffer(byte[] b, int off, int len) {
        this.link.add(new Link(b, off, len));
        this.size += len;
        return false;
    }

    public void clear() {
        this.link.clear();
        this.size = 0;
        this.filled = 0;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
    }
}
