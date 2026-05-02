package org.tukaani.xz.index;

import org.tukaani.xz.XZIOException;
import org.tukaani.xz.common.Util;

/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: xz-1.5.jar:org/tukaani/xz/index/IndexBase.class */
public abstract class IndexBase {
    private final XZIOException invalidIndexException;
    long blocksSum = 0;
    long uncompressedSum = 0;
    long indexListSize = 0;
    long recordCount = 0;

    IndexBase(XZIOException xZIOException) {
        this.invalidIndexException = xZIOException;
    }

    private long getUnpaddedIndexSize() {
        return 1 + Util.getVLISize(this.recordCount) + this.indexListSize + 4;
    }

    public long getIndexSize() {
        return (getUnpaddedIndexSize() + 3) & (-4);
    }

    public long getStreamSize() {
        return 12 + this.blocksSum + getIndexSize() + 12;
    }

    int getIndexPaddingSize() {
        return (int) ((4 - getUnpaddedIndexSize()) & 3);
    }

    void add(long j, long j2) throws XZIOException {
        this.blocksSum += (j + 3) & (-4);
        this.uncompressedSum += j2;
        this.indexListSize += Util.getVLISize(j) + Util.getVLISize(j2);
        this.recordCount++;
        if (this.blocksSum < 0 || this.uncompressedSum < 0 || getIndexSize() > Util.BACKWARD_SIZE_MAX || getStreamSize() < 0) {
            throw this.invalidIndexException;
        }
    }
}
