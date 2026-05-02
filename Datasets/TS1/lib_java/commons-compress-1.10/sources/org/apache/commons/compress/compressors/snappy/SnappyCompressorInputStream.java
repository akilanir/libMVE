package org.apache.commons.compress.compressors.snappy;

import java.io.IOException;
import java.io.InputStream;
import org.apache.commons.compress.archivers.cpio.CpioConstants;
import org.apache.commons.compress.compressors.CompressorInputStream;
import org.apache.commons.compress.utils.IOUtils;

/* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream.class */
public class SnappyCompressorInputStream extends CompressorInputStream {
    private static final int TAG_MASK = 3;
    public static final int DEFAULT_BLOCK_SIZE = 32768;
    private final byte[] decompressBuf;
    private int writeIndex;
    private int readIndex;
    private final int blockSize;
    private final InputStream in;
    private final int size;
    private int uncompressedBytesRemaining;
    private final byte[] oneByte;
    private boolean endReached;

    public SnappyCompressorInputStream(InputStream is) throws IOException {
        this(is, 32768);
    }

    public SnappyCompressorInputStream(InputStream is, int blockSize) throws IOException {
        this.oneByte = new byte[1];
        this.endReached = false;
        this.in = is;
        this.blockSize = blockSize;
        this.decompressBuf = new byte[blockSize * 3];
        this.readIndex = 0;
        this.writeIndex = 0;
        int readSize = (int) readSize();
        this.size = readSize;
        this.uncompressedBytesRemaining = readSize;
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        if (read(this.oneByte, 0, 1) == -1) {
            return -1;
        }
        return this.oneByte[0] & 255;
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.in.close();
    }

    @Override // java.io.InputStream
    public int available() {
        return this.writeIndex - this.readIndex;
    }

    @Override // java.io.InputStream
    public int read(byte[] b, int off, int len) throws IOException {
        if (this.endReached) {
            return -1;
        }
        int avail = available();
        if (len > avail) {
            fill(len - avail);
        }
        int readable = Math.min(len, available());
        System.arraycopy(this.decompressBuf, this.readIndex, b, off, readable);
        this.readIndex += readable;
        if (this.readIndex > this.blockSize) {
            slideBuffer();
        }
        return readable;
    }

    private void fill(int len) throws IOException {
        if (this.uncompressedBytesRemaining == 0) {
            this.endReached = true;
        }
        int readNow = Math.min(len, this.uncompressedBytesRemaining);
        while (readNow > 0) {
            int b = readOneByte();
            int length = 0;
            switch (b & 3) {
                case 0:
                    length = readLiteralLength(b);
                    if (!expandLiteral(length)) {
                        break;
                    } else {
                        return;
                    }
                case 1:
                    length = 4 + ((b >> 2) & 7);
                    long offset = (b & 224) << 3;
                    if (!expandCopy(offset | readOneByte(), length)) {
                        break;
                    } else {
                        return;
                    }
                case 2:
                    length = (b >> 2) + 1;
                    long offset2 = readOneByte();
                    if (!expandCopy(offset2 | (readOneByte() << 8), length)) {
                        break;
                    } else {
                        return;
                    }
                case 3:
                    length = (b >> 2) + 1;
                    long offset3 = readOneByte();
                    if (!expandCopy(offset3 | (readOneByte() << 8) | (readOneByte() << 16) | (readOneByte() << 24), length)) {
                        break;
                    } else {
                        return;
                    }
            }
            readNow -= length;
            this.uncompressedBytesRemaining -= length;
        }
    }

    private void slideBuffer() {
        System.arraycopy(this.decompressBuf, this.blockSize, this.decompressBuf, 0, this.blockSize * 2);
        this.writeIndex -= this.blockSize;
        this.readIndex -= this.blockSize;
    }

    private int readLiteralLength(int b) throws IOException {
        int length;
        switch (b >> 2) {
            case 60:
                length = readOneByte();
                break;
            case 61:
                int length2 = readOneByte();
                length = length2 | (readOneByte() << 8);
                break;
            case 62:
                int length3 = readOneByte();
                length = length3 | (readOneByte() << 8) | (readOneByte() << 16);
                break;
            case 63:
                int length4 = readOneByte();
                length = (int) (length4 | (readOneByte() << 8) | (readOneByte() << 16) | (readOneByte() << 24));
                break;
            default:
                length = b >> 2;
                break;
        }
        return length + 1;
    }

    private boolean expandLiteral(int length) throws IOException {
        int bytesRead = IOUtils.readFully(this.in, this.decompressBuf, this.writeIndex, length);
        count(bytesRead);
        if (length != bytesRead) {
            throw new IOException("Premature end of stream");
        }
        this.writeIndex += length;
        return this.writeIndex >= 2 * this.blockSize;
    }

    private boolean expandCopy(long off, int length) throws IOException {
        if (off > this.blockSize) {
            throw new IOException("Offset is larger than block size");
        }
        int offset = (int) off;
        if (offset == 1) {
            byte lastChar = this.decompressBuf[this.writeIndex - 1];
            for (int i = 0; i < length; i++) {
                byte[] bArr = this.decompressBuf;
                int i2 = this.writeIndex;
                this.writeIndex = i2 + 1;
                bArr[i2] = lastChar;
            }
        } else if (length < offset) {
            System.arraycopy(this.decompressBuf, this.writeIndex - offset, this.decompressBuf, this.writeIndex, length);
            this.writeIndex += length;
        } else {
            int fullRotations = length / offset;
            int pad = length - (offset * fullRotations);
            while (true) {
                int i3 = fullRotations;
                fullRotations--;
                if (i3 == 0) {
                    break;
                }
                System.arraycopy(this.decompressBuf, this.writeIndex - offset, this.decompressBuf, this.writeIndex, offset);
                this.writeIndex += offset;
            }
            if (pad > 0) {
                System.arraycopy(this.decompressBuf, this.writeIndex - offset, this.decompressBuf, this.writeIndex, pad);
                this.writeIndex += pad;
            }
        }
        return this.writeIndex >= 2 * this.blockSize;
    }

    private int readOneByte() throws IOException {
        int b = this.in.read();
        if (b == -1) {
            throw new IOException("Premature end of stream");
        }
        count(1);
        return b & 255;
    }

    private long readSize() throws IOException {
        int b;
        int index = 0;
        long sz = 0;
        do {
            b = readOneByte();
            int i = index;
            index++;
            sz |= (b & 127) << (i * 7);
        } while (0 != (b & CpioConstants.C_IWUSR));
        return sz;
    }

    public int getSize() {
        return this.size;
    }
}
