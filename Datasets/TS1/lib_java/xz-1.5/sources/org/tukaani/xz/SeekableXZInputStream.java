package org.tukaani.xz;

import java.io.DataInputStream;
import java.io.EOFException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import org.tukaani.xz.check.Check;
import org.tukaani.xz.common.DecoderUtil;
import org.tukaani.xz.common.StreamFlags;
import org.tukaani.xz.index.BlockInfo;
import org.tukaani.xz.index.IndexDecoder;

/* loaded from: xz-1.5.jar:org/tukaani/xz/SeekableXZInputStream.class */
public class SeekableXZInputStream extends SeekableInputStream {
    private SeekableInputStream in;
    private final int memoryLimit;
    private int indexMemoryUsage;
    private final ArrayList streams;
    private int checkTypes;
    private long uncompressedSize;
    private long largestBlockSize;
    private int blockCount;
    private final BlockInfo curBlockInfo;
    private final BlockInfo queriedBlockInfo;
    private Check check;
    private BlockInputStream blockDecoder;
    private long curPos;
    private long seekPos;
    private boolean seekNeeded;
    private boolean endReached;
    private IOException exception;
    private final byte[] tempBuf;
    static final boolean $assertionsDisabled;
    static Class class$org$tukaani$xz$SeekableXZInputStream;

    public SeekableXZInputStream(SeekableInputStream seekableInputStream) throws IOException {
        this(seekableInputStream, -1);
    }

    public SeekableXZInputStream(SeekableInputStream seekableInputStream, int i) throws IOException {
        this.indexMemoryUsage = 0;
        this.streams = new ArrayList();
        this.checkTypes = 0;
        this.uncompressedSize = 0L;
        this.largestBlockSize = 0L;
        this.blockCount = 0;
        this.blockDecoder = null;
        this.curPos = 0L;
        this.seekNeeded = false;
        this.endReached = false;
        this.exception = null;
        this.tempBuf = new byte[1];
        this.in = seekableInputStream;
        DataInputStream dataInputStream = new DataInputStream(seekableInputStream);
        seekableInputStream.seek(0L);
        byte[] bArr = new byte[XZ.HEADER_MAGIC.length];
        dataInputStream.readFully(bArr);
        if (!Arrays.equals(bArr, XZ.HEADER_MAGIC)) {
            throw new XZFormatException();
        }
        long length = seekableInputStream.length();
        if ((length & 3) != 0) {
            throw new CorruptedInputException("XZ file size is not a multiple of 4 bytes");
        }
        byte[] bArr2 = new byte[12];
        long j = 0;
        while (length > 0) {
            if (length < 12) {
                throw new CorruptedInputException();
            }
            seekableInputStream.seek(length - 12);
            dataInputStream.readFully(bArr2);
            if (bArr2[8] == 0 && bArr2[9] == 0 && bArr2[10] == 0 && bArr2[11] == 0) {
                j += 4;
                length -= 4;
            } else {
                long j2 = length - 12;
                StreamFlags decodeStreamFooter = DecoderUtil.decodeStreamFooter(bArr2);
                if (decodeStreamFooter.backwardSize >= j2) {
                    throw new CorruptedInputException("Backward Size in XZ Stream Footer is too big");
                }
                this.check = Check.getInstance(decodeStreamFooter.checkType);
                this.checkTypes |= 1 << decodeStreamFooter.checkType;
                seekableInputStream.seek(j2 - decodeStreamFooter.backwardSize);
                try {
                    IndexDecoder indexDecoder = new IndexDecoder(seekableInputStream, decodeStreamFooter, j, i);
                    this.indexMemoryUsage += indexDecoder.getMemoryUsage();
                    if (i >= 0) {
                        i -= indexDecoder.getMemoryUsage();
                        if (!$assertionsDisabled && i < 0) {
                            throw new AssertionError();
                        }
                    }
                    if (this.largestBlockSize < indexDecoder.getLargestBlockSize()) {
                        this.largestBlockSize = indexDecoder.getLargestBlockSize();
                    }
                    long streamSize = indexDecoder.getStreamSize() - 12;
                    if (j2 < streamSize) {
                        throw new CorruptedInputException("XZ Index indicates too big compressed size for the XZ Stream");
                    }
                    length = j2 - streamSize;
                    seekableInputStream.seek(length);
                    dataInputStream.readFully(bArr2);
                    if (!DecoderUtil.areStreamFlagsEqual(DecoderUtil.decodeStreamHeader(bArr2), decodeStreamFooter)) {
                        throw new CorruptedInputException("XZ Stream Footer does not match Stream Header");
                    }
                    this.uncompressedSize += indexDecoder.getUncompressedSize();
                    if (this.uncompressedSize < 0) {
                        throw new UnsupportedOptionsException("XZ file is too big");
                    }
                    this.blockCount += indexDecoder.getRecordCount();
                    if (this.blockCount < 0) {
                        throw new UnsupportedOptionsException("XZ file has over 2147483647 Blocks");
                    }
                    this.streams.add(indexDecoder);
                    j = 0;
                } catch (MemoryLimitException e) {
                    if (!$assertionsDisabled && i < 0) {
                        throw new AssertionError();
                    }
                    throw new MemoryLimitException(e.getMemoryNeeded() + this.indexMemoryUsage, i + this.indexMemoryUsage);
                }
            }
        }
        if (!$assertionsDisabled && length != 0) {
            throw new AssertionError();
        }
        this.memoryLimit = i;
        IndexDecoder indexDecoder2 = (IndexDecoder) this.streams.get(this.streams.size() - 1);
        for (int size = this.streams.size() - 2; size >= 0; size--) {
            IndexDecoder indexDecoder3 = (IndexDecoder) this.streams.get(size);
            indexDecoder3.setOffsets(indexDecoder2);
            indexDecoder2 = indexDecoder3;
        }
        IndexDecoder indexDecoder4 = (IndexDecoder) this.streams.get(this.streams.size() - 1);
        this.curBlockInfo = new BlockInfo(indexDecoder4);
        this.queriedBlockInfo = new BlockInfo(indexDecoder4);
    }

