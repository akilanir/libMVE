package org.tukaani.xz;

import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: xz-1.5.jar:org/tukaani/xz/XZInputStream.class */
public class XZInputStream extends InputStream {
    private final int memoryLimit;
    private InputStream in;
    private SingleXZInputStream xzIn;
    private boolean endReached;
    private IOException exception;
    private final byte[] tempBuf;

    public XZInputStream(InputStream inputStream) throws IOException {
        this(inputStream, -1);
    }

    public XZInputStream(InputStream inputStream, int i) throws IOException {
        this.endReached = false;
        this.exception = null;
        this.tempBuf = new byte[1];
        this.in = inputStream;
        this.memoryLimit = i;
        this.xzIn = new SingleXZInputStream(inputStream, i);
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
        if (this.endReached) {
            return -1;
        }
        int i3 = 0;
        while (i2 > 0) {
            try {
                if (this.xzIn == null) {
                    prepareNextStream();
                    if (this.endReached) {
                        if (i3 == 0) {
                            return -1;
                        }
                        return i3;
                    }
                }
                int read = this.xzIn.read(bArr, i, i2);
                if (read > 0) {
                    i3 += read;
                    i += read;
                    i2 -= read;
                } else if (read == -1) {
                    this.xzIn = null;
                }
            } catch (IOException e) {
                this.exception = e;
                if (i3 == 0) {
                    throw e;
                }
            }
        }
        return i3;
    }

    private void prepareNextStream() throws IOException {
        DataInputStream dataInputStream = new DataInputStream(this.in);
        byte[] bArr = new byte[12];
        while (dataInputStream.read(bArr, 0, 1) != -1) {
            dataInputStream.readFully(bArr, 1, 3);
            if (bArr[0] != 0 || bArr[1] != 0 || bArr[2] != 0 || bArr[3] != 0) {
                dataInputStream.readFully(bArr, 4, 8);
                try {
                    this.xzIn = new SingleXZInputStream(this.in, this.memoryLimit, bArr);
                    return;
                } catch (XZFormatException e) {
                    throw new CorruptedInputException("Garbage after a valid XZ Stream");
                }
            }
        }
        this.endReached = true;
    }

    @Override // java.io.InputStream
    public int available() throws IOException {
        if (this.in == null) {
            throw new XZIOException("Stream closed");
        }
        if (this.exception != null) {
            throw this.exception;
        }
        if (this.xzIn == null) {
            return 0;
        }
        return this.xzIn.available();
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
