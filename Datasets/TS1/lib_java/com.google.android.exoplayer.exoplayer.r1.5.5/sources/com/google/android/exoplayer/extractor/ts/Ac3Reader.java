package com.google.android.exoplayer.extractor.ts;

import com.google.android.exoplayer.C;
import com.google.android.exoplayer.MediaFormat;
import com.google.android.exoplayer.extractor.TrackOutput;
import com.google.android.exoplayer.util.Ac3Util;
import com.google.android.exoplayer.util.ParsableBitArray;
import com.google.android.exoplayer.util.ParsableByteArray;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/extractor/ts/Ac3Reader.class */
final class Ac3Reader extends ElementaryStreamReader {
    private static final int STATE_FINDING_SYNC = 0;
    private static final int STATE_READING_HEADER = 1;
    private static final int STATE_READING_SAMPLE = 2;
    private static final int HEADER_SIZE = 8;
    private final boolean isEac3;
    private final ParsableBitArray headerScratchBits;
    private final ParsableByteArray headerScratchBytes;
    private int state;
    private int bytesRead;
    private boolean lastByteWas0B;
    private long sampleDurationUs;
    private MediaFormat mediaFormat;
    private int sampleSize;
    private long timeUs;

    public Ac3Reader(TrackOutput output, boolean isEac3) {
        super(output);
        this.isEac3 = isEac3;
        this.headerScratchBits = new ParsableBitArray(new byte[8]);
        this.headerScratchBytes = new ParsableByteArray(this.headerScratchBits.data);
        this.state = 0;
    }

    @Override // com.google.android.exoplayer.extractor.ts.ElementaryStreamReader
    public void seek() {
        this.state = 0;
        this.bytesRead = 0;
        this.lastByteWas0B = false;
    }

    @Override // com.google.android.exoplayer.extractor.ts.ElementaryStreamReader
    public void packetStarted(long pesTimeUs, boolean dataAlignmentIndicator) {
        this.timeUs = pesTimeUs;
    }

    @Override // com.google.android.exoplayer.extractor.ts.ElementaryStreamReader
    public void consume(ParsableByteArray data) {
        while (data.bytesLeft() > 0) {
            switch (this.state) {
                case 0:
                    if (!skipToNextSync(data)) {
                        break;
                    } else {
                        this.state = 1;
                        this.headerScratchBytes.data[0] = 11;
                        this.headerScratchBytes.data[1] = 119;
                        this.bytesRead = 2;
                        break;
                    }
                case 1:
                    if (!continueRead(data, this.headerScratchBytes.data, 8)) {
                        break;
                    } else {
                        parseHeader();
                        this.headerScratchBytes.setPosition(0);
                        this.output.sampleData(this.headerScratchBytes, 8);
                        this.state = 2;
                        break;
                    }
                case 2:
                    int bytesToRead = Math.min(data.bytesLeft(), this.sampleSize - this.bytesRead);
                    this.output.sampleData(data, bytesToRead);
                    this.bytesRead += bytesToRead;
                    if (this.bytesRead != this.sampleSize) {
                        break;
                    } else {
                        this.output.sampleMetadata(this.timeUs, 1, this.sampleSize, 0, null);
                        this.timeUs += this.sampleDurationUs;
                        this.state = 0;
                        break;
                    }
            }
        }
    }

    @Override // com.google.android.exoplayer.extractor.ts.ElementaryStreamReader
    public void packetFinished() {
    }

    private boolean continueRead(ParsableByteArray source, byte[] target, int targetLength) {
        int bytesToRead = Math.min(source.bytesLeft(), targetLength - this.bytesRead);
        source.readBytes(target, this.bytesRead, bytesToRead);
        this.bytesRead += bytesToRead;
        return this.bytesRead == targetLength;
    }

    private boolean skipToNextSync(ParsableByteArray pesBuffer) {
        while (pesBuffer.bytesLeft() > 0) {
            if (!this.lastByteWas0B) {
                this.lastByteWas0B = pesBuffer.readUnsignedByte() == 11;
            } else {
                int secondByte = pesBuffer.readUnsignedByte();
                if (secondByte == 119) {
                    this.lastByteWas0B = false;
                    return true;
                }
                this.lastByteWas0B = secondByte == 11;
            }
        }
        return false;
    }

    private void parseHeader() {
        if (this.mediaFormat == null) {
            this.mediaFormat = this.isEac3 ? Ac3Util.parseEac3SyncframeFormat(this.headerScratchBits, null, -1L, null) : Ac3Util.parseAc3SyncframeFormat(this.headerScratchBits, null, -1L, null);
            this.output.format(this.mediaFormat);
        }
        this.sampleSize = this.isEac3 ? Ac3Util.parseEAc3SyncframeSize(this.headerScratchBits.data) : Ac3Util.parseAc3SyncframeSize(this.headerScratchBits.data);
        int audioSamplesPerSyncframe = this.isEac3 ? Ac3Util.parseEAc3SyncframeAudioSampleCount(this.headerScratchBits.data) : Ac3Util.getAc3SyncframeAudioSampleCount();
        this.sampleDurationUs = (int) ((C.MICROS_PER_SECOND * audioSamplesPerSyncframe) / this.mediaFormat.sampleRate);
    }
}