    public int getCheckTypes() {
        return this.checkTypes;
    }

    public int getIndexMemoryUsage() {
        return this.indexMemoryUsage;
    }

    public long getLargestBlockSize() {
        return this.largestBlockSize;
    }

    public int getStreamCount() {
        return this.streams.size();
    }

    public int getBlockCount() {
        return this.blockCount;
    }

    public long getBlockPos(int i) {
        locateBlockByNumber(this.queriedBlockInfo, i);
        return this.queriedBlockInfo.uncompressedOffset;
    }

    public long getBlockSize(int i) {
        locateBlockByNumber(this.queriedBlockInfo, i);
        return this.queriedBlockInfo.uncompressedSize;
    }

    public long getBlockCompPos(int i) {
        locateBlockByNumber(this.queriedBlockInfo, i);
        return this.queriedBlockInfo.compressedOffset;
    }

    public long getBlockCompSize(int i) {
        locateBlockByNumber(this.queriedBlockInfo, i);
        return (this.queriedBlockInfo.unpaddedSize + 3) & (-4);
    }

    public int getBlockCheckType(int i) {
        locateBlockByNumber(this.queriedBlockInfo, i);
        return this.queriedBlockInfo.getCheckType();
    }

    public int getBlockNumber(long j) {
        locateBlockByPos(this.queriedBlockInfo, j);
        return this.queriedBlockInfo.blockNumber;
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
        try {
            if (this.seekNeeded) {
                seek();
            }
        } catch (IOException e) {
            e = e;
            if (e instanceof EOFException) {
                e = new CorruptedInputException();
            }
            this.exception = e;
            if (i3 == 0) {
                throw e;
            }
        }
        if (this.endReached) {
            return -1;
        }
        while (i2 > 0) {
            if (this.blockDecoder == null) {
                seek();
                if (this.endReached) {
                    break;
                }
            }
            int read = this.blockDecoder.read(bArr, i, i2);
            if (read > 0) {
                this.curPos += read;
                i3 += read;
                i += read;
                i2 -= read;
            } else if (read == -1) {
                this.blockDecoder = null;
            }
        }
        return i3;
    }

