package org.tukaani.xz;

import java.io.IOException;

/* loaded from: xz-1.5.jar:org/tukaani/xz/DeltaOutputStream.class */
class DeltaOutputStream extends FinishableOutputStream {
    private static final int FILTER_BUF_SIZE = 4096;
    private FinishableOutputStream out;
    private final org.tukaani.xz.delta.DeltaEncoder delta;
    private final byte[] filterBuf = new byte[4096];
    private boolean finished = false;
    private IOException exception = null;
    private final byte[] tempBuf = new byte[1];

    static int getMemoryUsage() {
        return 5;
    }

    DeltaOutputStream(FinishableOutputStream finishableOutputStream, DeltaOptions deltaOptions) {
        this.out = finishableOutputStream;
        this.delta = new org.tukaani.xz.delta.DeltaEncoder(deltaOptions.getDistance());
    }

    @Override // java.io.OutputStream
    public void write(int i) throws IOException {
        this.tempBuf[0] = (byte) i;
        write(this.tempBuf, 0, 1);
    }

    @Override // java.io.OutputStream
    public void write(byte[] bArr, int i, int i2) throws IOException {
        if (i < 0 || i2 < 0 || i + i2 < 0 || i + i2 > bArr.length) {
            throw new IndexOutOfBoundsException();
        }
        if (this.exception != null) {
            throw this.exception;
        }
        if (this.finished) {
            throw new XZIOException("Stream finished");
        }
        while (i2 > 4096) {
            try {
                this.delta.encode(bArr, i, 4096, this.filterBuf);
                this.out.write(this.filterBuf);
                i += 4096;
                i2 -= 4096;
            } catch (IOException e) {
                this.exception = e;
                throw e;
            }
        }
        this.delta.encode(bArr, i, i2, this.filterBuf);
        this.out.write(this.filterBuf, 0, i2);
    }

    @Override // java.io.OutputStream, java.io.Flushable
    public void flush() throws IOException {
        if (this.exception != null) {
            throw this.exception;
        }
        if (this.finished) {
            throw new XZIOException("Stream finished or closed");
        }
        try {
            this.out.flush();
        } catch (IOException e) {
            this.exception = e;
            throw e;
        }
    }

    @Override // org.tukaani.xz.FinishableOutputStream
    public void finish() throws IOException {
        if (this.finished) {
            return;
        }
        if (this.exception != null) {
            throw this.exception;
        }
        try {
            this.out.finish();
            this.finished = true;
        } catch (IOException e) {
            this.exception = e;
            throw e;
        }
    }

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (this.out != null) {
            try {
                this.out.close();
            } catch (IOException e) {
                if (this.exception == null) {
                    this.exception = e;
                }
            }
            this.out = null;
        }
        if (this.exception != null) {
            throw this.exception;
        }
    }
}
