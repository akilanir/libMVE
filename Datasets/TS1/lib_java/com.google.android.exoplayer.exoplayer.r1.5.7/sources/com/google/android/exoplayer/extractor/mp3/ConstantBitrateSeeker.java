package com.google.android.exoplayer.extractor.mp3;

import com.google.android.exoplayer.C;
import com.google.android.exoplayer.extractor.mp3.Mp3Extractor;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/extractor/mp3/ConstantBitrateSeeker.class */
final class ConstantBitrateSeeker implements Mp3Extractor.Seeker {
    private static final int BITS_PER_BYTE = 8;
    private final long firstFramePosition;
    private final int bitrate;
    private final long durationUs;

    public ConstantBitrateSeeker(long firstFramePosition, int bitrate, long inputLength) {
        this.firstFramePosition = firstFramePosition;
        this.bitrate = bitrate;
        this.durationUs = inputLength == -1 ? -1L : getTimeUs(inputLength);
    }

    @Override // com.google.android.exoplayer.extractor.SeekMap
    public boolean isSeekable() {
        return this.durationUs != -1;
    }

    @Override // com.google.android.exoplayer.extractor.SeekMap
    public long getPosition(long timeUs) {
        if (this.durationUs == -1) {
            return 0L;
        }
        return this.firstFramePosition + ((timeUs * this.bitrate) / 8000000);
    }

    @Override // com.google.android.exoplayer.extractor.mp3.Mp3Extractor.Seeker
    public long getTimeUs(long position) {
        return ((Math.max(0L, position - this.firstFramePosition) * C.MICROS_PER_SECOND) * 8) / this.bitrate;
    }

    @Override // com.google.android.exoplayer.extractor.mp3.Mp3Extractor.Seeker
    public long getDurationUs() {
        return this.durationUs;
    }
}
