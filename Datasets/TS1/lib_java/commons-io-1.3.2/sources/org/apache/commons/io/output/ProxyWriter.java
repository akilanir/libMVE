package org.apache.commons.io.output;

import java.io.FilterWriter;
import java.io.IOException;
import java.io.Writer;

/* loaded from: commons-io-1.3.2.jar:org/apache/commons/io/output/ProxyWriter.class */
public class ProxyWriter extends FilterWriter {
    public ProxyWriter(Writer proxy) {
        super(proxy);
    }

    @Override // java.io.FilterWriter, java.io.Writer
    public void write(int idx) throws IOException {
        this.out.write(idx);
    }

    @Override // java.io.Writer
    public void write(char[] chr) throws IOException {
        this.out.write(chr);
    }

    @Override // java.io.FilterWriter, java.io.Writer
    public void write(char[] chr, int st, int end) throws IOException {
        this.out.write(chr, st, end);
    }

    @Override // java.io.Writer
    public void write(String str) throws IOException {
        this.out.write(str);
    }

    @Override // java.io.FilterWriter, java.io.Writer
    public void write(String str, int st, int end) throws IOException {
        this.out.write(str, st, end);
    }

    @Override // java.io.FilterWriter, java.io.Writer, java.io.Flushable
    public void flush() throws IOException {
        this.out.flush();
    }

    @Override // java.io.FilterWriter, java.io.Writer, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.out.close();
    }
}
