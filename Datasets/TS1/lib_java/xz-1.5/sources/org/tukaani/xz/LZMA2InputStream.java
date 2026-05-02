package org.tukaani.xz;

import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import org.tukaani.xz.common.Util;
import org.tukaani.xz.lz.LZDecoder;
import org.tukaani.xz.lzma.LZMADecoder;
import org.tukaani.xz.rangecoder.RangeDecoderFromBuffer;

/* loaded from: xz-1.5.jar:org/tukaani/xz/LZMA2InputStream.class */
public class LZMA2InputStream extends InputStream {
    public static final int DICT_SIZE_MIN = 4096;
    public static final int DICT_SIZE_MAX = 2147483632;
    private static final int COMPRESSED_SIZE_MAX = 65536;
    private DataInputStream in;
    private final LZDecoder lz;
    private final RangeDecoderFromBuffer rc;
    private LZMADecoder lzma;
    private int uncompressedSize;
    private boolean isLZMAChunk;
    private boolean needDictReset;
    private boolean needProps;
    private boolean endReached;
    private IOException exception;
    private final byte[] tempBuf;

    public static int getMemoryUsage(int i) {
        return 104 + (getDictSize(i) / Util.BLOCK_HEADER_SIZE_MAX);
    }

    private static int getDictSize(int i) {
        if (i < 4096 || i > 2147483632) {
            throw new IllegalArgumentException(new StringBuffer().append("Unsupported dictionary size ").append(i).toString());
        }
        return (i + 15) & (-16);
    }

    public LZMA2InputStream(InputStream inputStream, int i) {
        this(inputStream, i, null);
    }

    public LZMA2InputStream(InputStream inputStream, int i, byte[] bArr) {
        this.rc = new RangeDecoderFromBuffer(COMPRESSED_SIZE_MAX);
        this.uncompressedSize = 0;
        this.needDictReset = true;
        this.needProps = true;
        this.endReached = false;
        this.exception = null;
        this.tempBuf = new byte[1];
        if (inputStream == null) {
            throw new NullPointerException();
        }
        this.in = new DataInputStream(inputStream);
        this.lz = new LZDecoder(getDictSize(i), bArr);
        if (bArr == null || bArr.length <= 0) {
            return;
        }
        this.needDictReset = false;
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
                if (this.uncompressedSize == 0) {
                    decodeChunkHeader();
                    if (this.endReached) {
                        if (i3 == 0) {
                            return -1;
                        }
                        return i3;
                    }
                }
                int min = Math.min(this.uncompressedSize, i2);
                if (this.isLZMAChunk) {
                    this.lz.setLimit(min);
                    this.lzma.decode();
                    if (!this.rc.isInBufferOK()) {
                        throw new CorruptedInputException();
                    }
                } else {
                    this.lz.copyUncompressed(this.in, min);
                }
                int flush = this.lz.flush(bArr, i);
                i += flush;
                i2 -= flush;
                i3 += flush;
                this.uncompressedSize -= flush;
                if (this.uncompressedSize == 0 && (!this.rc.isFinished() || this.lz.hasPending())) {
                    throw new CorruptedInputException();
                }
            } catch (IOException e) {
                this.exception = e;
                throw e;
            }
        }
        return i3;
    }

    private void decodeChunkHeader() throws IOException {
        int readUnsignedByte = this.in.readUnsignedByte();
        if (readUnsignedByte == 0) {
            this.endReached = true;
            return;
        }
        if (readUnsignedByte >= 224 || readUnsignedByte == 1) {
            this.needProps = true;
            this.needDictReset = false;
            this.lz.reset();
        } else if (this.needDictReset) {
            throw new CorruptedInputException();
        }
        if (readUnsignedByte < 128) {
            if (readUnsignedByte > 2) {
                throw new CorruptedInputException();
            }
            this.isLZMAChunk = false;
            this.uncompressedSize = this.in.readUnsignedShort() + 1;
            return;
        }
        this.isLZMAChunk = true;
        this.uncompressedSize = (readUnsignedByte & 31) << 16;
        this.uncompressedSize += this.in.readUnsignedShort() + 1;
        int readUnsignedShort = this.in.readUnsignedShort() + 1;
        if (readUnsignedByte >= 192) {
            this.needProps = false;
            decodeProps();
        } else {
            if (this.needProps) {
                throw new CorruptedInputException();
            }
            if (readUnsignedByte >= 160) {
                this.lzma.reset();
            }
        }
        this.rc.prepareInputBuffer(this.in, readUnsignedShort);
    }

    private void decodeProps() throws IOException {
        int readUnsignedByte = this.in.readUnsignedByte();
        if (readUnsignedByte > 224) {
            throw new CorruptedInputException();
        }
        int i = readUnsignedByte / 45;
        int i2 = readUnsignedByte - ((i * 9) * 5);
        int i3 = i2 / 9;
        int i4 = i2 - (i3 * 9);
        if (i4 + i3 > 4) {
            throw new CorruptedInputException();
        }
        this.lzma = new LZMADecoder(this.lz, this.rc, i4, i3, i);
    }

    @Override // java.io.InputStream
    public int available() throws IOException {
        if (this.in == null) {
            throw new XZIOException("Stream closed");
        }
        if (this.exception != null) {
            throw this.exception;
        }
        return this.uncompressedSize;
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
