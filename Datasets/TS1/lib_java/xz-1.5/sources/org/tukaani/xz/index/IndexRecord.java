package org.tukaani.xz.index;

/* loaded from: xz-1.5.jar:org/tukaani/xz/index/IndexRecord.class */
class IndexRecord {
    final long unpadded;
    final long uncompressed;

    IndexRecord(long j, long j2) {
        this.unpadded = j;
        this.uncompressed = j2;
    }
}
