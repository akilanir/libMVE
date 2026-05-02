package com.google.android.exoplayer.dash.mpd;

import com.google.android.exoplayer.dash.DashSegmentIndex;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/dash/mpd/DashSingleSegmentIndex.class */
final class DashSingleSegmentIndex implements DashSegmentIndex {
    private final RangedUri uri;

    public DashSingleSegmentIndex(RangedUri uri) {
        this.uri = uri;
    }

    @Override // com.google.android.exoplayer.dash.DashSegmentIndex
    public int getSegmentNum(long timeUs, long periodDurationUs) {
        return 0;
    }

    @Override // com.google.android.exoplayer.dash.DashSegmentIndex
    public long getTimeUs(int segmentNum) {
        return 0L;
    }

    @Override // com.google.android.exoplayer.dash.DashSegmentIndex
    public long getDurationUs(int segmentNum, long periodDurationUs) {
        return periodDurationUs;
    }

    @Override // com.google.android.exoplayer.dash.DashSegmentIndex
    public RangedUri getSegmentUrl(int segmentNum) {
        return this.uri;
    }

    @Override // com.google.android.exoplayer.dash.DashSegmentIndex
    public int getFirstSegmentNum() {
        return 0;
    }

    @Override // com.google.android.exoplayer.dash.DashSegmentIndex
    public int getLastSegmentNum(long periodDurationUs) {
        return 0;
    }

    @Override // com.google.android.exoplayer.dash.DashSegmentIndex
    public boolean isExplicit() {
        return true;
    }
}
