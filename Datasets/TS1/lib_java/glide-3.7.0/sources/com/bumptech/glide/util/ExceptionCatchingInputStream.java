package com.bumptech.glide.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Queue;

/* loaded from: glide-3.7.0.jar:com/bumptech/glide/util/ExceptionCatchingInputStream.class */
public class ExceptionCatchingInputStream extends InputStream {
    private static final Queue<ExceptionCatchingInputStream> QUEUE = Util.createQueue(0);
    private InputStream wrapped;
    private IOException exception;

    public static ExceptionCatchingInputStream obtain(InputStream toWrap) {
        ExceptionCatchingInputStream result;
        synchronized (QUEUE) {
            result = QUEUE.poll();
        }
        if (result == null) {
            result = new ExceptionCatchingInputStream();
        }
        result.setInputStream(toWrap);
        return result;
    }

    static void clearQueue() {
        while (!QUEUE.isEmpty()) {
            QUEUE.remove();
        }
    }

    ExceptionCatchingInputStream() {
    }

    void setInputStream(InputStream toWrap) {
        this.wrapped = toWrap;
    }

    @Override // java.io.InputStream
    public int available() throws IOException {
        return this.wrapped.available();
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.wrapped.close();
    }

    @Override // java.io.InputStream
    public void mark(int readlimit) {
        this.wrapped.mark(readlimit);
    }

    @Override // java.io.InputStream
    public boolean markSupported() {
        return this.wrapped.markSupported();
    }

    @Override // java.io.InputStream
    public int read(byte[] buffer) throws IOException {
        int read;
        try {
            read = this.wrapped.read(buffer);
        } catch (IOException e) {
            this.exception = e;
            read = -1;
        }
        return read;
    }

    @Override // java.io.InputStream
    public int read(byte[] buffer, int byteOffset, int byteCount) throws IOException {
        int read;
        try {
            read = this.wrapped.read(buffer, byteOffset, byteCount);
        } catch (IOException e) {
            this.exception = e;
            read = -1;
        }
        return read;
    }

    @Override // java.io.InputStream
    public synchronized void reset() throws IOException {
        this.wrapped.reset();
    }

    @Override // java.io.InputStream
    public long skip(long byteCount) throws IOException {
        long skipped;
        try {
            skipped = this.wrapped.skip(byteCount);
        } catch (IOException e) {
            this.exception = e;
            skipped = 0;
        }
        return skipped;
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        int result;
        try {
            result = this.wrapped.read();
        } catch (IOException e) {
            this.exception = e;
            result = -1;
        }
        return result;
    }

    public IOException getException() {
        return this.exception;
    }

    public void release() {
        this.exception = null;
        this.wrapped = null;
        synchronized (QUEUE) {
            QUEUE.offer(this);
        }
    }
}
