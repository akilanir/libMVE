package org.tukaani.xz;

import java.io.IOException;
import org.tukaani.xz.simple.SimpleFilter;

/* loaded from: xz-1.5.jar:org/tukaani/xz/SimpleOutputStream.class */
class SimpleOutputStream extends FinishableOutputStream {
    private static final int FILTER_BUF_SIZE = 4096;
    private FinishableOutputStream out;
    private final SimpleFilter simpleFilter;
    private final byte[] filterBuf = new byte[4096];
    private int pos = 0;
    private int unfiltered = 0;
    private IOException exception = null;
    private boolean finished = false;
    private final byte[] tempBuf = new byte[1];
    static final boolean $assertionsDisabled;
    static Class class$org$tukaani$xz$SimpleOutputStream;

    static int getMemoryUsage() {
        return 5;
    }

    SimpleOutputStream(FinishableOutputStream finishableOutputStream, SimpleFilter simpleFilter) {
        if (finishableOutputStream == null) {
            throw new NullPointerException();
        }
        this.out = finishableOutputStream;
        this.simpleFilter = simpleFilter;
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
            throw new XZIOException("Stream finished or closed");
        }
        while (i2 > 0) {
            int min = Math.min(i2, 4096 - (this.pos + this.unfiltered));
            System.arraycopy(bArr, i, this.filterBuf, this.pos + this.unfiltered, min);
            i += min;
            i2 -= min;
            this.unfiltered += min;
            int code = this.simpleFilter.code(this.filterBuf, this.pos, this.unfiltered);
            if (!$assertionsDisabled && code > this.unfiltered) {
                throw new AssertionError();
            }
            this.unfiltered -= code;
            try {
                this.out.write(this.filterBuf, this.pos, code);
                this.pos += code;
                if (this.pos + this.unfiltered == 4096) {
                    System.arraycopy(this.filterBuf, this.pos, this.filterBuf, 0, this.unfiltered);
                    this.pos = 0;
                }
            } catch (IOException e) {
                this.exception = e;
                throw e;
            }
        }
    }

    private void writePending() throws IOException {
        if (!$assertionsDisabled && this.finished) {
            throw new AssertionError();
        }
        if (this.exception != null) {
            throw this.exception;
        }
        try {
            this.out.write(this.filterBuf, this.pos, this.unfiltered);
            this.finished = true;
        } catch (IOException e) {
            this.exception = e;
            throw e;
        }
    }

    @Override // java.io.OutputStream, java.io.Flushable
    public void flush() throws IOException {
        throw new UnsupportedOptionsException("Flushing is not supported");
    }

    @Override // org.tukaani.xz.FinishableOutputStream
    public void finish() throws IOException {
        if (this.finished) {
            return;
        }
        writePending();
        try {
            this.out.finish();
        } catch (IOException e) {
            this.exception = e;
            throw e;
        }
    }

    @Override // java.io.OutputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (this.out != null) {
            if (!this.finished) {
                try {
                    writePending();
                } catch (IOException e) {
                }
            }
            try {
                this.out.close();
            } catch (IOException e2) {
                if (this.exception == null) {
                    this.exception = e2;
                }
            }
            this.out = null;
        }
        if (this.exception != null) {
            throw this.exception;
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
        if (class$org$tukaani$xz$SimpleOutputStream == null) {
            cls = class$("org.tukaani.xz.SimpleOutputStream");
            class$org$tukaani$xz$SimpleOutputStream = cls;
        } else {
            cls = class$org$tukaani$xz$SimpleOutputStream;
        }
        $assertionsDisabled = !cls.desiredAssertionStatus();
    }
}
