package org.tukaani.xz;

import java.io.IOException;
import java.io.InputStream;
import org.tukaani.xz.simple.SimpleFilter;

/* loaded from: xz-1.5.jar:org/tukaani/xz/SimpleInputStream.class */
class SimpleInputStream extends InputStream {
    private static final int FILTER_BUF_SIZE = 4096;
    private InputStream in;
    private final SimpleFilter simpleFilter;
    private final byte[] filterBuf = new byte[4096];
    private int pos = 0;
    private int filtered = 0;
    private int unfiltered = 0;
    private boolean endReached = false;
    private IOException exception = null;
    private final byte[] tempBuf = new byte[1];
    static final boolean $assertionsDisabled;
    static Class class$org$tukaani$xz$SimpleInputStream;

    static int getMemoryUsage() {
        return 5;
    }

    SimpleInputStream(InputStream inputStream, SimpleFilter simpleFilter) {
        if (inputStream == null) {
            throw new NullPointerException();
        }
        if (!$assertionsDisabled && simpleFilter == null) {
            throw new AssertionError();
        }
        this.in = inputStream;
        this.simpleFilter = simpleFilter;
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
        if (i < 0 || i2 < 0 || i + i2 < 0 || i + i2 > bArr.length) {
            throw new IndexOutOfBoundsException();
        }
        if (i2 == 0) {
            return 0;
        }
        if (this.in == null) {
            throw new XZIOException("Stream closed");
        }
        if (this.exception != null) {
            throw this.exception;
        }
        int i3 = 0;
        while (true) {
            try {
                int min = Math.min(this.filtered, i2);
                System.arraycopy(this.filterBuf, this.pos, bArr, i, min);
                this.pos += min;
                this.filtered -= min;
                i += min;
                i2 -= min;
                i3 += min;
                if (this.pos + this.filtered + this.unfiltered == 4096) {
                    System.arraycopy(this.filterBuf, this.pos, this.filterBuf, 0, this.filtered + this.unfiltered);
                    this.pos = 0;
                }
                if (i2 == 0 || this.endReached) {
                    break;
                }
                if (!$assertionsDisabled && this.filtered != 0) {
                    throw new AssertionError();
                }
                int read = this.in.read(this.filterBuf, this.pos + this.filtered + this.unfiltered, 4096 - ((this.pos + this.filtered) + this.unfiltered));
                if (read == -1) {
                    this.endReached = true;
                    this.filtered = this.unfiltered;
                    this.unfiltered = 0;
                } else {
                    this.unfiltered += read;
                    this.filtered = this.simpleFilter.code(this.filterBuf, this.pos, this.unfiltered);
                    if (!$assertionsDisabled && this.filtered > this.unfiltered) {
                        throw new AssertionError();
                    }
                    this.unfiltered -= this.filtered;
                }
            } catch (IOException e) {
                this.exception = e;
                throw e;
            }
        }
        if (i3 > 0) {
            return i3;
        }
        return -1;
    }

    @Override // java.io.InputStream
    public int available() throws IOException {
        if (this.in == null) {
            throw new XZIOException("Stream closed");
        }
        if (this.exception != null) {
            throw this.exception;
        }
        return this.filtered;
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

    static Class class$(String str) {
        try {
            return Class.forName(str);
        } catch (ClassNotFoundException e) {
            throw new NoClassDefFoundError().initCause(e);
        }
    }

    static {
        Class cls;
        if (class$org$tukaani$xz$SimpleInputStream == null) {
            cls = class$("org.tukaani.xz.SimpleInputStream");
            class$org$tukaani$xz$SimpleInputStream = cls;
        } else {
            cls = class$org$tukaani$xz$SimpleInputStream;
        }
        $assertionsDisabled = !cls.desiredAssertionStatus();
    }
}
