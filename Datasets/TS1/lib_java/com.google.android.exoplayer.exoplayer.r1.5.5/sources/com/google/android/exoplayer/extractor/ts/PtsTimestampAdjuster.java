package com.google.android.exoplayer.extractor.ts;

import com.google.android.exoplayer.C;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/extractor/ts/PtsTimestampAdjuster.class */
public final class PtsTimestampAdjuster {
    public static final long DO_NOT_OFFSET = Long.MAX_VALUE;
    private static final long MAX_PTS_PLUS_ONE = 8589934592L;
    private final long firstSampleTimestampUs;
    private long timestampOffsetUs;
    private volatile long lastPts = Long.MIN_VALUE;

    public PtsTimestampAdjuster(long firstSampleTimestampUs) {
        this.firstSampleTimestampUs = firstSampleTimestampUs;
    }

    public void reset() {
        this.lastPts = Long.MIN_VALUE;
    }

    public boolean isInitialized() {
        return this.lastPts != Long.MIN_VALUE;
    }

    public long adjustTimestamp(long pts) {
        if (this.lastPts != Long.MIN_VALUE) {
            long closestWrapCount = (this.lastPts + 4294967296L) / MAX_PTS_PLUS_ONE;
            long ptsWrapBelow = pts + (MAX_PTS_PLUS_ONE * (closestWrapCount - 1));
            long ptsWrapAbove = pts + (MAX_PTS_PLUS_ONE * closestWrapCount);
            pts = Math.abs(ptsWrapBelow - this.lastPts) < Math.abs(ptsWrapAbove - this.lastPts) ? ptsWrapBelow : ptsWrapAbove;
        }
        long timeUs = ptsToUs(pts);
        if (this.firstSampleTimestampUs != Long.MAX_VALUE && this.lastPts == Long.MIN_VALUE) {
            this.timestampOffsetUs = this.firstSampleTimestampUs - timeUs;
        }
        this.lastPts = pts;
        return timeUs + this.timestampOffsetUs;
    }

    public static long ptsToUs(long pts) {
        return (pts * C.MICROS_PER_SECOND) / 90000;
    }

    public static long usToPts(long us) {
        return (us * 90000) / C.MICROS_PER_SECOND;
    }
}
