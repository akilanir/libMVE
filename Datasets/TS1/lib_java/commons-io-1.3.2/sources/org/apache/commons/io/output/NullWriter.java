package org.apache.commons.io.output;

import java.io.Writer;

/* loaded from: commons-io-1.3.2.jar:org/apache/commons/io/output/NullWriter.class */
public class NullWriter extends Writer {
    @Override // java.io.Writer
    public void write(int idx) {
    }

    @Override // java.io.Writer
    public void write(char[] chr) {
    }

    @Override // java.io.Writer
    public void write(char[] chr, int st, int end) {
    }

    @Override // java.io.Writer
    public void write(String str) {
    }

    @Override // java.io.Writer
    public void write(String str, int st, int end) {
    }

    @Override // java.io.Writer, java.io.Flushable
    public void flush() {
    }

    @Override // java.io.Writer, java.io.Closeable, java.lang.AutoCloseable
    public void close() {
    }
}