    @Override // java.io.InputStream
    public int available() throws IOException {
        if (this.in == null) {
            throw new XZIOException("Stream closed");
        }
        if (this.exception != null) {
            throw this.exception;
        }
        if (this.endReached || this.seekNeeded || this.blockDecoder == null) {
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

    @Override // org.tukaani.xz.SeekableInputStream
    public long length() {
        return this.uncompressedSize;
    }

    @Override // org.tukaani.xz.SeekableInputStream
    public long position() throws IOException {
        if (this.in == null) {
            throw new XZIOException("Stream closed");
        }
        return this.seekNeeded ? this.seekPos : this.curPos;
    }

    @Override // org.tukaani.xz.SeekableInputStream
    public void seek(long j) throws IOException {
        if (this.in == null) {
            throw new XZIOException("Stream closed");
        }
        if (j < 0) {
            throw new XZIOException(new StringBuffer().append("Negative seek position: ").append(j).toString());
        }
        this.seekPos = j;
        this.seekNeeded = true;
    }

    public void seekToBlock(int i) throws IOException {
        if (this.in == null) {
            throw new XZIOException("Stream closed");
        }
        if (i < 0 || i >= this.blockCount) {
            throw new XZIOException(new StringBuffer().append("Invalid XZ Block number: ").append(i).toString());
        }
        this.seekPos = getBlockPos(i);
        this.seekNeeded = true;
    }

    private void seek() throws IOException {
        if (!this.seekNeeded) {
            if (this.curBlockInfo.hasNext()) {
                this.curBlockInfo.setNext();
                initBlockDecoder();
                return;
            }
            this.seekPos = this.curPos;
        }
        this.seekNeeded = false;
        if (this.seekPos >= this.uncompressedSize) {
            this.curPos = this.seekPos;
            this.blockDecoder = null;
            this.endReached = true;
            return;
        }
        this.endReached = false;
        locateBlockByPos(this.curBlockInfo, this.seekPos);
        if (this.curPos <= this.curBlockInfo.uncompressedOffset || this.curPos > this.seekPos) {
            this.in.seek(this.curBlockInfo.compressedOffset);
            this.check = Check.getInstance(this.curBlockInfo.getCheckType());
            initBlockDecoder();
            this.curPos = this.curBlockInfo.uncompressedOffset;
        }
        if (this.seekPos > this.curPos) {
            long j = this.seekPos - this.curPos;
            if (this.blockDecoder.skip(j) != j) {
                throw new CorruptedInputException();
            }
            this.curPos = this.seekPos;
        }
    }

    private void locateBlockByPos(BlockInfo blockInfo, long j) {
        IndexDecoder indexDecoder;
        if (j < 0 || j >= this.uncompressedSize) {
            throw new IndexOutOfBoundsException(new StringBuffer().append("Invalid uncompressed position: ").append(j).toString());
        }
        int i = 0;
        while (true) {
            indexDecoder = (IndexDecoder) this.streams.get(i);
            if (indexDecoder.hasUncompressedOffset(j)) {
                break;
            } else {
                i++;
            }
        }
        indexDecoder.locateBlock(blockInfo, j);
        if (!$assertionsDisabled && (blockInfo.compressedOffset & 3) != 0) {
            throw new AssertionError();
        }
        if (!$assertionsDisabled && blockInfo.uncompressedSize <= 0) {
            throw new AssertionError();
        }
        if (!$assertionsDisabled && j < blockInfo.uncompressedOffset) {
            throw new AssertionError();
        }
        if (!$assertionsDisabled && j >= blockInfo.uncompressedOffset + blockInfo.uncompressedSize) {
            throw new AssertionError();
        }
    }

    private void locateBlockByNumber(BlockInfo blockInfo, int i) {
        if (i < 0 || i >= this.blockCount) {
            throw new IndexOutOfBoundsException(new StringBuffer().append("Invalid XZ Block number: ").append(i).toString());
        }
        if (blockInfo.blockNumber == i) {
            return;
        }
        int i2 = 0;
        while (true) {
            IndexDecoder indexDecoder = (IndexDecoder) this.streams.get(i2);
            if (indexDecoder.hasRecord(i)) {
                indexDecoder.setBlockInfo(blockInfo, i);
                return;
            }
            i2++;
        }
    }

    private void initBlockDecoder() throws IOException {
        try {
            this.blockDecoder = null;
            this.blockDecoder = new BlockInputStream(this.in, this.check, this.memoryLimit, this.curBlockInfo.unpaddedSize, this.curBlockInfo.uncompressedSize);
        } catch (IndexIndicatorException e) {
            throw new CorruptedInputException();
        } catch (MemoryLimitException e2) {
            if (!$assertionsDisabled && this.memoryLimit < 0) {
                throw new AssertionError();
            }
            throw new MemoryLimitException(e2.getMemoryNeeded() + this.indexMemoryUsage, this.memoryLimit + this.indexMemoryUsage);
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
        if (class$org$tukaani$xz$SeekableXZInputStream == null) {
            cls = class$("org.tukaani.xz.SeekableXZInputStream");
            class$org$tukaani$xz$SeekableXZInputStream = cls;
        } else {
            cls = class$org$tukaani$xz$SeekableXZInputStream;
        }
        $assertionsDisabled = !cls.desiredAssertionStatus();
    }
}
