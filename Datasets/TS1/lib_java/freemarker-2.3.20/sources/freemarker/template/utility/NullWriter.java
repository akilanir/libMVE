package freemarker.template.utility;

import java.io.IOException;
import java.io.Writer;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/utility/NullWriter.class */
public final class NullWriter extends Writer {
    public static final NullWriter INSTANCE = new NullWriter();

    private NullWriter() {
    }

    @Override // java.io.Writer
    public void write(char[] cbuf, int off, int len) throws IOException {
    }

    @Override // java.io.Writer, java.io.Flushable
    public void flush() throws IOException {
    }

    @Override // java.io.Writer, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
    }

    @Override // java.io.Writer
    public void write(int c) throws IOException {
    }

    @Override // java.io.Writer
    public void write(char[] cbuf) throws IOException {
    }

    @Override // java.io.Writer
    public void write(String str) throws IOException {
    }

    @Override // java.io.Writer
    public void write(String str, int off, int len) throws IOException {
    }
}
