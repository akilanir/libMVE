package com.google.android.exoplayer.chunk;

import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.drm.DrmInitData;
import com.google.android.exoplayer.extractor.Extractor;
import com.google.android.exoplayer.extractor.ExtractorInput;
import com.google.android.exoplayer.extractor.ExtractorOutput;
import com.google.android.exoplayer.extractor.SeekMap;
import com.google.android.exoplayer.extractor.TrackOutput;
import com.google.android.exoplayer.util.Assertions;
import com.google.android.exoplayer.util.ParsableByteArray;
import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/chunk/ChunkExtractorWrapper.class */
public final class ChunkExtractorWrapper implements ExtractorOutput, TrackOutput {
    private final Extractor extractor;
    private boolean extractorInitialized;
    private SingleTrackOutput output;
    private boolean seenTrack;

    /* loaded from: com.google.android.exoplayer.exoplayer.r1.5.7.jar:com/google/android/exoplayer/chunk/ChunkExtractorWrapper$SingleTrackOutput.class */
    public interface SingleTrackOutput extends TrackOutput {
        void seekMap(SeekMap seekMap);

        void drmInitData(DrmInitData drmInitData);
    }

    public ChunkExtractorWrapper(Extractor extractor) {
        this.extractor = extractor;
    }

    public void init(SingleTrackOutput output) {
        this.output = output;
        if (!this.extractorInitialized) {
            this.extractor.init(this);
            this.extractorInitialized = true;
        } else {
            this.extractor.seek();
        }
    }

    public int read(ExtractorInput input) throws IOException, InterruptedException {
        int result = this.extractor.read(input, null);
        Assertions.checkState(result != 1);
        return result;
    }

    @Override // com.google.android.exoplayer.extractor.ExtractorOutput
    public TrackOutput track(int id) {
        Assertions.checkState(!this.seenTrack);
        this.seenTrack = true;
        return this;
    }

    @Override // com.google.android.exoplayer.extractor.ExtractorOutput
    public void endTracks() {
        Assertions.checkState(this.seenTrack);
    }

    @Override // com.google.android.exoplayer.extractor.ExtractorOutput
    public void seekMap(SeekMap seekMap) {
        this.output.seekMap(seekMap);
    }

    @Override // com.google.android.exoplayer.extractor.ExtractorOutput
    public void drmInitData(DrmInitData drmInitData) {
        this.output.drmInitData(drmInitData);
    }

    @Override // com.google.android.exoplayer.extractor.TrackOutput
    public void format(MediaFormat format) {
        this.output.format(format);
    }

    @Override // com.google.android.exoplayer.extractor.TrackOutput
    public int sampleData(ExtractorInput input, int length, boolean allowEndOfInput) throws IOException, InterruptedException {
        return this.output.sampleData(input, length, allowEndOfInput);
    }

    @Override // com.google.android.exoplayer.extractor.TrackOutput
    public void sampleData(ParsableByteArray data, int length) {
        this.output.sampleData(data, length);
    }

    @Override // com.google.android.exoplayer.extractor.TrackOutput
    public void sampleMetadata(long timeUs, int flags, int size, int offset, byte[] encryptionKey) {
        this.output.sampleMetadata(timeUs, flags, size, offset, encryptionKey);
    }
}
