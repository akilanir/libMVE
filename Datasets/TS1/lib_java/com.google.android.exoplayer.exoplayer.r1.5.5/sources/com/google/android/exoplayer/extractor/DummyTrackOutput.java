package com.google.android.exoplayer.extractor;

import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.util.ParsableByteArray;
import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/extractor/DummyTrackOutput.class */
public class DummyTrackOutput implements TrackOutput {
    @Override // com.google.android.exoplayer.extractor.TrackOutput
    public void format(MediaFormat format) {
    }

    @Override // com.google.android.exoplayer.extractor.TrackOutput
    public int sampleData(ExtractorInput input, int length, boolean allowEndOfInput) throws IOException, InterruptedException {
        return input.skip(length);
    }

    @Override // com.google.android.exoplayer.extractor.TrackOutput
    public void sampleData(ParsableByteArray data, int length) {
        data.skipBytes(length);
    }

    @Override // com.google.android.exoplayer.extractor.TrackOutput
    public void sampleMetadata(long timeUs, int flags, int size, int offset, byte[] encryptionKey) {
    }
}
