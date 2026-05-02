package cz.msebera.android.httpclient.impl.io;

import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.io.SessionOutputBuffer;
import cz.msebera.android.httpclient.util.Args;
import java.io.IOException;
import java.io.OutputStream;

@NotThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/io/ContentLengthOutputStream.class */
public class ContentLengthOutputStream extends OutputStream {
    private final SessionOutputBuffer out;
    private final long contentLength;
    private long total = 0;
    private boolean closed = false;

    public ContentLengthOutputStream(SessionOutputBuffer out, long contentLength) {
        this.out = (SessionOutputBuffer) Args.notNull(out, "Session output buffer");
        this.contentLength = Args.notNegative(contentLength, "Content length");
    }

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (!this.closed) {
            this.closed = true;
            this.out.flush();
        }
    }

    @Override // java.io.OutputStream, java.io.Flushable
    public void flush() throws IOException {
        this.out.flush();
    }

    @Override // java.io.OutputStream
    public void write(byte[] b, int off, int len) throws IOException {
        if (this.closed) {
            throw new IOException("Attempted write to closed stream.");
        }
        if (this.total < this.contentLength) {
            long max = this.contentLength - this.total;
            int chunk = len;
            if (chunk > max) {
                chunk = (int) max;
            }
            this.out.write(b, off, chunk);
            this.total += chunk;
        }
    }

    @Override // java.io.OutputStream
    public void write(byte[] b) throws IOException {
        write(b, 0, b.length);
    }

    @Override // java.io.OutputStream
    public void write(int b) throws IOException {
        if (this.closed) {
            throw new IOException("Attempted write to closed stream.");
        }
        if (this.total < this.contentLength) {
            this.out.write(b);
            this.total++;
        }
    }
}
