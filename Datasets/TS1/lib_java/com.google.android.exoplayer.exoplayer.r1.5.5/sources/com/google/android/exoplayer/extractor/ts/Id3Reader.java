package com.google.android.exoplayer.extractor.ts;

import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.extractor.TrackOutput;
import com.google.android.exoplayer.util.ParsableByteArray;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/extractor/ts/Id3Reader.class */
final class Id3Reader extends ElementaryStreamReader {
    private static final int ID3_HEADER_SIZE = 10;
    private final ParsableByteArray id3Header;
    private boolean writingSample;
    private long sampleTimeUs;
    private int sampleSize;
    private int sampleBytesRead;

    public Id3Reader(TrackOutput output) {
        super(output);
        output.format(MediaFormat.createId3Format());
        this.id3Header = new ParsableByteArray(10);
    }

    @Override // com.google.android.exoplayer.extractor.ts.ElementaryStreamReader
    public void seek() {
        this.writingSample = false;
    }

    @Override // com.google.android.exoplayer.extractor.ts.ElementaryStreamReader
    public void packetStarted(long pesTimeUs, boolean dataAlignmentIndicator) {
        if (!dataAlignmentIndicator) {
            return;
        }
        this.writingSample = true;
        this.sampleTimeUs = pesTimeUs;
        this.sampleSize = 0;
        this.sampleBytesRead = 0;
    }

    @Override // com.google.android.exoplayer.extractor.ts.ElementaryStreamReader
    public void consume(ParsableByteArray data) {
        if (!this.writingSample) {
            return;
        }
        int bytesAvailable = data.bytesLeft();
        if (this.sampleBytesRead < 10) {
            int headerBytesAvailable = Math.min(bytesAvailable, 10 - this.sampleBytesRead);
            System.arraycopy(data.data, data.getPosition(), this.id3Header.data, this.sampleBytesRead, headerBytesAvailable);
            if (this.sampleBytesRead + headerBytesAvailable == 10) {
                this.id3Header.setPosition(6);
                this.sampleSize = 10 + this.id3Header.readSynchSafeInt();
            }
        }
        this.output.sampleData(data, bytesAvailable);
        this.sampleBytesRead += bytesAvailable;
    }

    @Override // com.google.android.exoplayer.extractor.ts.ElementaryStreamReader
    public void packetFinished() {
        if (!this.writingSample || this.sampleSize == 0 || this.sampleBytesRead != this.sampleSize) {
            return;
        }
        this.output.sampleMetadata(this.sampleTimeUs, 1, this.sampleSize, 0, null);
        this.writingSample = false;
    }
}
