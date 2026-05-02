package org.apache.commons.compress.utils;

import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteOrder;

/* loaded from: commons-compress-1.10.jar:org/apache/commons/compress/utils/BitInputStream.class */
public class BitInputStream implements Closeable {
    private static final int MAXIMUM_CACHE_SIZE = 63;
    private static final long[] MASKS = new long[64];
    private final InputStream in;
    private final ByteOrder byteOrder;
    private long bitsCached = 0;
    private int bitsCachedSize = 0;

    static {
        for (int i = 1; i <= MAXIMUM_CACHE_SIZE; i++) {
            MASKS[i] = (MASKS[i - 1] << 1) + 1;
        }
    }

    public BitInputStream(InputStream in, ByteOrder byteOrder) {
        this.in = in;
        this.byteOrder = byteOrder;
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        this.in.close();
    }

    public void clearBitCache() {
        this.bitsCached = 0L;
        this.bitsCachedSize = 0;
    }

    public long readBits(int count) throws IOException {
        long bitsOut;
        if (count < 0 || count > MAXIMUM_CACHE_SIZE) {
            throw new IllegalArgumentException("count must not be negative or greater than 63");
        }
        while (this.bitsCachedSize < count) {
            long nextByte = this.in.read();
            if (nextByte < 0) {
                return nextByte;
            }
            if (this.byteOrder == ByteOrder.LITTLE_ENDIAN) {
                this.bitsCached |= nextByte << this.bitsCachedSize;
            } else {
                this.bitsCached <<= 8;
                this.bitsCached |= nextByte;
            }
            this.bitsCachedSize += 8;
        }
        if (this.byteOrder == ByteOrder.LITTLE_ENDIAN) {
            bitsOut = this.bitsCached & MASKS[count];
            this.bitsCached >>>= count;
        } else {
            bitsOut = (this.bitsCached >> (this.bitsCachedSize - count)) & MASKS[count];
        }
        this.bitsCachedSize -= count;
        return bitsOut;
    }
}
