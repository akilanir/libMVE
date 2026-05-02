package com.google.android.exoplayer.extractor.ogg;

import com.google.android.exoplayer.extractor.ExtractorInput;
import com.google.android.exoplayer.extractor.ogg.OggUtil;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.ParsableByteArray;
import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/ogg/OggSeeker.class */
final class OggSeeker {
    private static final int MATCH_RANGE = 72000;
    private final OggUtil.PageHeader pageHeader = new OggUtil.PageHeader();
    private final ParsableByteArray headerArray = new ParsableByteArray(282);
    private long audioDataLength = -1;
    private long totalSamples;

    OggSeeker() {
    }

    public void setup(long audioDataLength, long totalSamples) {
        Assertions.checkArgument(audioDataLength > 0 && totalSamples > 0);
        this.audioDataLength = audioDataLength;
        this.totalSamples = totalSamples;
    }

    public void reset() {
        this.pageHeader.reset();
        this.headerArray.reset();
    }

    public long getNextSeekPosition(long targetGranule, ExtractorInput input) throws IOException, InterruptedException {
        Assertions.checkState((this.audioDataLength == -1 || this.totalSamples == 0) ? false : true);
        OggUtil.populatePageHeader(input, this.pageHeader, this.headerArray, false);
        long granuleDistance = targetGranule - this.pageHeader.granulePosition;
        if (granuleDistance <= 0 || granuleDistance > 72000) {
            long offset = (this.pageHeader.bodySize + this.pageHeader.headerSize) * (granuleDistance <= 0 ? 2 : 1);
            return (input.getPosition() - offset) + ((granuleDistance * this.audioDataLength) / this.totalSamples);
        }
        input.resetPeekPosition();
        return -1L;
    }
}
