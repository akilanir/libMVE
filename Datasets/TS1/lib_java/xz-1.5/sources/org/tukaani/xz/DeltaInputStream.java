package org.tukaani.xz;

import java.io.IOException;
import java.io.InputStream;

/* loaded from: xz-1.5.jar:org/tukaani/xz/DeltaInputStream.class */
public class DeltaInputStream extends InputStream {
    public static final int DISTANCE_MIN = 1;
    public static final int DISTANCE_MAX = 256;
    private InputStream in;
    private final org.tukaani.xz.delta.DeltaDecoder delta;
    private IOException exception = null;
    private final byte[] tempBuf = new byte[1];

    public DeltaInputStream(InputStream inputStream, int i) {
        if (inputStream == null) {
            throw new NullPointerException();
        }
        this.in = inputStream;
        this.delta = new org.tukaani.xz.delta.DeltaDecoder(i);
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        if (read(this.tempBuf, 0, 1) == -1) {
            return -1;
        }
        return this.tempBuf[0] & 255;
    }

    @Override // java.io.InputStream
    public int read(byte[] bArr, int i, int i2) throws IOException {
        if (i2 == 0) {
            return 0;
        }
        if (this.in == null) {
            throw new XZIOException("Stream closed");
        }
        if (this.exception != null) {
            throw this.exception;
        }
        try {
            int read = this.in.read(bArr, i, i2);
            if (read == -1) {
                return -1;
            }
            this.delta.decode(bArr, i, read);
            return read;
        } catch (IOException e) {
            this.exception = e;
            throw e;
        }
    }

    @Override // java.io.InputStream
    public int available() throws IOException {
        if (this.in == null) {
            throw new XZIOException("Stream closed");
        }
        if (this.exception != null) {
            throw this.exception;
        }
        return this.in.available();
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (this.in != null) {
            try {
                this.in.close();
                this.in = null;
            } catch (Throwable th) {
                this.in = null;
                throw th;
            }
        }
    }
}
