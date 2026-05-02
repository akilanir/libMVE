package org.tukaani.xz;

import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import org.tukaani.xz.check.Check;
import org.tukaani.xz.common.DecoderUtil;
import org.tukaani.xz.common.StreamFlags;
import org.tukaani.xz.index.IndexHash;

/* loaded from: xz-1.5.jar:org/tukaani/xz/SingleXZInputStream.class */
public class SingleXZInputStream extends InputStream {
    private InputStream in;
    private int memoryLimit;
    private StreamFlags streamHeaderFlags;
    private Check check;
    private BlockInputStream blockDecoder;
    private final IndexHash indexHash;
    private boolean endReached;
    private IOException exception;
    private final byte[] tempBuf;

    public SingleXZInputStream(InputStream inputStream) throws IOException {
        this.blockDecoder = null;
        this.indexHash = new IndexHash();
        this.endReached = false;
        this.exception = null;
        this.tempBuf = new byte[1];
        initialize(inputStream, -1);
    }

    public SingleXZInputStream(InputStream inputStream, int i) throws IOException {
        this.blockDecoder = null;
        this.indexHash = new IndexHash();
        this.endReached = false;
        this.exception = null;
        this.tempBuf = new byte[1];
        initialize(inputStream, i);
    }

    SingleXZInputStream(InputStream inputStream, int i, byte[] bArr) throws IOException {
        this.blockDecoder = null;
        this.indexHash = new IndexHash();
        this.endReached = false;
        this.exception = null;
        this.tempBuf = new byte[1];
        initialize(inputStream, i, bArr);
    }

    private void initialize(InputStream inputStream, int i) throws IOException {
        byte[] bArr = new byte[12];
        new DataInputStream(inputStream).readFully(bArr);
        initialize(inputStream, i, bArr);
    }

    private void initialize(InputStream inputStream, int i, byte[] bArr) throws IOException {
        this.in = inputStream;
        this.memoryLimit = i;
        this.streamHeaderFlags = DecoderUtil.decodeStreamHeader(bArr);
        this.check = Check.getInstance(this.streamHeaderFlags.checkType);
    }

    public int getCheckType() {
        return this.streamHeaderFlags.checkType;
    }

    public String getCheckName() {
        return this.check.getName();
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
                if (this.blockDecoder == null) {
                    try {
                        this.blockDecoder = new BlockInputStream(this.in, this.check, this.memoryLimit, -1L, -1L);
                    } catch (IndexIndicatorException e) {
                        this.indexHash.validate(this.in);
                        validateStreamFooter();
                        this.endReached = true;
                        if (i3 > 0) {
                            return i3;
                        }
                        return -1;
                    }
                }
                int read = this.blockDecoder.read(bArr, i, i2);
                if (read > 0) {
                    i3 += read;
                    i += read;
                    i2 -= read;
                } else if (read == -1) {
                    this.indexHash.add(this.blockDecoder.getUnpaddedSize(), this.blockDecoder.getUncompressedSize());
                    this.blockDecoder = null;
                }
            } catch (IOException e2) {
                this.exception = e2;
                if (i3 == 0) {
                    throw e2;
                }
            }
        }
        return i3;
    }

    private void validateStreamFooter() throws IOException {
        byte[] bArr = new byte[12];
        new DataInputStream(this.in).readFully(bArr);
        StreamFlags decodeStreamFooter = DecoderUtil.decodeStreamFooter(bArr);
        if (!DecoderUtil.areStreamFlagsEqual(this.streamHeaderFlags, decodeStreamFooter) || this.indexHash.getIndexSize() != decodeStreamFooter.backwardSize) {
            throw new CorruptedInputException("XZ Stream Footer does not match Stream Header");
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
        if (this.blockDecoder == null) {
            return 0;
        }
        return this.blockDecoder.available();
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
