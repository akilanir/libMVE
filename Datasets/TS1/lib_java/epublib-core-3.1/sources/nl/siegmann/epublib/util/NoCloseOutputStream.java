package nl.siegmann.epublib.util;

import java.io.IOException;
import java.io.OutputStream;

/* loaded from: epublib-core-3.1.jar:nl/siegmann/epublib/util/NoCloseOutputStream.class */
public class NoCloseOutputStream extends OutputStream {
    private OutputStream outputStream;

    public NoCloseOutputStream(OutputStream outputStream) {
        this.outputStream = outputStream;
    }

    @Override // java.io.OutputStream
    public void write(int b) throws IOException {
        this.outputStream.write(b);
    }

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() {
    }
}
