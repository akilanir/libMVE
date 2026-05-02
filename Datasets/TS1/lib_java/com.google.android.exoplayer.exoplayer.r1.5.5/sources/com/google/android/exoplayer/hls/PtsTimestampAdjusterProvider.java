package com.google.android.exoplayer.hls;

import android.util.SparseArray;
import com.google.android.exoplayer.extractor.ts.PtsTimestampAdjuster;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/hls/PtsTimestampAdjusterProvider.class */
public final class PtsTimestampAdjusterProvider {
    private final SparseArray<PtsTimestampAdjuster> ptsTimestampAdjusters = new SparseArray<>();

    public PtsTimestampAdjuster getAdjuster(boolean isMasterSource, int discontinuitySequence, long startTimeUs) {
        PtsTimestampAdjuster adjuster = this.ptsTimestampAdjusters.get(discontinuitySequence);
        if (isMasterSource && adjuster == null) {
            adjuster = new PtsTimestampAdjuster(startTimeUs);
            this.ptsTimestampAdjusters.put(discontinuitySequence, adjuster);
        }
        if (isMasterSource || (adjuster != null && adjuster.isInitialized())) {
            return adjuster;
        }
        return null;
    }

    public void reset() {
        this.ptsTimestampAdjusters.clear();
    }
}
