package cz.msebera.android.httpclient.impl.auth;

import java.io.IOException;
import java.io.OutputStream;
import java.security.MessageDigest;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/auth/HttpEntityDigester.class */
class HttpEntityDigester extends OutputStream {
    private final MessageDigest digester;
    private boolean closed;
    private byte[] digest;

    HttpEntityDigester(MessageDigest digester) {
        this.digester = digester;
        this.digester.reset();
    }

    @Override // java.io.OutputStream
    public void write(int b) throws IOException {
        if (this.closed) {
            throw new IOException("Stream has been already closed");
        }
        this.digester.update((byte) b);
    }

    @Override // java.io.OutputStream
    public void write(byte[] b, int off, int len) throws IOException {
        if (this.closed) {
            throw new IOException("Stream has been already closed");
        }
        this.digester.update(b, off, len);
    }

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (this.closed) {
            return;
        }
        this.closed = true;
        this.digest = this.digester.digest();
        super.close();
    }

    public byte[] getDigest() {
        return this.digest;
    }
}
