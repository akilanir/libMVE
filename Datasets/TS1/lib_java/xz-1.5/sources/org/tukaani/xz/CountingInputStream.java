package org.tukaani.xz;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: xz-1.5.jar:org/tukaani/xz/CountingInputStream.class */
class CountingInputStream extends FilterInputStream {
    private long size;

    public CountingInputStream(InputStream inputStream) {
        super(inputStream);
        this.size = 0L;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read() throws IOException {
        int read = this.in.read();
        if (read != -1 && this.size >= 0) {
            this.size++;
        }
        return read;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] bArr, int i, int i2) throws IOException {
        int read = this.in.read(bArr, i, i2);
        if (read > 0 && this.size >= 0) {
            this.size += read;
        }
        return read;
    }

    public long getSize() {
        return this.size;
    }
}
