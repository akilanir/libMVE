package com.fasterxml.jackson.core.io;

import java.io.IOException;
import java.io.InputStream;

/* loaded from: jackson-core-2.3.3.jar:com/fasterxml/jackson/core/io/MergedStream.class */
public final class MergedStream extends InputStream {
    protected final IOContext _context;
    final InputStream _in;
    byte[] _buffer;
    int _ptr;
    final int _end;

    public MergedStream(IOContext iOContext, InputStream inputStream, byte[] bArr, int i, int i2) {
        this._context = iOContext;
        this._in = inputStream;
        this._buffer = bArr;
        this._ptr = i;
        this._end = i2;
    }

    @Override // java.io.InputStream
    public int available() throws IOException {
        if (this._buffer != null) {
            return this._end - this._ptr;
        }
        return this._in.available();
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        freeMergedBuffer();
        this._in.close();
    }

    @Override // java.io.InputStream
    public void mark(int i) {
        if (this._buffer == null) {
            this._in.mark(i);
        }
    }

    @Override // java.io.InputStream
    public boolean markSupported() {
        return this._buffer == null && this._in.markSupported();
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        if (this._buffer != null) {
            byte[] bArr = this._buffer;
            int i = this._ptr;
            this._ptr = i + 1;
            int i2 = bArr[i] & 255;
            if (this._ptr >= this._end) {
                freeMergedBuffer();
            }
            return i2;
        }
        return this._in.read();
    }

    @Override // java.io.InputStream
    public int read(byte[] bArr) throws IOException {
        return read(bArr, 0, bArr.length);
    }

    @Override // java.io.InputStream
    public int read(byte[] bArr, int i, int i2) throws IOException {
        if (this._buffer != null) {
            int i3 = this._end - this._ptr;
            if (i2 > i3) {
                i2 = i3;
            }
            System.arraycopy(this._buffer, this._ptr, bArr, i, i2);
            this._ptr += i2;
            if (this._ptr >= this._end) {
                freeMergedBuffer();
            }
            return i2;
        }
        return this._in.read(bArr, i, i2);
    }

    @Override // java.io.InputStream
    public void reset() throws IOException {
        if (this._buffer == null) {
            this._in.reset();
        }
    }

    @Override // java.io.InputStream
    public long skip(long j) throws IOException {
        long j2 = 0;
        if (this._buffer != null) {
            int i = this._end - this._ptr;
            if (i > j) {
                this._ptr += (int) j;
                return j;
            }
            freeMergedBuffer();
            j2 = 0 + i;
            j -= i;
        }
        if (j > 0) {
            j2 += this._in.skip(j);
        }
        return j2;
    }

    private void freeMergedBuffer() {
        byte[] bArr = this._buffer;
        if (bArr != null) {
            this._buffer = null;
            if (this._context != null) {
                this._context.releaseReadIOBuffer(bArr);
            }
        }
    }
}
