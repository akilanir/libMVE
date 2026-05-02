package cz.msebera.android.httpclient.impl.io;

import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.io.BufferInfo;
import cz.msebera.android.httpclient.io.SessionInputBuffer;
import cz.msebera.android.httpclient.util.Args;
import java.io.IOException;
import java.io.InputStream;

@NotThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/io/IdentityInputStream.class */
public class IdentityInputStream extends InputStream {
    private final SessionInputBuffer in;
    private boolean closed = false;

    public IdentityInputStream(SessionInputBuffer in) {
        this.in = (SessionInputBuffer) Args.notNull(in, "Session input buffer");
    }

    @Override // java.io.InputStream
    public int available() throws IOException {
        if (this.in instanceof BufferInfo) {
            return ((BufferInfo) this.in).length();
        }
        return 0;
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.closed = true;
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        if (this.closed) {
            return -1;
        }
        return this.in.read();
    }

    @Override // java.io.InputStream
    public int read(byte[] b, int off, int len) throws IOException {
        if (this.closed) {
            return -1;
        }
        return this.in.read(b, off, len);
    }
}
