package cz.msebera.android.httpclient.client.entity;

import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import java.io.IOException;
import java.io.InputStream;

@NotThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/entity/LazyDecompressingInputStream.class */
class LazyDecompressingInputStream extends InputStream {
    private final InputStream wrappedStream;
    private final DecompressingEntity decompressingEntity;
    private InputStream wrapperStream;

    public LazyDecompressingInputStream(InputStream wrappedStream, DecompressingEntity decompressingEntity) {
        this.wrappedStream = wrappedStream;
        this.decompressingEntity = decompressingEntity;
    }

    private void initWrapper() throws IOException {
        if (this.wrapperStream == null) {
            this.wrapperStream = this.decompressingEntity.decorate(this.wrappedStream);
        }
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        initWrapper();
        return this.wrapperStream.read();
    }

    @Override // java.io.InputStream
    public int read(byte[] b) throws IOException {
        initWrapper();
        return this.wrapperStream.read(b);
    }

    @Override // java.io.InputStream
    public int read(byte[] b, int off, int len) throws IOException {
        initWrapper();
        return this.wrapperStream.read(b, off, len);
    }

    @Override // java.io.InputStream
    public long skip(long n) throws IOException {
        initWrapper();
        return this.wrapperStream.skip(n);
    }

    @Override // java.io.InputStream
    public boolean markSupported() {
        return false;
    }

    @Override // java.io.InputStream
    public int available() throws IOException {
        initWrapper();
        return this.wrapperStream.available();
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        try {
            if (this.wrapperStream != null) {
                this.wrapperStream.close();
            }
        } finally {
            this.wrappedStream.close();
        }
    }
}
