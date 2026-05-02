package org.apache.commons.io.input;

import java.io.FilterReader;
import java.io.IOException;
import java.io.Reader;

/* loaded from: commons-io-1.3.2.jar:org/apache/commons/io/input/ProxyReader.class */
public abstract class ProxyReader extends FilterReader {
    public ProxyReader(Reader proxy) {
        super(proxy);
    }

    @Override // java.io.FilterReader, java.io.Reader
    public int read() throws IOException {
        return this.in.read();
    }

    @Override // java.io.Reader
    public int read(char[] chr) throws IOException {
        return this.in.read(chr);
    }

    @Override // java.io.FilterReader, java.io.Reader
    public int read(char[] chr, int st, int end) throws IOException {
        return this.in.read(chr, st, end);
    }

    @Override // java.io.FilterReader, java.io.Reader
    public long skip(long ln) throws IOException {
        return this.in.skip(ln);
    }

    @Override // java.io.FilterReader, java.io.Reader
    public boolean ready() throws IOException {
        return this.in.ready();
    }

    @Override // java.io.FilterReader, java.io.Reader, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.in.close();
    }

    @Override // java.io.FilterReader, java.io.Reader
    public synchronized void mark(int idx) throws IOException {
        this.in.mark(idx);
    }

    @Override // java.io.FilterReader, java.io.Reader
    public synchronized void reset() throws IOException {
        this.in.reset();
    }

    @Override // java.io.FilterReader, java.io.Reader
    public boolean markSupported() {
        return this.in.markSupported();
    }
}
