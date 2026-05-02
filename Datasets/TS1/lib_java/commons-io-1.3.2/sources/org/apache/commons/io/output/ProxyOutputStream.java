package org.apache.commons.io.output;

import java.io.FilterOutputStream;
import java.io.IOException;
import java.io.OutputStream;

/* loaded from: commons-io-1.3.2.jar:org/apache/commons/io/output/ProxyOutputStream.class */
public class ProxyOutputStream extends FilterOutputStream {
    public ProxyOutputStream(OutputStream proxy) {
        super(proxy);
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream
    public void write(int idx) throws IOException {
        this.out.write(idx);
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream
    public void write(byte[] bts) throws IOException {
        this.out.write(bts);
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream
    public void write(byte[] bts, int st, int end) throws IOException {
        this.out.write(bts, st, end);
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream, java.io.Flushable
    public void flush() throws IOException {
        this.out.flush();
    }

    @Override // java.io.FilterOutputStream, java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.out.close();
    }
}
