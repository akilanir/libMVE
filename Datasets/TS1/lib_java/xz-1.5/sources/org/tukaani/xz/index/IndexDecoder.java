package org.tukaani.xz.index;

import java.io.EOFException;
import java.io.IOException;
import java.util.zip.CRC32;
import java.util.zip.CheckedInputStream;
import org.tukaani.xz.CorruptedInputException;
import org.tukaani.xz.MemoryLimitException;
import org.tukaani.xz.SeekableInputStream;
import org.tukaani.xz.UnsupportedOptionsException;
import org.tukaani.xz.common.DecoderUtil;
import org.tukaani.xz.common.StreamFlags;

/* loaded from: xz-1.5.jar:org/tukaani/xz/index/IndexDecoder.class */
public class IndexDecoder extends IndexBase {
    private final StreamFlags streamFlags;
    private final long streamPadding;
    private final int memoryUsage;
    private final long[] unpadded;
    private final long[] uncompressed;
    private long largestBlockSize;
    private int recordOffset;
    private long compressedOffset;
    private long uncompressedOffset;
    static final boolean $assertionsDisabled;
    static Class class$org$tukaani$xz$index$IndexDecoder;

    public IndexDecoder(SeekableInputStream seekableInputStream, StreamFlags streamFlags, long j, int i) throws IOException {
        super(new CorruptedInputException("XZ Index is corrupt"));
        this.largestBlockSize = 0L;
        this.recordOffset = 0;
        this.compressedOffset = 0L;
        this.uncompressedOffset = 0L;
        this.streamFlags = streamFlags;
        this.streamPadding = j;
        long position = (seekableInputStream.position() + streamFlags.backwardSize) - 4;
        CRC32 crc32 = new CRC32();
        CheckedInputStream checkedInputStream = new CheckedInputStream(seekableInputStream, crc32);
        if (checkedInputStream.read() != 0) {
            throw new CorruptedInputException("XZ Index is corrupt");
        }
        try {
            long decodeVLI = DecoderUtil.decodeVLI(checkedInputStream);
            if (decodeVLI >= streamFlags.backwardSize / 2) {
                throw new CorruptedInputException("XZ Index is corrupt");
            }
            if (decodeVLI > 2147483647L) {
                throw new UnsupportedOptionsException("XZ Index has over 2147483647 Records");
            }
            this.memoryUsage = 1 + ((int) (((16 * decodeVLI) + 1023) / 1024));
            if (i >= 0 && this.memoryUsage > i) {
                throw new MemoryLimitException(this.memoryUsage, i);
            }
            this.unpadded = new long[(int) decodeVLI];
            this.uncompressed = new long[(int) decodeVLI];
            int i2 = 0;
            for (int i3 = (int) decodeVLI; i3 > 0; i3--) {
                long decodeVLI2 = DecoderUtil.decodeVLI(checkedInputStream);
                long decodeVLI3 = DecoderUtil.decodeVLI(checkedInputStream);
                if (seekableInputStream.position() > position) {
                    throw new CorruptedInputException("XZ Index is corrupt");
                }
                this.unpadded[i2] = this.blocksSum + decodeVLI2;
                this.uncompressed[i2] = this.uncompressedSum + decodeVLI3;
                i2++;
                super.add(decodeVLI2, decodeVLI3);
                if (!$assertionsDisabled && i2 != this.recordCount) {
                    throw new AssertionError();
                }
                if (this.largestBlockSize < decodeVLI3) {
                    this.largestBlockSize = decodeVLI3;
                }
            }
            int indexPaddingSize = getIndexPaddingSize();
            if (seekableInputStream.position() + indexPaddingSize != position) {
                throw new CorruptedInputException("XZ Index is corrupt");
            }
            do {
                int i4 = indexPaddingSize;
                indexPaddingSize--;
                if (i4 <= 0) {
                    long value = crc32.getValue();
                    for (int i5 = 0; i5 < 4; i5++) {
                        if (((value >>> (i5 * 8)) & 255) != seekableInputStream.read()) {
                            throw new CorruptedInputException("XZ Index is corrupt");
                        }
                    }
                    return;
                }
            } while (checkedInputStream.read() == 0);
            throw new CorruptedInputException("XZ Index is corrupt");
        } catch (EOFException e) {
            throw new CorruptedInputException("XZ Index is corrupt");
        }
    }

    public void setOffsets(IndexDecoder indexDecoder) {
        this.recordOffset = indexDecoder.recordOffset + ((int) indexDecoder.recordCount);
        this.compressedOffset = indexDecoder.compressedOffset + indexDecoder.getStreamSize() + indexDecoder.streamPadding;
        if (!$assertionsDisabled && (this.compressedOffset & 3) != 0) {
            throw new AssertionError();
        }
        this.uncompressedOffset = indexDecoder.uncompressedOffset + indexDecoder.uncompressedSum;
    }

    public int getMemoryUsage() {
        return this.memoryUsage;
    }

    public StreamFlags getStreamFlags() {
        return this.streamFlags;
    }

    public int getRecordCount() {
        return (int) this.recordCount;
    }

    public long getUncompressedSize() {
        return this.uncompressedSum;
    }

    public long getLargestBlockSize() {
        return this.largestBlockSize;
    }

    public boolean hasUncompressedOffset(long j) {
        return j >= this.uncompressedOffset && j < this.uncompressedOffset + this.uncompressedSum;
    }

    public boolean hasRecord(int i) {
        return i >= this.recordOffset && ((long) i) < ((long) this.recordOffset) + this.recordCount;
    }

    public void locateBlock(BlockInfo blockInfo, long j) {
        if (!$assertionsDisabled && j < this.uncompressedOffset) {
            throw new AssertionError();
        }
        long j2 = j - this.uncompressedOffset;
        if (!$assertionsDisabled && j2 >= this.uncompressedSum) {
            throw new AssertionError();
        }
        int i = 0;
        int length = this.unpadded.length - 1;
        while (i < length) {
            int i2 = i + ((length - i) / 2);
            if (this.uncompressed[i2] <= j2) {
                i = i2 + 1;
            } else {
                length = i2;
            }
        }
        setBlockInfo(blockInfo, this.recordOffset + i);
    }

    public void setBlockInfo(BlockInfo blockInfo, int i) {
        if (!$assertionsDisabled && i < this.recordOffset) {
            throw new AssertionError();
        }
        if (!$assertionsDisabled && i - this.recordOffset >= this.recordCount) {
            throw new AssertionError();
        }
        blockInfo.index = this;
        blockInfo.blockNumber = i;
        int i2 = i - this.recordOffset;
        if (i2 == 0) {
            blockInfo.compressedOffset = 0L;
            blockInfo.uncompressedOffset = 0L;
        } else {
            blockInfo.compressedOffset = (this.unpadded[i2 - 1] + 3) & (-4);
            blockInfo.uncompressedOffset = this.uncompressed[i2 - 1];
        }
        blockInfo.unpaddedSize = this.unpadded[i2] - blockInfo.compressedOffset;
        blockInfo.uncompressedSize = this.uncompressed[i2] - blockInfo.uncompressedOffset;
        blockInfo.compressedOffset += this.compressedOffset + 12;
        blockInfo.uncompressedOffset += this.uncompressedOffset;
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
        if (class$org$tukaani$xz$index$IndexDecoder == null) {
            cls = class$("org.tukaani.xz.index.IndexDecoder");
            class$org$tukaani$xz$index$IndexDecoder = cls;
        } else {
            cls = class$org$tukaani$xz$index$IndexDecoder;
        }
        $assertionsDisabled = !cls.desiredAssertionStatus();
    }
}
