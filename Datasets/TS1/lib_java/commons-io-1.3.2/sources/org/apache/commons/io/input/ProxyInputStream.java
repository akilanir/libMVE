package org.apache.commons.io.input;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: commons-io-1.3.2.jar:org/apache/commons/io/input/ProxyInputStream.class */
public abstract class ProxyInputStream extends FilterInputStream {
    public ProxyInputStream(InputStream proxy) {
        super(proxy);
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read() throws IOException {
        return this.in.read();
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] bts) throws IOException {
        return this.in.read(bts);
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] bts, int st, int end) throws IOException {
        return this.in.read(bts, st, end);
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public long skip(long ln) throws IOException {
        return this.in.skip(ln);
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int available() throws IOException {
        return this.in.available();
    }

    @Override // java.io.FilterInputStream, java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.in.close();
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public synchronized void mark(int idx) {
        this.in.mark(idx);
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public synchronized void reset() throws IOException {
        this.in.reset();
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public boolean markSupported() {
        return this.in.markSupported();
    }
}
