package org.tukaani.xz;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: xz-1.5.jar:org/tukaani/xz/CountingOutputStream.class */
class CountingOutputStream extends FinishableOutputStream {
    private final OutputStream out;
    private long size = 0;

    public CountingOutputStream(OutputStream outputStream) {
        this.out = outputStream;
    }

    @Override // java.io.OutputStream
    public void write(int i) throws IOException {
        this.out.write(i);
        if (this.size >= 0) {
            this.size++;
        }
    }

    @Override // java.io.OutputStream
    public void write(byte[] bArr, int i, int i2) throws IOException {
        this.out.write(bArr, i, i2);
        if (this.size >= 0) {
            this.size += i2;
        }
    }

    @Override // java.io.OutputStream, java.io.Flushable
    public void flush() throws IOException {
        this.out.flush();
    }

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.out.close();
    }

    public long getSize() {
        return this.size;
    }
}
