package com.bumptech.glide.load.resource.bitmap;

import android.util.Log;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream.class */
public class RecyclableBufferedInputStream extends FilterInputStream {
    private static final String TAG = "BufferedIs";
    private volatile byte[] buf;
    private int count;
    private int marklimit;
    private int markpos;
    private int pos;

    public RecyclableBufferedInputStream(InputStream in, byte[] buffer) {
        super(in);
        this.markpos = -1;
        if (buffer == null || buffer.length == 0) {
            throw new IllegalArgumentException("buffer is null or empty");
        }
        this.buf = buffer;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public synchronized int available() throws IOException {
        InputStream localIn = this.in;
        if (this.buf == null || localIn == null) {
            throw streamClosed();
        }
        return (this.count - this.pos) + localIn.available();
    }

    private static IOException streamClosed() throws IOException {
        throw new IOException("BufferedInputStream is closed");
    }

    public synchronized void fixMarkLimit() {
        this.marklimit = this.buf.length;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.buf = null;
        InputStream localIn = this.in;
        this.in = null;
        if (localIn != null) {
            localIn.close();
        }
    }

    private int fillbuf(InputStream localIn, byte[] localBuf) throws IOException {
        if (this.markpos == -1 || this.pos - this.markpos >= this.marklimit) {
            int result = localIn.read(localBuf);
            if (result > 0) {
                this.markpos = -1;
                this.pos = 0;
                this.count = result;
            }
            return result;
        }
        if (this.markpos == 0 && this.marklimit > localBuf.length && this.count == localBuf.length) {
            int newLength = localBuf.length * 2;
            if (newLength > this.marklimit) {
                newLength = this.marklimit;
            }
            if (Log.isLoggable(TAG, 3)) {
                Log.d(TAG, "allocate buffer of length: " + newLength);
            }
            byte[] newbuf = new byte[newLength];
            System.arraycopy(localBuf, 0, newbuf, 0, localBuf.length);
            this.buf = newbuf;
            localBuf = newbuf;
        } else if (this.markpos > 0) {
            System.arraycopy(localBuf, this.markpos, localBuf, 0, localBuf.length - this.markpos);
        }
        this.pos -= this.markpos;
        this.markpos = 0;
        this.count = 0;
        int bytesread = localIn.read(localBuf, this.pos, localBuf.length - this.pos);
        this.count = bytesread <= 0 ? this.pos : this.pos + bytesread;
        return bytesread;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public synchronized void mark(int readlimit) {
        this.marklimit = Math.max(this.marklimit, readlimit);
        this.markpos = this.pos;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public boolean markSupported() {
        return true;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public synchronized int read() throws IOException {
        byte[] localBuf = this.buf;
        InputStream localIn = this.in;
        if (localBuf == null || localIn == null) {
            throw streamClosed();
        }
        if (this.pos >= this.count && fillbuf(localIn, localBuf) == -1) {
            return -1;
        }
        if (localBuf != this.buf) {
            localBuf = this.buf;
            if (localBuf == null) {
                throw streamClosed();
            }
        }
        if (this.count - this.pos > 0) {
            int i = this.pos;
            this.pos = i + 1;
            return localBuf[i] & 255;
        }
        return -1;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public synchronized int read(byte[] buffer, int offset, int byteCount) throws IOException {
        int required;
        int read;
        byte[] localBuf = this.buf;
        if (localBuf == null) {
            throw streamClosed();
        }
        if (byteCount == 0) {
            return 0;
        }
        InputStream localIn = this.in;
        if (localIn == null) {
            throw streamClosed();
        }
        if (this.pos < this.count) {
            int copylength = this.count - this.pos >= byteCount ? byteCount : this.count - this.pos;
            System.arraycopy(localBuf, this.pos, buffer, offset, copylength);
            this.pos += copylength;
            if (copylength == byteCount || localIn.available() == 0) {
                return copylength;
            }
            offset += copylength;
            required = byteCount - copylength;
        } else {
            required = byteCount;
        }
        while (true) {
            if (this.markpos == -1 && required >= localBuf.length) {
                read = localIn.read(buffer, offset, required);
                if (read == -1) {
                    if (required == byteCount) {
                        return -1;
                    }
                    return byteCount - required;
                }
            } else {
                if (fillbuf(localIn, localBuf) == -1) {
                    if (required == byteCount) {
                        return -1;
                    }
                    return byteCount - required;
                }
                if (localBuf != this.buf) {
                    localBuf = this.buf;
                    if (localBuf == null) {
                        throw streamClosed();
                    }
                }
                read = this.count - this.pos >= required ? required : this.count - this.pos;
                System.arraycopy(localBuf, this.pos, buffer, offset, read);
                this.pos += read;
            }
            required -= read;
            if (required == 0) {
                return byteCount;
            }
            if (localIn.available() == 0) {
                return byteCount - required;
            }
            offset += read;
        }
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public synchronized void reset() throws IOException {
        if (this.buf == null) {
            throw new IOException("Stream is closed");
        }
        if (-1 == this.markpos) {
            throw new InvalidMarkException("Mark has been invalidated");
        }
        this.pos = this.markpos;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public synchronized long skip(long byteCount) throws IOException {
        byte[] localBuf = this.buf;
        InputStream localIn = this.in;
        if (localBuf == null) {
            throw streamClosed();
        }
        if (byteCount < 1) {
            return 0L;
        }
        if (localIn == null) {
            throw streamClosed();
        }
        if (this.count - this.pos >= byteCount) {
            this.pos = (int) (this.pos + byteCount);
            return byteCount;
        }
        long read = this.count - this.pos;
        this.pos = this.count;
        if (this.markpos != -1 && byteCount <= this.marklimit) {
            if (fillbuf(localIn, localBuf) == -1) {
                return read;
            }
            if (this.count - this.pos >= byteCount - read) {
                this.pos = (int) (this.pos + (byteCount - read));
                return byteCount;
            }
            long read2 = (read + this.count) - this.pos;
            this.pos = this.count;
            return read2;
        }
        return read + localIn.skip(byteCount - read);
    }

    /* loaded from: glide-3.5.2.jar:com/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream$InvalidMarkException.class */
    public static class InvalidMarkException extends RuntimeException {
        private static final long serialVersionUID = -4338378848813561757L;

        public InvalidMarkException(String detailMessage) {
            super(detailMessage);
        }
    }
}
