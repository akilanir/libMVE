package com.google.android.exoplayer.extractor;

import com.google.android.exoplayer.util.Util;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/ChunkIndex.class */
public final class ChunkIndex implements SeekMap {
    public final int length;
    public final int[] sizes;
    public final long[] offsets;
    public final long[] durationsUs;
    public final long[] timesUs;

    public ChunkIndex(int[] sizes, long[] offsets, long[] durationsUs, long[] timesUs) {
        this.length = sizes.length;
        this.sizes = sizes;
        this.offsets = offsets;
        this.durationsUs = durationsUs;
        this.timesUs = timesUs;
    }

    public int getChunkIndex(long timeUs) {
        return Util.binarySearchFloor(this.timesUs, timeUs, true, true);
    }

    @Override // com.google.android.exoplayer.extractor.SeekMap
    public boolean isSeekable() {
        return true;
    }

    @Override // com.google.android.exoplayer.extractor.SeekMap
    public long getPosition(long timeUs) {
        return this.offsets[getChunkIndex(timeUs)];
    }
}
