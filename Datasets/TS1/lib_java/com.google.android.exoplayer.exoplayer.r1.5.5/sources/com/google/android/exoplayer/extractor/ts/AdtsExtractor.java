package com.google.android.exoplayer.extractor.ts;

import com.google.android.exoplayer.extractor.Extractor;
import com.google.android.exoplayer.extractor.ExtractorInput;
import com.google.android.exoplayer.extractor.ExtractorOutput;
import com.google.android.exoplayer.extractor.PositionHolder;
import com.google.android.exoplayer.extractor.SeekMap;
import com.google.android.exoplayer.util.ParsableBitArray;
import com.google.android.exoplayer.util.ParsableByteArray;
import com.google.android.exoplayer.util.Util;
import java.io.IOException;

/* loaded from: com.google.android.exoplayer.exoplayer.r1.5.5.jar:com/google/android/exoplayer/extractor/ts/AdtsExtractor.class */
public final class AdtsExtractor implements Extractor {
    private static final int MAX_PACKET_SIZE = 200;
    private static final int ID3_TAG = Util.getIntegerCodeForString("ID3");
    private static final int MAX_SNIFF_BYTES = 8192;
    private final long firstSampleTimestampUs;
    private final ParsableByteArray packetBuffer;
    private AdtsReader adtsReader;
    private boolean startedPacket;

    public AdtsExtractor() {
        this(0L);
    }

    public AdtsExtractor(long firstSampleTimestampUs) {
        this.firstSampleTimestampUs = firstSampleTimestampUs;
        this.packetBuffer = new ParsableByteArray(MAX_PACKET_SIZE);
    }

    @Override // com.google.android.exoplayer.extractor.Extractor
    public boolean sniff(ExtractorInput input) throws IOException, InterruptedException {
        ParsableByteArray scratch = new ParsableByteArray(10);
        ParsableBitArray scratchBits = new ParsableBitArray(scratch.data);
        int startPosition = 0;
        while (true) {
            input.peekFully(scratch.data, 0, 10);
            scratch.setPosition(0);
            if (scratch.readUnsignedInt24() != ID3_TAG) {
                break;
            }
            int length = ((scratch.data[6] & Byte.MAX_VALUE) << 21) | ((scratch.data[7] & Byte.MAX_VALUE) << 14) | ((scratch.data[8] & Byte.MAX_VALUE) << 7) | (scratch.data[9] & Byte.MAX_VALUE);
            startPosition += 10 + length;
            input.advancePeekPosition(length);
        }
        input.resetPeekPosition();
        input.advancePeekPosition(startPosition);
        int headerPosition = startPosition;
        int validFramesSize = 0;
        int validFramesCount = 0;
        while (true) {
            input.peekFully(scratch.data, 0, 2);
            scratch.setPosition(0);
            int syncBytes = scratch.readUnsignedShort();
            if ((syncBytes & 65526) != 65520) {
                validFramesCount = 0;
                validFramesSize = 0;
                input.resetPeekPosition();
                headerPosition++;
                if (headerPosition - startPosition >= MAX_SNIFF_BYTES) {
                    return false;
                }
                input.advancePeekPosition(headerPosition);
            } else {
                validFramesCount++;
                if (validFramesCount >= 4 && validFramesSize > 188) {
                    return true;
                }
                input.peekFully(scratch.data, 0, 4);
                scratchBits.setPosition(14);
                int frameSize = scratchBits.readBits(13);
                input.advancePeekPosition(frameSize - 6);
                validFramesSize += frameSize;
            }
        }
    }

    @Override // com.google.android.exoplayer.extractor.Extractor
    public void init(ExtractorOutput output) {
        this.adtsReader = new AdtsReader(output.track(0), output.track(1));
        output.endTracks();
        output.seekMap(SeekMap.UNSEEKABLE);
    }

    @Override // com.google.android.exoplayer.extractor.Extractor
    public void seek() {
        this.startedPacket = false;
        this.adtsReader.seek();
    }

    @Override // com.google.android.exoplayer.extractor.Extractor
    public int read(ExtractorInput input, PositionHolder seekPosition) throws IOException, InterruptedException {
        int bytesRead = input.read(this.packetBuffer.data, 0, MAX_PACKET_SIZE);
        if (bytesRead == -1) {
            return -1;
        }
        this.packetBuffer.setPosition(0);
        this.packetBuffer.setLimit(bytesRead);
        if (!this.startedPacket) {
            this.adtsReader.packetStarted(this.firstSampleTimestampUs, true);
            this.startedPacket = true;
        }
        this.adtsReader.consume(this.packetBuffer);
        return 0;
    }
}
