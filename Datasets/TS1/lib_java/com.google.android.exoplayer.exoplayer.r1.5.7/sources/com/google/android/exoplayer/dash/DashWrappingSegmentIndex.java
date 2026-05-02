package com.google.android.exoplayer.dash;

import com.google.android.exoplayer.dash.mpd.RangedUri;
import com.google.android.exoplayer.extractor.ChunkIndex;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/dash/DashWrappingSegmentIndex.class */
final class DashWrappingSegmentIndex implements DashSegmentIndex {
    private final ChunkIndex chunkIndex;
    private final String uri;

    public DashWrappingSegmentIndex(ChunkIndex chunkIndex, String uri) {
        this.chunkIndex = chunkIndex;
        this.uri = uri;
    }

    @Override // com.google.android.exoplayer.dash.DashSegmentIndex
    public int getFirstSegmentNum() {
        return 0;
    }

    @Override // com.google.android.exoplayer.dash.DashSegmentIndex
    public int getLastSegmentNum(long periodDurationUs) {
        return this.chunkIndex.length - 1;
    }

    @Override // com.google.android.exoplayer.dash.DashSegmentIndex
    public long getTimeUs(int segmentNum) {
        return this.chunkIndex.timesUs[segmentNum];
    }

    @Override // com.google.android.exoplayer.dash.DashSegmentIndex
    public long getDurationUs(int segmentNum, long periodDurationUs) {
        return this.chunkIndex.durationsUs[segmentNum];
    }

    @Override // com.google.android.exoplayer.dash.DashSegmentIndex
    public RangedUri getSegmentUrl(int segmentNum) {
        return new RangedUri(this.uri, null, this.chunkIndex.offsets[segmentNum], this.chunkIndex.sizes[segmentNum]);
    }

    @Override // com.google.android.exoplayer.dash.DashSegmentIndex
    public int getSegmentNum(long timeUs, long periodDurationUs) {
        return this.chunkIndex.getChunkIndex(timeUs);
    }

    @Override // com.google.android.exoplayer.dash.DashSegmentIndex
    public boolean isExplicit() {
        return true;
    }
}
