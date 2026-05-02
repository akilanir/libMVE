package nl.siegmann.epublib.util;

import java.io.IOException;
import java.io.Writer;

/* loaded from: epublib-core-3.1.jar:nl/siegmann/epublib/util/NoCloseWriter.class */
public class NoCloseWriter extends Writer {
    private Writer writer;

    public NoCloseWriter(Writer writer) {
        this.writer = writer;
    }

    @Override // java.io.Writer, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
    }

    @Override // java.io.Writer, java.io.Flushable
    public void flush() throws IOException {
        this.writer.flush();
    }

    @Override // java.io.Writer
    public void write(char[] cbuf, int off, int len) throws IOException {
        this.writer.write(cbuf, off, len);
    }
}
