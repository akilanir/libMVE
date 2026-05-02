package org.apache.commons.compress.archivers.dump;

import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.zip.DataFormatException;
import java.util.zip.Inflater;
import org.apache.commons.compress.archivers.dump.DumpArchiveConstants;
import org.apache.commons.compress.utils.IOUtils;

/* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/archivers/dump/TapeInputStream.class */
class TapeInputStream extends FilterInputStream {
    private byte[] blockBuffer;
    private int currBlkIdx;
    private int blockSize;
    private static final int recordSize = 1024;
    private int readOffset;
    private boolean isCompressed;
    private long bytesRead;

    public TapeInputStream(InputStream in) {
        super(in);
        this.blockBuffer = new byte[1024];
        this.currBlkIdx = -1;
        this.blockSize = 1024;
        this.readOffset = 1024;
        this.isCompressed = false;
        this.bytesRead = 0L;
    }

    public void resetBlockSize(int recsPerBlock, boolean isCompressed) throws IOException {
        this.isCompressed = isCompressed;
        this.blockSize = 1024 * recsPerBlock;
        byte[] oldBuffer = this.blockBuffer;
        this.blockBuffer = new byte[this.blockSize];
        System.arraycopy(oldBuffer, 0, this.blockBuffer, 0, 1024);
        readFully(this.blockBuffer, 1024, this.blockSize - 1024);
        this.currBlkIdx = 0;
        this.readOffset = 1024;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int available() throws IOException {
        if (this.readOffset < this.blockSize) {
            return this.blockSize - this.readOffset;
        }
        return this.in.available();
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read() throws IOException {
        throw new IllegalArgumentException("all reads must be multiple of record size (1024 bytes.");
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public int read(byte[] b, int off, int len) throws IOException {
        int i;
        int i2;
        if (len % 1024 != 0) {
            throw new IllegalArgumentException("all reads must be multiple of record size (1024 bytes.");
        }
        int bytes = 0;
        while (bytes < len) {
            if (this.readOffset == this.blockSize && !readBlock(true)) {
                return -1;
            }
            if (this.readOffset + (len - bytes) <= this.blockSize) {
                i = len;
                i2 = bytes;
            } else {
                i = this.blockSize;
                i2 = this.readOffset;
            }
            int n = i - i2;
            System.arraycopy(this.blockBuffer, this.readOffset, b, off, n);
            this.readOffset += n;
            bytes += n;
            off += n;
        }
        return bytes;
    }

    @Override // java.io.FilterInputStream, java.io.InputStream
    public long skip(long len) throws IOException {
        long j;
        if (len % 1024 != 0) {
            throw new IllegalArgumentException("all reads must be multiple of record size (1024 bytes.");
        }
        long j2 = 0;
        while (true) {
            long bytes = j2;
            if (bytes < len) {
                if (this.readOffset == this.blockSize) {
                    if (!readBlock(len - bytes < ((long) this.blockSize))) {
                        return -1L;
                    }
                }
                if (this.readOffset + (len - bytes) <= this.blockSize) {
                    j = len - bytes;
                } else {
                    j = this.blockSize - this.readOffset;
                }
                long n = j;
                this.readOffset = (int) (this.readOffset + n);
                j2 = bytes + n;
            } else {
                return bytes;
            }
        }
    }

    @Override // java.io.FilterInputStream, java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (this.in != null && this.in != System.in) {
            this.in.close();
        }
    }

    public byte[] peek() throws IOException {
        if (this.readOffset == this.blockSize && !readBlock(true)) {
            return null;
        }
        byte[] b = new byte[1024];
        System.arraycopy(this.blockBuffer, this.readOffset, b, 0, b.length);
        return b;
    }

    public byte[] readRecord() throws IOException {
        byte[] result = new byte[1024];
        if (-1 == read(result, 0, result.length)) {
            throw new ShortFileException();
        }
        return result;
    }

    private boolean readBlock(boolean decompress) throws IOException {
        boolean success;
        if (this.in == null) {
            throw new IOException("input buffer is closed");
        }
        if (!this.isCompressed || this.currBlkIdx == -1) {
            success = readFully(this.blockBuffer, 0, this.blockSize);
            this.bytesRead += this.blockSize;
        } else {
            if (!readFully(this.blockBuffer, 0, 4)) {
                return false;
            }
            this.bytesRead += 4;
            int h = DumpArchiveUtil.convert32(this.blockBuffer, 0);
            boolean compressed = (h & 1) == 1;
            if (!compressed) {
                success = readFully(this.blockBuffer, 0, this.blockSize);
                this.bytesRead += this.blockSize;
            } else {
                int flags = (h >> 1) & 7;
                int length = (h >> 4) & 268435455;
                byte[] compBuffer = new byte[length];
                success = readFully(compBuffer, 0, length);
                this.bytesRead += length;
                if (!decompress) {
                    Arrays.fill(this.blockBuffer, (byte) 0);
                } else {
                    switch (DumpArchiveConstants.COMPRESSION_TYPE.find(flags & 3)) {
                        case ZLIB:
                            try {
                                Inflater inflator = new Inflater();
                                inflator.setInput(compBuffer, 0, compBuffer.length);
                                if (inflator.inflate(this.blockBuffer) != this.blockSize) {
                                    throw new ShortFileException();
                                }
                                inflator.end();
                                break;
                            } catch (DataFormatException e) {
                                throw new DumpArchiveException("bad data", e);
                            }
                        case BZLIB:
                            throw new UnsupportedCompressionAlgorithmException("BZLIB2");
                        case LZO:
                            throw new UnsupportedCompressionAlgorithmException("LZO");
                        default:
                            throw new UnsupportedCompressionAlgorithmException();
                    }
                }
            }
        }
        this.currBlkIdx++;
        this.readOffset = 0;
        return success;
    }

    private boolean readFully(byte[] b, int off, int len) throws IOException {
        int count = IOUtils.readFully(this.in, b, off, len);
        if (count < len) {
            throw new ShortFileException();
        }
        return true;
    }

    public long getBytesRead() {
        return this.bytesRead;
    }
}
